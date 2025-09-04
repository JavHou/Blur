import 'package:blur/features/abstraxion/services/simple_abstraxion_service.dart';
import 'package:blur/shared/buttons/full_width_button.dart';
import 'package:blur/shared/utils/localization_helper.dart';
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
          _error = context.l10n.cannotConnectToReactServer;
          _isLoading = false;
        });
        print('❌ 服务器连接失败');
      }
    } catch (e) {
      setState(() {
        _error = context.l10n.connectionFailed(e.toString());
        _isLoading = false;
      });
      print('❌ 连接异常: $e');
    }
  }

  /// 开始认证
  Future<void> _startAuthentication() async {
    if (!_service.isConnected) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.l10n.serverNotConnected),
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
          SnackBar(
            content: Text(context.l10n.completeAuthInBrowser),
            duration: Duration(seconds: 3),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.l10n.authStartFailed),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.l10n.authStartError(e.toString())),
          backgroundColor: Colors.red,
        ),
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
        title: Text(context.l10n.abstraxionAuth),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _service.resetConnection();
              _connectToServer();
            },
            tooltip: context.l10n.reconnect,
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
            ),
            SizedBox(height: 16),
            Text(
              context.l10n.connectingToServer,
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
              Text(
                context.l10n.connectionError,
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
                child: Text(context.l10n.retry),
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
          Text(
            context.l10n.blockchainAuth,
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            context.l10n.authInstructions,
            style: TextStyle(color: Colors.black54, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          FullWidthButton(
            text: context.l10n.startAuth,
            onPressed:
                _service.isConnected
                    ? () => _startAuthentication()
                    : () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(context.l10n.connectServerFirst),
                          backgroundColor: Colors.orange,
                        ),
                      );
                    },
          ),
          const SizedBox(height: 24),
          Text(
            context.l10n.serverStatus(
              _service.isConnected
                  ? context.l10n.connected
                  : context.l10n.disconnected,
            ),
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
