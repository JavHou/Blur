import 'dart:io';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

/// 简化的 Abstraxion 服务
/// 只负责：1. 连接远程React服务 2. 处理认证流程
class SimpleAbstraxionService {
  static final SimpleAbstraxionService _instance = SimpleAbstraxionService._();
  static SimpleAbstraxionService get instance => _instance;
  SimpleAbstraxionService._();

  String? _connectedServerUrl;

  // 可能的服务器地址列表
  static const List<String> _serverUrls = [
    'http://192.168.1.4:3000',
    'https://localhost:3000',
    'http://localhost:3000',
    'https://127.0.0.1:3000',
    'http://127.0.0.1:3000',
    'http://localhost:3001',
    'http://127.0.0.1:3001',
  ];

  static const Duration _timeout = Duration(seconds: 5);

  /// 连接到React服务器
  Future<String?> connectToServer() async {
    print('🔍 正在搜索可用的React服务器...');

    for (final url in _serverUrls) {
      print('🔗 尝试连接: $url');

      if (await _checkServer(url)) {
        _connectedServerUrl = url;
        print('✅ 成功连接到: $url');
        return url;
      }
    }

    print('❌ 未找到可用的React服务器');
    return null;
  }

  /// 检查服务器是否可用
  Future<bool> _checkServer(String url) async {
    try {
      final client = HttpClient();

      // HTTPS连接忽略证书错误（仅开发环境）
      if (url.startsWith('https://')) {
        client.badCertificateCallback = (cert, host, port) => true;
      }

      final request = await client.getUrl(Uri.parse(url));
      final response = await request.close().timeout(_timeout);

      if (response.statusCode == 200) {
        final body = await response.transform(utf8.decoder).join();
        client.close();

        // 检查是否是React应用
        final isReactApp =
            body.toLowerCase().contains('react') ||
            body.toLowerCase().contains('next') ||
            body.toLowerCase().contains('__next') ||
            body.toLowerCase().contains('abstraxion');

        return isReactApp;
      }

      client.close();
      return false;
    } catch (e) {
      print('❌ 服务器检查失败 $url: $e');
      return false;
    }
  }

  /// 启动认证流程
  Future<bool> startAuthentication() async {
    if (_connectedServerUrl == null) {
      final serverUrl = await connectToServer();
      if (serverUrl == null) {
        print('❌ 无法连接到服务器');
        return false;
      }
    }

    try {
      // 构建认证URL
      const callbackScheme = 'blur';
      final authUrl = Uri.parse(
        _connectedServerUrl!,
      ).replace(queryParameters: {'callback': callbackScheme});

      print('🌍 启动浏览器认证: $authUrl');

      // 启动外部浏览器
      final launched = await launchUrl(
        authUrl,
        mode: LaunchMode.externalApplication,
        webViewConfiguration: const WebViewConfiguration(
          enableJavaScript: true,
        ),
      );

      if (!launched) {
        print('❌ 无法启动浏览器');
        return false;
      }

      print('✅ 浏览器启动成功');
      return true;
    } catch (e) {
      print('❌ 启动认证失败: $e');
      return false;
    }
  }

  /// 获取连接状态
  bool get isConnected => _connectedServerUrl != null;

  /// 获取服务器URL
  String? get serverUrl => _connectedServerUrl;

  /// 重置连接
  void resetConnection() {
    _connectedServerUrl = null;
  }
}
