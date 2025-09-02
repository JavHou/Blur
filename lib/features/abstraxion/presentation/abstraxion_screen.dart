import 'package:blur/features/abstraxion/services/simple_abstraxion_service.dart';
import 'package:blur/shared/buttons/full_width_button.dart';
import 'package:flutter/material.dart';

class AbstraxionScreen extends StatefulWidget {
  const AbstraxionScreen({super.key});

  @override
  _AbstraxionScreenState createState() => _AbstraxionScreenState();
}

class _AbstraxionScreenState extends State<AbstraxionScreen> {
  final SimpleAbstraxionService _service = SimpleAbstraxionService.instance;

  bool _isLoading = false;
  String? _error;
  String? _serverUrl;

  @override
  void initState() {
    super.initState();
    _connectToServer();
  }

  /// 连接到服务器
  Future<void> _connectToServer() async {
    print('🚀 开始连接服务器...');
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final serverUrl = await _service.connectToServer();

      if (serverUrl != null) {
        setState(() {
          _serverUrl = serverUrl;
          _isLoading = false;
        });
        print('✅ 服务器连接成功: $serverUrl');
      } else {
        setState(() {
          _error = '无法连接到React服务器，请确保服务器正在运行';
          _isLoading = false;
        });
        print('❌ 服务器连接失败');
      }
    } catch (e) {
      setState(() {
        _error = '连接失败: $e';
        _isLoading = false;
      });
      print('❌ 连接异常: $e');
    }
  }

  /// 开始认证
  Future<void> _startAuthentication() async {
    if (!_service.isConnected) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('服务器未连接，请稍后重试'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final success = await _service.startAuthentication();

      setState(() {
        _isLoading = false;
      });

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('请在浏览器中完成认证...'),
            duration: Duration(seconds: 3),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('启动认证失败'), backgroundColor: Colors.red),
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('认证启动失败: $e'), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Abstraxion 认证'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _service.resetConnection();
              _connectToServer();
            },
            tooltip: '重新连接',
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
            ),
            SizedBox(height: 16),
            Text(
              '正在连接服务器...',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 64),
              const SizedBox(height: 16),
              const Text(
                '连接错误',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _error!,
                style: const TextStyle(color: Colors.black54, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _connectToServer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                ),
                child: const Text('重试'),
              ),
            ],
          ),
        ),
      );
    }

    // 显示认证界面
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.security, size: 80, color: Colors.purple),
          const SizedBox(height: 32),
          const Text(
            '区块链认证',
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            '点击下方按钮，在浏览器中完成安全认证',
            style: TextStyle(color: Colors.black54, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          FullWidthButton(
            text: '开始认证',
            onPressed:
                _service.isConnected
                    ? () => _startAuthentication()
                    : () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('请先连接服务器'),
                          backgroundColor: Colors.orange,
                        ),
                      );
                    },
          ),
          const SizedBox(height: 24),
          Text(
            '服务器状态: ${_service.isConnected ? "已连接" : "未连接"}',
            style: TextStyle(
              color: _service.isConnected ? Colors.purple : Colors.orange,
              fontSize: 14,
            ),
          ),
          if (_serverUrl != null) ...[
            const SizedBox(height: 8),
            Text(
              'URL: $_serverUrl',
              style: const TextStyle(
                color: Colors.black38,
                fontSize: 12,
                fontFamily: 'monospace',
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
