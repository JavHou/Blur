import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:blur/core/services/crossmint_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaymentService {
  static bool _isInitialized = false;

  /// 初始化 Stripe
  static Future<void> initializeStripe() async {
    if (_isInitialized) return;

    try {
      // 使用测试环境的 publishable key（从 Crossmint 响应中动态获取）
      // 这里先设置一个默认值，实际使用时会从订单响应中获取
      Stripe.publishableKey =
          'pk_test_51Kgzh2BX4XZcir6KbZt5alU7EhcGYp88NbECl7ZTgIBqAi8E5B9xnxat8ZTrGhmOMYQuEpP3jlx7brGVcxXa0E2S00ElGNYMtV';
      await Stripe.instance.applySettings();
      _isInitialized = true;
    } catch (e) {
      throw Exception('Stripe 初始化失败: $e');
    }
  }

  /// 处理支付流程
  static Future<PaymentResult> processPayment({
    required CrossmintOrderResponse orderResponse,
  }) async {
    try {
      // // 确保 Stripe 已初始化
      // if (!_isInitialized) {
      //   await Stripe.instance.applySettings();
      //   _isInitialized = true;
      // }
      // 使用订单响应中的 publishable key
      Stripe.publishableKey =
          orderResponse.order.payment.preparation.stripePublishableKey;
      await Stripe.instance.applySettings();

      // 创建 Payment Intent
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret:
              orderResponse.order.payment.preparation.stripeClientSecret,
          merchantDisplayName: 'Blur Dating App',
          customerId: null, // 如果有客户ID可以传入
          customerEphemeralKeySecret:
              orderResponse.order.payment.preparation.stripeEphemeralKeySecret,
          style: ThemeMode.system,
          appearance: const PaymentSheetAppearance(
            colors: PaymentSheetAppearanceColors(primary: Color(0xFF6C5CE7)),
          ),
        ),
      );

      // 显示支付界面
      await Stripe.instance.presentPaymentSheet();

      // 从 client secret 提取 payment intent ID
      // Client secret 格式通常是: pi_xxxxx_secret_xxxxx
      final clientSecret =
          orderResponse.order.payment.preparation.stripeClientSecret;
      final paymentIntentId = clientSecret.split('_secret_')[0];

      // 支付成功
      return PaymentResult(
        success: true,
        orderId: orderResponse.order.orderId,
        paymentIntentId: paymentIntentId,
        clientSecret: orderResponse.clientSecret,
        amount: orderResponse.order.quote.totalPrice.amountAsDouble,
        currency: orderResponse.order.quote.totalPrice.currency,
      );
    } on StripeException catch (e) {
      // Stripe 特定错误
      if (e.error.code == FailureCode.Canceled) {
        return PaymentResult(
          success: false,
          error: '支付已取消',
          errorCode: 'payment_canceled',
        );
      } else {
        return PaymentResult(
          success: false,
          error: '支付失败: ${e.error.message}',
          errorCode: e.error.code.toString(),
        );
      }
    } catch (e) {
      // 其他错误
      return PaymentResult(
        success: false,
        error: '支付处理失败: $e',
        errorCode: 'unknown_error',
      );
    }
  }

  /// 验证支付状态 - 使用 Crossmint API 验证订单状态
  static Future<bool> verifyPayment({
    required String orderId,
    required CrossmintService crossmintService,
  }) async {
    try {
      // 使用 Crossmint API key 查询订单状态
      const String apiKey =
          'sk_staging_9zhUHY8MTyLDusetYxqkVBTmC6UamMHowuVNRxFdxe4ZxoJV8R6iDrMqeRwR68w2w29DQcTLvF5mXTqy66m7QobZRFiZechvvhMLBHzFYEhMkbGFVjJFBvfVLSmVeBXzkvMRcqr3nuuK4py2uCPWTgHWbjzdjtLvmDs581HuRrFPPFKWKLWHDLDNWjtcdtmVdjxCEqWsKCVXtteJeXLMYUCH';

      final response = await http.get(
        Uri.parse(
          'https://staging.crossmint.com/api/2022-06-09/orders/$orderId',
        ),
        headers: {'X-API-KEY': apiKey, 'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final phase = data['phase'] as String;
        final paymentStatus = data['payment']?['status'] as String?;

        // 支付成功的状态
        // return phase == 'completed' && paymentStatus == 'completed';
        return paymentStatus == 'completed';
      } else {
        print('Crossmint API 验证失败: ${response.statusCode} - ${response.body}');
        return false;
      }
    } catch (e) {
      print('支付验证异常: $e');
      return false;
    }
  }
}

/// 支付结果类
class PaymentResult {
  final bool success;
  final String? orderId;
  final String? paymentIntentId;
  final String? clientSecret;
  final double? amount;
  final String? currency;
  final String? error;
  final String? errorCode;

  PaymentResult({
    required this.success,
    this.orderId,
    this.paymentIntentId,
    this.clientSecret,
    this.amount,
    this.currency,
    this.error,
    this.errorCode,
  });

  @override
  String toString() {
    return 'PaymentResult(success: $success, orderId: $orderId, paymentIntentId: $paymentIntentId, error: $error)';
  }
}
