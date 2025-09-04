import 'package:blur/features/dating/data/models/dating_model.dart';
import 'package:blur/features/dating/presentation/screens/dating_checkin_screen.dart';
import 'package:blur/features/dating/presentation/screens/dating_confirm_screen.dart';
import 'package:blur/features/dating/presentation/screens/dating_confirm_success_screen.dart';
import 'package:blur/features/dating/presentation/screens/dating_screen.dart';
import 'package:blur/features/setting/presentation/screens/subscription/screens/subscription_screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:blur/features/authentication/presentation/screens/forgot_password_screen.dart';
import 'package:blur/features/authentication/presentation/screens/login_screen.dart';
import 'package:blur/features/authentication/presentation/screens/onboarding_screen.dart';
import 'package:blur/features/authentication/presentation/screens/register_screen.dart';
import 'package:blur/features/authentication/presentation/screens/reset_password/reset_password_screen.dart';
import 'package:blur/features/authentication/presentation/screens/verification/otp_verification_screen.dart';
import 'package:blur/features/authentication/presentation/screens/register_success_screen.dart';
import 'package:blur/features/onboarding/presentation/screens/user_profile_onboarding_screen.dart';
import 'package:blur/features/chat/data/models/conversation_model.dart';
import 'package:blur/features/chat/presentation/screens/chat_screen.dart';
import 'package:blur/features/home/presentation/screens/home_screen.dart';
import 'package:blur/features/notification/presentation/screens/notification_screen.dart';
import 'package:blur/features/setting/presentation/screens/help/help_screen.dart';
import 'package:blur/features/setting/presentation/screens/notification_setting_screen.dart';
import 'package:blur/features/setting/presentation/screens/security_setting_screen.dart';
import 'package:blur/features/setting/presentation/screens/setting_screen.dart';
import 'package:blur/features/setting/presentation/screens/user/change_email_screen.dart';
import 'package:blur/features/setting/presentation/screens/user/change_password_screen.dart';
import 'package:blur/features/setting/presentation/screens/user/personal_information_screen.dart';
import 'package:blur/features/abstraxion/presentation/abstraxion_screen.dart';
import 'package:blur/features/abstraxion/services/account_service.dart';
import 'package:blur/shared/utils/localization_helper.dart';

final GoRouter router = GoRouter(
  initialLocation: "/",
  // 处理深链接的重定向逻辑
  redirect: (context, state) {
    final uri = state.uri;

    // 深链接格式: blur://auth/callback?address=...&success=true&timestamp=...
    if (uri.scheme == 'blur' && uri.path == '/callback') {
      // 重定向到回调处理页面，保留查询参数
      final queryString = uri.query.isNotEmpty ? '?${uri.query}' : '';
      return '/auth/callback$queryString';
    }

    return null; // 不重定向
  },
  routes: [
    GoRoute(path: '/', builder: (context, state) => OnboardingScreen()),
    GoRoute(
      path: '/login',
      builder: (context, state) {
        // 检查是否有认证回调参数和返回路径
        final granted = state.uri.queryParameters['granted'];
        final granter = state.uri.queryParameters['granter'];

        return LoginScreen(
          authCallbackGranted: granted,
          authCallbackGranter: granter,
        );
      },
    ),
    GoRoute(
      path: '/forgot-password',
      builder: (context, state) => ForgotPasswordScreen(),
    ),
    GoRoute(
      path: '/verify/otp',
      builder: (context, state) => OtpVerificationScreen(),
    ),
    GoRoute(
      path: '/reset-password',
      builder: (context, state) => ResetPasswordScreen(),
    ),
    GoRoute(path: '/register', builder: (context, state) => RegisterScreen()),
    GoRoute(
      path: '/register/success',
      builder: (context, state) => RegisterSuccessScreen(),
    ),
    GoRoute(
      path: '/profile/setup',
      builder: (context, state) => UserProfileOnboardingScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) {
        final showFilter = state.uri.queryParameters['showFilter'] == 'true';
        return HomeScreen(showFilterOnLoad: showFilter);
      },
    ),
    GoRoute(
      path: '/dating/:id/view',
      builder: (context, GoRouterState state) {
        final dating = state.extra as DatingModel?;
        final uuid = state.pathParameters['id']!;

        if (dating == null) {
          return Scaffold(
            body: Center(
              child: Builder(
                builder: (context) => Text(context.l10n.datingNotFound(uuid)),
              ),
            ),
          );
        }

        return DatingScreen(dating: dating);
      },
    ),
    GoRoute(
      path: '/dating/:id/confirm',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;
        final dating = extra?['dating'] as DatingModel?;
        final onUpdate = extra?['onUpdate'] as Function(DatingModel)?;
        final uuid = state.pathParameters['id']!;

        if (dating == null) {
          return Scaffold(
            body: Center(
              child: Builder(
                builder: (context) => Text(context.l10n.datingNotFound(uuid)),
              ),
            ),
          );
        }

        return DatingconfirmScreen(dating: dating, onDatingUpdated: onUpdate);
      },
    ),

    GoRoute(
      path: '/dating/:id/checkin',
      builder: (context, state) {
        // final extra = state.extra as Map<String, dynamic>?;
        // // final dating = extra?['dating'] as DatingModel?;
        // final uuid = state.pathParameters['id']!;

        // if (dating == null) {
        //   return Scaffold(
        //     body: Center(child: Text('Dating with uuid $uuid not found')),
        //   );
        // }

        return DatingCheckinScreen();
      },
    ),
    GoRoute(
      path: '/dating/:id/confirm/success',
      builder: (context, state) {
        final dating = state.extra as DatingModel?;
        final uuid = state.pathParameters['id']!;

        if (dating == null) {
          return Scaffold(
            body: Center(
              child: Builder(
                builder: (context) => Text(context.l10n.datingNotFound(uuid)),
              ),
            ),
          );
        }

        return DatingConfirmSuccessScreen(dating: dating);
      },
    ),

    GoRoute(
      path: '/chats/:id/view',
      builder: (context, GoRouterState state) {
        final conversation = state.extra as ConversationModel?;
        final uuid = state.pathParameters['id']!;

        if (conversation == null) {
          return Scaffold(
            body: Center(
              child: Builder(
                builder: (context) => Text(context.l10n.chatNotFound(uuid)),
              ),
            ),
          );
        }

        return ChatScreen(conversation: conversation);
      },
    ),

    GoRoute(
      path: '/notifications',
      builder: (context, state) => NotificationScreen(),
    ),
    GoRoute(path: '/setting', builder: (context, state) => SettingScreen()),
    GoRoute(path: '/setting/help', builder: (context, state) => HelpScreen()),
    GoRoute(
      path: '/setting/notification',
      builder: (context, state) => NotificationSettingScreen(),
    ),
    GoRoute(
      path: '/subscription',
      builder: (context, state) => SubscriptionScreens(),
    ),
    GoRoute(
      path: '/setting/security',
      builder: (context, state) => SecuritySettingScreen(),
    ),
    GoRoute(
      path: '/setting/personal-information',
      builder: (context, state) => PersonalInformationScreen(),
    ),
    GoRoute(
      path: '/setting/change-password',
      builder: (context, state) => ChangePasswordScreen(),
    ),
    GoRoute(
      path: '/setting/change-email',
      builder: (context, state) => ChangeEmailScreen(),
    ),
    GoRoute(
      path: '/abstraxion',
      builder: (context, state) => AbstraxionScreen(),
    ),
    GoRoute(
      path: '/auth/callback',
      builder: (context, state) {
        // 这是深度链接回调的处理页面
        // 获取参数
        final address = state.uri.queryParameters['address'];
        final success = state.uri.queryParameters['success'];

        // 延时1000ms后执行导航
        Future.delayed(Duration(milliseconds: 1000), () async {
          if (success == 'true' && address != null && address.isNotEmpty) {
            // 认证成功，保存钱包地址到账户
            try {
              final accountService = AccountService.instance;
              await accountService.saveWalletAddress(
                address,
                nickname: 'Javen Hou', // 可以从用户资料获取
                email: 'houjav@gmail.com', // 可以从用户资料获取
              );
              print('✅ 钱包地址已保存: $address');
            } catch (e) {
              print('❌ 保存钱包地址失败: $e');
            }

            // 跳转到成功页面
            context.go('/register/success');
          } else {
            // 认证失败，返回登录页面
            context.go('/login');
          }
        });

        // 显示一个临时的加载页面
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                ),
                SizedBox(height: 16),
                Text(
                  context.l10n.processingAuthResult,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          ),
        );
      },
    ),
  ],
);
