import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:blur/features/dating/data/models/dating_model.dart';

class CrossmintService {
  static const String _apiKey =
      'ck_staging_9zhUHY8MTyLDusetYxqkVBTmC6UamMHowuVNRxFdxe4ZxoJV8R6FReWp1J95BLg8aqbCeuDLJQ61bNLzJGvUE1mT1repDdEbd1zMJSvkthvz7isRs68hjrFg8TKwr7JTMmsKkRCSNoASrjqJopSZcSXvde73P4tiKRzbPJixXWkd7VfhtJSHwQq15Pusg3zNdwV9wTX1yqwr1F9JzNYXVa1v';
  static const String _baseUrl = 'https://staging.crossmint.com';
  static const String _collectionId =
      'crossmint:b51c9966-d956-4de2-8f45-11b15a837fa8';
  static const String _walletAddress =
      'xion125k53ljdeg3zkt95femhadklpwqdkwq7dxvz0ghr8ynmjvgvfpwq2smn5u';

  /// 创建 Crossmint NFT 订单
  Future<CrossmintOrderResponse> createNFTOrder({
    required DatingModel dating,
    required String userEmail,
    String? userName,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/api/2022-06-09/orders'),
        headers: {'Content-Type': 'application/json', 'X-API-KEY': _apiKey},
        body: jsonEncode({
          "locale": "en-US",
          "payment": {
            "method": "stripe-payment-element",
            "receiptEmail": userEmail,
          },
          "lineItems": {"collectionLocator": _collectionId},
          "recipient": {
            "walletAddress": _walletAddress,
            "physicalAddress": {
              "name": userName ?? "User",
              "line1": "Dating Confirmation Address",
              "city": "Shanghai",
              "state": "Shanghai",
              "postalCode": "200000",
              "country": "CN",
            },
          },
          "metadata": {
            "dating_id": dating.id,
            "dating_theme": dating.theme,
            "partner_name": dating.nickname,
            "dating_date": dating.dateTime.toIso8601String(),
            "venue_name": dating.venueName,
            "type": "dating_deposit_nft",
          },
        }),
      );

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return CrossmintOrderResponse.fromJson(data);
      } else {
        throw Exception('创建订单失败: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      throw Exception('创建 Crossmint 订单失败: $e');
    }
  }

  /// 查询订单状态
  Future<CrossmintOrderStatus> getOrderStatus(String orderId) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/api/2022-06-09/orders/$orderId'),
        headers: {'X-API-KEY': _apiKey},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return CrossmintOrderStatus.fromJson(data);
      } else {
        throw Exception('查询订单状态失败');
      }
    } catch (e) {
      throw Exception('获取订单状态失败: $e');
    }
  }
}

/// Crossmint 订单响应
class CrossmintOrderResponse {
  final String clientSecret;
  final CrossmintOrder order;

  CrossmintOrderResponse({required this.clientSecret, required this.order});

  factory CrossmintOrderResponse.fromJson(Map<String, dynamic> json) {
    return CrossmintOrderResponse(
      clientSecret: json['clientSecret'],
      order: CrossmintOrder.fromJson(json['order']),
    );
  }
}

/// Crossmint 订单信息
class CrossmintOrder {
  final String orderId;
  final String phase;
  final String locale;
  final List<CrossmintLineItem> lineItems;
  final CrossmintQuote quote;
  final CrossmintPayment payment;

  CrossmintOrder({
    required this.orderId,
    required this.phase,
    required this.locale,
    required this.lineItems,
    required this.quote,
    required this.payment,
  });

  factory CrossmintOrder.fromJson(Map<String, dynamic> json) {
    return CrossmintOrder(
      orderId: json['orderId'],
      phase: json['phase'],
      locale: json['locale'],
      lineItems:
          (json['lineItems'] as List)
              .map((item) => CrossmintLineItem.fromJson(item))
              .toList(),
      quote: CrossmintQuote.fromJson(json['quote']),
      payment: CrossmintPayment.fromJson(json['payment']),
    );
  }
}

/// Crossmint 商品项
class CrossmintLineItem {
  final String chain;
  final Map<String, dynamic> metadata;
  final CrossmintQuote quote;
  final int quantity;

  CrossmintLineItem({
    required this.chain,
    required this.metadata,
    required this.quote,
    required this.quantity,
  });

  factory CrossmintLineItem.fromJson(Map<String, dynamic> json) {
    return CrossmintLineItem(
      chain: json['chain'],
      metadata: json['metadata'],
      quote: CrossmintQuote.fromJson(json['quote']),
      quantity: json['quantity'],
    );
  }
}

/// Crossmint 报价信息
class CrossmintQuote {
  final String status;
  final CrossmintPrice totalPrice;

  CrossmintQuote({required this.status, required this.totalPrice});

  factory CrossmintQuote.fromJson(Map<String, dynamic> json) {
    return CrossmintQuote(
      status: json['status'],
      totalPrice: CrossmintPrice.fromJson(json['totalPrice']),
    );
  }
}

/// Crossmint 价格信息
class CrossmintPrice {
  final String amount;
  final String currency;

  CrossmintPrice({required this.amount, required this.currency});

  factory CrossmintPrice.fromJson(Map<String, dynamic> json) {
    return CrossmintPrice(amount: json['amount'], currency: json['currency']);
  }

  double get amountAsDouble => double.parse(amount);
}

/// Crossmint 支付信息
class CrossmintPayment {
  final String status;
  final String method;
  final String currency;
  final CrossmintStripePreparation preparation;
  final String receiptEmail;

  CrossmintPayment({
    required this.status,
    required this.method,
    required this.currency,
    required this.preparation,
    required this.receiptEmail,
  });

  factory CrossmintPayment.fromJson(Map<String, dynamic> json) {
    return CrossmintPayment(
      status: json['status'],
      method: json['method'],
      currency: json['currency'],
      preparation: CrossmintStripePreparation.fromJson(json['preparation']),
      receiptEmail: json['receiptEmail'],
    );
  }
}

/// Stripe 支付准备信息
class CrossmintStripePreparation {
  final String stripeClientSecret;
  final String stripePublishableKey;
  final String stripeEphemeralKeySecret;

  CrossmintStripePreparation({
    required this.stripeClientSecret,
    required this.stripePublishableKey,
    required this.stripeEphemeralKeySecret,
  });

  factory CrossmintStripePreparation.fromJson(Map<String, dynamic> json) {
    return CrossmintStripePreparation(
      stripeClientSecret: json['stripeClientSecret'],
      stripePublishableKey: json['stripePublishableKey'],
      stripeEphemeralKeySecret: json['stripeEphemeralKeySecret'],
    );
  }
}

/// Crossmint 订单状态
class CrossmintOrderStatus {
  final String orderId;
  final String phase;
  final String paymentStatus;
  final String? deliveryStatus;
  final Map<String, dynamic>? metadata;

  CrossmintOrderStatus({
    required this.orderId,
    required this.phase,
    required this.paymentStatus,
    this.deliveryStatus,
    this.metadata,
  });

  factory CrossmintOrderStatus.fromJson(Map<String, dynamic> json) {
    return CrossmintOrderStatus(
      orderId: json['orderId'],
      phase: json['phase'],
      paymentStatus: json['payment']['status'],
      deliveryStatus: json['lineItems']?[0]?['delivery']?['status'],
      metadata: json['metadata'],
    );
  }

  bool get isPaymentSuccessful => paymentStatus == 'succeeded';
  bool get isDeliveryComplete => deliveryStatus == 'delivered';
}
