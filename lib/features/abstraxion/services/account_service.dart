import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:blur/features/abstraxion/models/abstraxion_account.dart';

class AccountService {
  static const String _accountKey = 'abstraxion_account';

  static AccountService? _instance;
  static AccountService get instance => _instance ??= AccountService._();
  AccountService._();

  AbstraxionAccount? _currentAccount;

  /// 获取当前账户
  AbstraxionAccount? get currentAccount => _currentAccount;

  /// 初始化账户服务，加载保存的账户信息
  Future<void> initialize() async {
    await _loadAccount();
  }

  /// 保存钱包地址和账户信息
  Future<void> saveWalletAddress(
    String address, {
    String? nickname,
    String? email,
  }) async {
    final account = AbstraxionAccount(
      address: address,
      nickname: nickname ?? _currentAccount?.nickname,
      email: email ?? _currentAccount?.email,
      isConnected: true,
      connectedAt: DateTime.now(),
    );

    await _saveAccount(account);
    _currentAccount = account;
  }

  /// 更新账户信息
  Future<void> updateAccount({String? nickname, String? email}) async {
    if (_currentAccount == null) return;

    final updatedAccount = _currentAccount!.copyWith(
      nickname: nickname,
      email: email,
    );

    await _saveAccount(updatedAccount);
    _currentAccount = updatedAccount;
  }

  /// 断开连接
  Future<void> disconnect() async {
    if (_currentAccount == null) return;

    final disconnectedAccount = _currentAccount!.copyWith(isConnected: false);

    await _saveAccount(disconnectedAccount);
    _currentAccount = disconnectedAccount;
  }

  /// 清除账户信息
  Future<void> clearAccount() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_accountKey);
    _currentAccount = null;
  }

  /// 检查是否已连接钱包
  bool get isConnected => _currentAccount?.isConnected ?? false;

  /// 获取钱包地址
  String? get walletAddress => _currentAccount?.address;

  /// 获取格式化的钱包地址
  String get formattedWalletAddress => _currentAccount?.formattedAddress ?? '';

  /// 从 SharedPreferences 加载账户信息
  Future<void> _loadAccount() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final accountJson = prefs.getString(_accountKey);

      if (accountJson != null) {
        final accountData = jsonDecode(accountJson);
        _currentAccount = AbstraxionAccount.fromJson(accountData);
      }
    } catch (e) {
      print('加载账户信息失败: $e');
      _currentAccount = null;
    }
  }

  /// 保存账户信息到 SharedPreferences
  Future<void> _saveAccount(AbstraxionAccount account) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final accountJson = jsonEncode(account.toJson());
      await prefs.setString(_accountKey, accountJson);
    } catch (e) {
      print('保存账户信息失败: $e');
    }
  }
}
