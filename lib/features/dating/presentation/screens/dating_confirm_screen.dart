import 'dart:async';

import 'package:blur/features/dating/data/models/dating_model.dart';
import 'package:blur/features/dating/presentation/widgets/confirm_step/request_confirm_step_one.dart';
import 'package:blur/features/dating/presentation/widgets/confirm_step/request_confirm_step_two.dart';
import 'package:blur/features/home/presentation/widgets/tabs/meet_tab.dart';
import 'package:blur/core/services/crossmint_service.dart';
import 'package:blur/core/services/payment_service.dart';
import 'package:blur/shared/utils/localization_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:blur/shared/buttons/full_width_button.dart';

class DatingconfirmScreen extends StatefulWidget {
  final DatingModel dating;
  final Function(DatingModel)? onDatingUpdated;
  const DatingconfirmScreen({
    super.key,
    required this.dating,
    this.onDatingUpdated,
  });

  @override
  State<DatingconfirmScreen> createState() => _DatingconfirmScreenState();
}

class _DatingconfirmScreenState extends State<DatingconfirmScreen> {
  late PageController _pageController;
  int _currentStep = 0;

  bool _isLoading = false;

  late final Timer _timer = Timer(Duration.zero, () {});

  final CrossmintService _crossmintService = CrossmintService();

  // 押金相关配置
  static const String USER_EMAIL = 'houjav@gmail.com'; // 应该从用户资料获取
  static const String USER_NAME = 'Javen'; // 应该从用户资料获取

  void process() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // 步骤1: 初始化 Stripe
      await PaymentService.initializeStripe();

      // 步骤2: 创建 Crossmint NFT 订单
      final orderResponse = await _crossmintService.createNFTOrder(
        dating: widget.dating,
        userEmail: USER_EMAIL,
        userName: USER_NAME,
      );

      // 步骤3: 处理 Stripe 支付
      final paymentResult = await PaymentService.processPayment(
        orderResponse: orderResponse,
      );

      if (paymentResult.success) {
        // 步骤4: 验证支付状态
        final isVerified = await PaymentService.verifyPayment(
          orderId: paymentResult.orderId!,
          crossmintService: _crossmintService,
        );

        if (isVerified) {
          // 支付成功，更新约会状态
          await _handlePaymentSuccess(paymentResult);
        } else {
          throw Exception(context.l10n.error);
        }
      } else {
        // 支付失败或取消
        setState(() {
          _isLoading = false;
        });

        if (paymentResult.errorCode != 'payment_canceled') {
          _showErrorDialog(
            context.l10n.error,
            paymentResult.error ?? context.l10n.error,
          );
        }
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _showErrorDialog(context.l10n.error, '${context.l10n.error}: $e');
    }
  }

  Future<void> _handlePaymentSuccess(PaymentResult paymentResult) async {
    try {
      // 使用 copyWith 更新约会状态
      final updatedDating = widget.dating.copyWith(
        status: DatingStatus.upcoming,
        // 如果你的 DatingModel 有支付相关字段，在这里更新
        // depositTransactionId: paymentResult.orderId,
        // depositAmount: paymentResult.amount,
      );

      print('=== DatingconfirmScreen: Payment successful ===');
      print('Dating ID: ${updatedDating.id}');
      print('Order ID: ${paymentResult.orderId}');
      print('Amount: ${paymentResult.amount} ${paymentResult.currency}');

      // 更新全局约会列表
      final globalIndex = datings.indexWhere((d) => d.id == updatedDating.id);
      if (globalIndex != -1) {
        datings[globalIndex] = updatedDating;
        print('Updated global datings at index $globalIndex');
      }

      // 调用回调更新父组件
      widget.onDatingUpdated?.call(updatedDating);

      // 通知 MeetTab 刷新
      if (MeetTabState.globalRefreshCallback != null) {
        print('Calling MeetTabState.globalRefreshCallback');
        MeetTabState.globalRefreshCallback!();
      }

      setState(() {
        _isLoading = false;
      });

      // 返回结果并跳转到成功页面
      Navigator.of(context).pop(updatedDating);

      context.push(
        '/dating/${updatedDating.id}/confirm/success',
        extra: updatedDating,
      );
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _showErrorDialog(context.l10n.error, '${context.l10n.error}: $e');
    }
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(context.l10n.ok),
              ),
            ],
          ),
    );
  }

  String _getButtonText() {
    if (_currentStep <= 0) {
      return 'Continue'; // Using fallback as continueBtn may not exist
    } else {
      return _isLoading
          ? 'Processing Payment...'
          : context.l10n.buyNFTAndConfirm;
    }
  }

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${context.l10n.confirmDating} 🤩',
          style: theme.textTheme.labelLarge,
        ),
        leading: BackButton(
          onPressed: () {
            if (_currentStep > 0) {
              _pageController.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              setState(() {
                _currentStep = _currentStep - 1;
              });
            } else {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          RequestConfirmStepOne(dating: widget.dating),
          RequestConfirmStepTwo(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 60,
          child: FullWidthButton(
            text: _getButtonText(),
            isLoading: _isLoading,
            onPressed: () {
              if (_currentStep <= 0) {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
                setState(() {
                  _currentStep = _currentStep + 1;
                });
              } else {
                process();
              }
            },
          ),
        ),
      ),
    );
  }
}
