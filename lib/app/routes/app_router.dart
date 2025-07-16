import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:blur/features/authentication/presentation/screens/forgot_password_screen.dart';
import 'package:blur/features/authentication/presentation/screens/login_screen.dart';
import 'package:blur/features/authentication/presentation/screens/onboarding_screen.dart';
import 'package:blur/features/authentication/presentation/screens/register_screen.dart';
import 'package:blur/features/authentication/presentation/screens/reset_password/reset_password_screen.dart';
import 'package:blur/features/authentication/presentation/screens/verification/otp_verification_screen.dart';
import 'package:blur/features/authentication/presentation/screens/register_success_screen.dart';
import 'package:blur/features/category/presentation/screens/category_list_screen.dart';
import 'package:blur/features/category/presentation/screens/category_view_screen.dart';
import 'package:blur/features/chat/data/models/conversation_model.dart';
import 'package:blur/features/chat/presentation/screens/chat_screen.dart';
import 'package:blur/features/favorite/presentation/screens/favorite_list_screen.dart';
import 'package:blur/features/home/presentation/screens/home_screen.dart';
import 'package:blur/features/map/presentation/screens/map_view_screen.dart';
import 'package:blur/features/notification/presentation/screens/notification_screen.dart';
import 'package:blur/features/property/data/models/property_model.dart';
import 'package:blur/features/property/presentation/screens/properties_screen.dart';
import 'package:blur/features/property/presentation/screens/property_form_screen.dart';
import 'package:blur/features/property/presentation/screens/my_property_listing_screen.dart';
import 'package:blur/features/property/presentation/screens/property_screen.dart';
import 'package:blur/features/property/presentation/screens/property_tour_screen.dart';
import 'package:blur/features/property/presentation/screens/property_tour_success_screen.dart';
import 'package:blur/features/property/presentation/widgets/add_property/property_success_step.dart';
import 'package:blur/features/recently_viewed/presentation/screens/recently_viewed_list_screen.dart';
import 'package:blur/features/setting/presentation/screens/help/help_screen.dart';
import 'package:blur/features/setting/presentation/screens/notification_setting_screen.dart';
import 'package:blur/features/setting/presentation/screens/security_setting_screen.dart';
import 'package:blur/features/setting/presentation/screens/setting_screen.dart';
import 'package:blur/features/setting/presentation/screens/user/change_email_screen.dart';
import 'package:blur/features/setting/presentation/screens/user/change_password_screen.dart';
import 'package:blur/features/setting/presentation/screens/user/personal_information_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(path: '/', builder: (context, state) => OnboardingScreen()),
    GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
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
    GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
    GoRoute(
      path: '/categories',
      builder: (context, state) => CategoryListScreen(),
    ),
    GoRoute(
      path: '/categories/:id/view',
      builder: (context, state) => CategoryViewScreen(),
    ),
    GoRoute(
      path: '/property/:id/view',
      builder: (context, GoRouterState state) {
        final property = state.extra as PropertyModel?;
        final uuid = state.pathParameters['id']!;

        if (property == null) {
          return Scaffold(
            body: Center(child: Text('Property with uuid $uuid not found')),
          );
        }

        return PropertyScreen(property: property);
      },
    ),
    GoRoute(
      path: '/properties',
      builder: (context, state) => PropertiesScreen(),
    ),
    GoRoute(
      path: '/property/tour',
      builder: (context, state) => PropertyTourScreen(),
    ),
    GoRoute(
      path: '/property/tour/success',
      builder: (context, state) => PropertyTourSuccessScreen(),
    ),
    GoRoute(
      path: '/property/my/listing',
      builder: (context, state) => MyPropertyListingScreen(),
    ),
    GoRoute(
      path: '/property/add',
      builder: (context, state) => PropertyFormScreen(),
    ),
    GoRoute(
      path: '/property/add/success',
      builder: (context, state) => PropertySuccessStep(),
    ),

    GoRoute(path: '/map', builder: (context, state) => MapViewScreen()),

    GoRoute(
      path: '/chats/:id/view',
      builder: (context, GoRouterState state) {
        final conversation = state.extra as ConversationModel?;
        final uuid = state.pathParameters['id']!;

        if (conversation == null) {
          return Scaffold(
            body: Center(child: Text('Chat with uuid $uuid not found')),
          );
        }

        return ChatScreen(conversation: conversation);
      },
    ),

    GoRoute(
      path: '/notifications',
      builder: (context, state) => NotificationScreen(),
    ),
    GoRoute(
      path: '/favorite',
      builder: (context, state) => FavoriteListScreen(),
    ),
    GoRoute(
      path: '/recently-viewed',
      builder: (context, state) => RecentlyViewedListScreen(),
    ),
    GoRoute(path: '/setting', builder: (context, state) => SettingScreen()),
    GoRoute(path: '/setting/help', builder: (context, state) => HelpScreen()),
    GoRoute(
      path: '/setting/notification',
      builder: (context, state) => NotificationSettingScreen(),
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
  ],
);
