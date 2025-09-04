// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Blur`
  String get appName {
    return Intl.message(
      'Blur',
      name: 'appName',
      desc: 'The application name',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: 'Login button text',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: 'Register button text',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: 'Email field label',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: 'Password field label',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: 'Confirm password field label',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: 'Forgot password link text',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: 'Reset password button text',
      args: [],
    );
  }

  /// `Verification`
  String get verification {
    return Intl.message(
      'Verification',
      name: 'verification',
      desc: 'Verification screen title',
      args: [],
    );
  }

  /// `Verification Code`
  String get verificationCode {
    return Intl.message(
      'Verification Code',
      name: 'verificationCode',
      desc: 'Verification code field label',
      args: [],
    );
  }

  /// `Resend Code`
  String get resendCode {
    return Intl.message(
      'Resend Code',
      name: 'resendCode',
      desc: 'Resend verification code button text',
      args: [],
    );
  }

  /// `Welcome`
  String get onboarding {
    return Intl.message(
      'Welcome',
      name: 'onboarding',
      desc: 'Onboarding screen title',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: 'Home tab title',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: 'Chat tab title',
      args: [],
    );
  }

  /// `Dating`
  String get dating {
    return Intl.message(
      'Dating',
      name: 'dating',
      desc: 'Dating tab title',
      args: [],
    );
  }

  /// `Match`
  String get match {
    return Intl.message(
      'Match',
      name: 'match',
      desc: 'Match tab title',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: 'Settings tab title',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: 'Profile screen title',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: 'Notifications screen title',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: 'Search placeholder text',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: 'Filter button text',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: 'Location field label',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message(
      'Age',
      name: 'age',
      desc: 'Age field label',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: 'About section title',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: 'Gallery section title',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: 'Confirm button text',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: 'Cancel button text',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: 'Save button text',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: 'Edit button text',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: 'Delete button text',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: 'Share button text',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: 'Send button text',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message(
      'Message',
      name: 'message',
      desc: 'Message field label',
      args: [],
    );
  }

  /// `Conversation`
  String get conversation {
    return Intl.message(
      'Conversation',
      name: 'conversation',
      desc: 'Conversation screen title',
      args: [],
    );
  }

  /// `Dating Diary`
  String get datingDiary {
    return Intl.message(
      'Dating Diary',
      name: 'datingDiary',
      desc: 'Dating diary screen title',
      args: [],
    );
  }

  /// `Check In`
  String get checkin {
    return Intl.message(
      'Check In',
      name: 'checkin',
      desc: 'Check in button text',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: 'Success message',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: 'Error message',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
      desc: 'Loading message',
      args: [],
    );
  }

  /// `No data available`
  String get noData {
    return Intl.message(
      'No data available',
      name: 'noData',
      desc: 'No data message',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: 'Retry button text',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: 'Back button text',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: 'Next button text',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: 'Done button text',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: 'Close button text',
      args: [],
    );
  }

  /// `Processing authentication result...`
  String get processingAuthResult {
    return Intl.message(
      'Processing authentication result...',
      name: 'processingAuthResult',
      desc: 'Loading text for authentication callback page',
      args: [],
    );
  }

  /// `Dating with uuid {uuid} not found`
  String datingNotFound(String uuid) {
    return Intl.message(
      'Dating with uuid $uuid not found',
      name: 'datingNotFound',
      desc: 'Dating not found error message',
      args: [uuid],
    );
  }

  /// `Chat with uuid {uuid} not found`
  String chatNotFound(String uuid) {
    return Intl.message(
      'Chat with uuid $uuid not found',
      name: 'chatNotFound',
      desc: 'Chat not found error message',
      args: [uuid],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: 'Yes button text',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: 'No button text',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: 'OK button text',
      args: [],
    );
  }

  /// `Other Methods`
  String get otherMethods {
    return Intl.message(
      'Other Methods',
      name: 'otherMethods',
      desc: 'Other login methods text',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get noAccount {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'noAccount',
      desc: 'No account text',
      args: [],
    );
  }

  /// `Register Now`
  String get registerNow {
    return Intl.message(
      'Register Now',
      name: 'registerNow',
      desc: 'Register now link text',
      args: [],
    );
  }

  /// `Meet`
  String get meet {
    return Intl.message(
      'Meet',
      name: 'meet',
      desc: 'Meet tab title',
      args: [],
    );
  }

  /// `Match!`
  String get matchTab {
    return Intl.message(
      'Match!',
      name: 'matchTab',
      desc: 'Match tab title with exclamation',
      args: [],
    );
  }

  /// `Language Settings`
  String get languageSettings {
    return Intl.message(
      'Language Settings',
      name: 'languageSettings',
      desc: 'Language settings screen title',
      args: [],
    );
  }

  /// `Please restart the app to apply the new language settings`
  String get restartApp {
    return Intl.message(
      'Please restart the app to apply the new language settings',
      name: 'restartApp',
      desc: 'Restart app message',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: 'English language option',
      args: [],
    );
  }

  /// `中文`
  String get chinese {
    return Intl.message(
      '中文',
      name: 'chinese',
      desc: 'Chinese language option',
      args: [],
    );
  }

  /// `Select Language`
  String get selectLanguage {
    return Intl.message(
      'Select Language',
      name: 'selectLanguage',
      desc: 'Select language prompt',
      args: [],
    );
  }

  /// `Date & Time`
  String get dateTime {
    return Intl.message(
      'Date & Time',
      name: 'dateTime',
      desc: 'Date and time label',
      args: [],
    );
  }

  /// `Check-in successful!`
  String get checkinSuccess {
    return Intl.message(
      'Check-in successful!',
      name: 'checkinSuccess',
      desc: 'Check-in success message',
      args: [],
    );
  }

  /// `Diary`
  String get diary {
    return Intl.message(
      'Diary',
      name: 'diary',
      desc: 'Diary screen title',
      args: [],
    );
  }

  /// `Poster`
  String get poster {
    return Intl.message(
      'Poster',
      name: 'poster',
      desc: 'Poster section title',
      args: [],
    );
  }

  /// `Shared successfully!`
  String get shareSuccess {
    return Intl.message(
      'Shared successfully!',
      name: 'shareSuccess',
      desc: 'Share success message',
      args: [],
    );
  }

  /// `Upcoming`
  String get upcoming {
    return Intl.message(
      'Upcoming',
      name: 'upcoming',
      desc: 'Upcoming status',
      args: [],
    );
  }

  /// `Past`
  String get past {
    return Intl.message(
      'Past',
      name: 'past',
      desc: 'Past status',
      args: [],
    );
  }

  /// `Canceled`
  String get canceled {
    return Intl.message(
      'Canceled',
      name: 'canceled',
      desc: 'Canceled status',
      args: [],
    );
  }

  /// `🗓️ Add to Calendar`
  String get addToCalendar {
    return Intl.message(
      '🗓️ Add to Calendar',
      name: 'addToCalendar',
      desc: 'Add to calendar button text',
      args: [],
    );
  }

  /// `✅ Completed`
  String get completed {
    return Intl.message(
      '✅ Completed',
      name: 'completed',
      desc: 'Completed status',
      args: [],
    );
  }

  /// `⏱️ Pending`
  String get pending {
    return Intl.message(
      '⏱️ Pending',
      name: 'pending',
      desc: 'Pending status',
      args: [],
    );
  }

  /// `Date with {nickname}`
  String dateWith(String nickname) {
    return Intl.message(
      'Date with $nickname',
      name: 'dateWith',
      desc: 'Date with nickname text',
      args: [nickname],
    );
  }

  /// `Filter`
  String get filterTitle {
    return Intl.message(
      'Filter',
      name: 'filterTitle',
      desc: 'Filter title',
      args: [],
    );
  }

  /// `Distance Range`
  String get distanceRange {
    return Intl.message(
      'Distance Range',
      name: 'distanceRange',
      desc: 'Distance range label',
      args: [],
    );
  }

  /// `Min Distance (KM)`
  String get minDistance {
    return Intl.message(
      'Min Distance (KM)',
      name: 'minDistance',
      desc: 'Minimum distance input label',
      args: [],
    );
  }

  /// `Max Distance (KM)`
  String get maxDistance {
    return Intl.message(
      'Max Distance (KM)',
      name: 'maxDistance',
      desc: 'Maximum distance input label',
      args: [],
    );
  }

  /// `1 KM`
  String get minDistanceHint {
    return Intl.message(
      '1 KM',
      name: 'minDistanceHint',
      desc: 'Minimum distance input hint',
      args: [],
    );
  }

  /// `30 KM`
  String get maxDistanceHint {
    return Intl.message(
      '30 KM',
      name: 'maxDistanceHint',
      desc: 'Maximum distance input hint',
      args: [],
    );
  }

  /// `Free Time`
  String get freeTime {
    return Intl.message(
      'Free Time',
      name: 'freeTime',
      desc: 'Free time label',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: 'All option',
      args: [],
    );
  }

  /// `Weekend`
  String get weekend {
    return Intl.message(
      'Weekend',
      name: 'weekend',
      desc: 'Weekend option',
      args: [],
    );
  }

  /// `Apply Filter`
  String get applyFilter {
    return Intl.message(
      'Apply Filter',
      name: 'applyFilter',
      desc: 'Apply filter button',
      args: [],
    );
  }

  /// `Reset`
  String get resetFilter {
    return Intl.message(
      'Reset',
      name: 'resetFilter',
      desc: 'Reset filter button',
      args: [],
    );
  }

  /// `Dating Details`
  String get datingDetails {
    return Intl.message(
      'Dating Details',
      name: 'datingDetails',
      desc: 'Dating details screen title',
      args: [],
    );
  }

  /// `Check-in Successful`
  String get checkinSuccessTitle {
    return Intl.message(
      'Check-in Successful',
      name: 'checkinSuccessTitle',
      desc: 'Check-in success screen title',
      args: [],
    );
  }

  /// `Enjoy the sweet moments of meeting!`
  String get enjoySweetMoment {
    return Intl.message(
      'Enjoy the sweet moments of meeting!',
      name: 'enjoySweetMoment',
      desc: 'Blessing text on check-in success page',
      args: [],
    );
  }

  /// `Can't find them? Send them a message!`
  String get cantFindPartnerMessage {
    return Intl.message(
      'Can\'t find them? Send them a message!',
      name: 'cantFindPartnerMessage',
      desc: 'Message input hint on check-in success page',
      args: [],
    );
  }

  /// `Confirmation Successful`
  String get confirmSuccess {
    return Intl.message(
      'Confirmation Successful',
      name: 'confirmSuccess',
      desc: 'Confirm success screen title',
      args: [],
    );
  }

  /// `Share Poster to WeChat`
  String get shareToWechat {
    return Intl.message(
      'Share Poster to WeChat',
      name: 'shareToWechat',
      desc: 'Share to WeChat button',
      args: [],
    );
  }

  /// `Return Home`
  String get returnHome {
    return Intl.message(
      'Return Home',
      name: 'returnHome',
      desc: 'Return home button',
      args: [],
    );
  }

  /// `Dating Check-in`
  String get datingCheckin {
    return Intl.message(
      'Dating Check-in',
      name: 'datingCheckin',
      desc: 'Dating check-in button',
      args: [],
    );
  }

  /// `Share Dating Diary`
  String get shareDatingDiary {
    return Intl.message(
      'Share Dating Diary',
      name: 'shareDatingDiary',
      desc: 'Share dating diary button',
      args: [],
    );
  }

  /// `Submit Diary`
  String get submitDiary {
    return Intl.message(
      'Submit Diary',
      name: 'submitDiary',
      desc: 'Submit diary button',
      args: [],
    );
  }

  /// `What interesting things happened during the date? Or come and complain! AI will automatically beautify after submission`
  String get diaryPlaceholder {
    return Intl.message(
      'What interesting things happened during the date? Or come and complain! AI will automatically beautify after submission',
      name: 'diaryPlaceholder',
      desc: 'Diary input placeholder',
      args: [],
    );
  }

  /// `Confirm`
  String get buyNFTAndConfirm {
    return Intl.message(
      'Confirm',
      name: 'buyNFTAndConfirm',
      desc: 'Buy NFT and confirm button',
      args: [],
    );
  }

  /// `Processing Payment...`
  String get processingPayment {
    return Intl.message(
      'Processing Payment...',
      name: 'processingPayment',
      desc: 'Processing payment text',
      args: [],
    );
  }

  /// `Continue`
  String get continueBtn {
    return Intl.message(
      'Continue',
      name: 'continueBtn',
      desc: 'Continue button',
      args: [],
    );
  }

  /// `Membership Subscription`
  String get membershipSubscription {
    return Intl.message(
      'Membership Subscription',
      name: 'membershipSubscription',
      desc: 'Membership subscription option in profile',
      args: [],
    );
  }

  /// `See me, then talk to me`
  String get onboardingTagline {
    return Intl.message(
      'See me, then talk to me',
      name: 'onboardingTagline',
      desc: 'Onboarding screen tagline',
      args: [],
    );
  }

  /// `Let me think`
  String get letMeThink {
    return Intl.message(
      'Let me think',
      name: 'letMeThink',
      desc: 'Dating decision button text',
      args: [],
    );
  }

  /// `Confirm Dating`
  String get confirmDating {
    return Intl.message(
      'Confirm Dating',
      name: 'confirmDating',
      desc: 'Confirm dating button text',
      args: [],
    );
  }

  /// `How was your date with {nickname} today? Share any fun or interesting things with me, and I'll help polish it into a diary entry!`
  String datingFeedbackMessage(String nickname) {
    return Intl.message(
      'How was your date with $nickname today? Share any fun or interesting things with me, and I\'ll help polish it into a diary entry!',
      name: 'datingFeedbackMessage',
      desc: 'AI message asking for dating feedback',
      args: [nickname],
    );
  }

  /// `{nickname} is definitely your perfect dating partner!`
  String perfectDatingPartner(String nickname) {
    return Intl.message(
      '$nickname is definitely your perfect dating partner!',
      name: 'perfectDatingPartner',
      desc: 'Perfect dating partner text',
      args: [nickname],
    );
  }

  /// `Photo Album`
  String get photoAlbum {
    return Intl.message(
      'Photo Album',
      name: 'photoAlbum',
      desc: 'Photo album section title',
      args: [],
    );
  }

  /// `AI also discovered some commonalities between you`
  String get aiFoundCommonalities {
    return Intl.message(
      'AI also discovered some commonalities between you',
      name: 'aiFoundCommonalities',
      desc: 'AI found commonalities section title',
      args: [],
    );
  }

  /// `And some interesting differences`
  String get interestingDifferences {
    return Intl.message(
      'And some interesting differences',
      name: 'interestingDifferences',
      desc: 'Interesting differences section title',
      args: [],
    );
  }

  /// `Dating Diary`
  String get datingDiaryTitle {
    return Intl.message(
      'Dating Diary',
      name: 'datingDiaryTitle',
      desc: 'Dating diary section title',
      args: [],
    );
  }

  /// `FAQ`
  String get faq {
    return Intl.message(
      'FAQ',
      name: 'faq',
      desc: 'FAQ section title',
      args: [],
    );
  }

  /// `Is my date safe?`
  String get faqDatingSafetyQuestion {
    return Intl.message(
      'Is my date safe?',
      name: 'faqDatingSafetyQuestion',
      desc: 'FAQ question about dating safety',
      args: [],
    );
  }

  /// `We take user safety very seriously. All dates require a deposit, which is fully refunded after the date is completed. If there is a breach of contract without mutual agreement, the deposit will be transferred to the other party as compensation. Additionally, we provide safety features such as "one-touch emergency" and "real-time location sharing" to ensure your safety.`
  String get faqDatingSafetyAnswer {
    return Intl.message(
      'We take user safety very seriously. All dates require a deposit, which is fully refunded after the date is completed. If there is a breach of contract without mutual agreement, the deposit will be transferred to the other party as compensation. Additionally, we provide safety features such as "one-touch emergency" and "real-time location sharing" to ensure your safety.',
      name: 'faqDatingSafetyAnswer',
      desc: 'FAQ answer about dating safety',
      args: [],
    );
  }

  /// `What to do if I encounter danger during a date?`
  String get faqEmergencyQuestion {
    return Intl.message(
      'What to do if I encounter danger during a date?',
      name: 'faqEmergencyQuestion',
      desc: 'FAQ question about emergency situations',
      args: [],
    );
  }

  /// `Use the "one-touch emergency" feature in the platform to quickly contact the police, call the platform customer service hotline for help. The platform provides 24-hour safety protection for you.`
  String get faqEmergencyAnswer {
    return Intl.message(
      'Use the "one-touch emergency" feature in the platform to quickly contact the police, call the platform customer service hotline for help. The platform provides 24-hour safety protection for you.',
      name: 'faqEmergencyAnswer',
      desc: 'FAQ answer about emergency situations',
      args: [],
    );
  }

  /// `When will my deposit be refunded?`
  String get faqDepositRefundQuestion {
    return Intl.message(
      'When will my deposit be refunded?',
      name: 'faqDepositRefundQuestion',
      desc: 'FAQ question about deposit refund',
      args: [],
    );
  }

  /// `After both parties check in for the date, the deposit will be refunded to your account within 24 hours. If there is no check-in, the deposit will be transferred to the other party as breach compensation.`
  String get faqDepositRefundAnswer {
    return Intl.message(
      'After both parties check in for the date, the deposit will be refunded to your account within 24 hours. If there is no check-in, the deposit will be transferred to the other party as breach compensation.',
      name: 'faqDepositRefundAnswer',
      desc: 'FAQ answer about deposit refund',
      args: [],
    );
  }

  /// `Match Reason`
  String get matchReason {
    return Intl.message(
      'Match Reason',
      name: 'matchReason',
      desc: 'Match reason section title',
      args: [],
    );
  }

  /// `Show more`
  String get showMore {
    return Intl.message(
      'Show more',
      name: 'showMore',
      desc: 'Show more text for expandable content',
      args: [],
    );
  }

  /// `Show less`
  String get showLess {
    return Intl.message(
      'Show less',
      name: 'showLess',
      desc: 'Show less text for expandable content',
      args: [],
    );
  }

  /// `User Info`
  String get userInfo {
    return Intl.message(
      'User Info',
      name: 'userInfo',
      desc: 'User information section title',
      args: [],
    );
  }

  /// `Basic Info`
  String get basicInfo {
    return Intl.message(
      'Basic Info',
      name: 'basicInfo',
      desc: 'Basic information section title',
      args: [],
    );
  }

  /// `Age`
  String get ageRange {
    return Intl.message(
      'Age',
      name: 'ageRange',
      desc: 'Age range field label',
      args: [],
    );
  }

  /// `Height`
  String get height {
    return Intl.message(
      'Height',
      name: 'height',
      desc: 'Height field label',
      args: [],
    );
  }

  /// `Hometown`
  String get homeTown {
    return Intl.message(
      'Hometown',
      name: 'homeTown',
      desc: 'Hometown field label',
      args: [],
    );
  }

  /// `Education`
  String get education {
    return Intl.message(
      'Education',
      name: 'education',
      desc: 'Education field label',
      args: [],
    );
  }

  /// `Job`
  String get job {
    return Intl.message(
      'Job',
      name: 'job',
      desc: 'Job field label',
      args: [],
    );
  }

  /// `Your dating request with {nickname} has been sent!`
  String datingRequestSent(String nickname) {
    return Intl.message(
      'Your dating request with $nickname has been sent!',
      name: 'datingRequestSent',
      desc: 'Dating request sent message',
      args: [nickname],
    );
  }

  /// `Need help breaking the ice? AI has prepared dating tips for you`
  String get datingTipsTitle {
    return Intl.message(
      'Need help breaking the ice? AI has prepared dating tips for you',
      name: 'datingTipsTitle',
      desc: 'Dating tips section title',
      args: [],
    );
  }

  /// `Abstraxion Authentication`
  String get abstraxionAuth {
    return Intl.message(
      'Abstraxion Authentication',
      name: 'abstraxionAuth',
      desc: 'Abstraxion authentication screen title',
      args: [],
    );
  }

  /// `Reconnect`
  String get reconnect {
    return Intl.message(
      'Reconnect',
      name: 'reconnect',
      desc: 'Reconnect button tooltip',
      args: [],
    );
  }

  /// `Connecting to server...`
  String get connectingToServer {
    return Intl.message(
      'Connecting to server...',
      name: 'connectingToServer',
      desc: 'Connecting to server loading message',
      args: [],
    );
  }

  /// `Connection Error`
  String get connectionError {
    return Intl.message(
      'Connection Error',
      name: 'connectionError',
      desc: 'Connection error title',
      args: [],
    );
  }

  /// `Blockchain Authentication`
  String get blockchainAuth {
    return Intl.message(
      'Blockchain Authentication',
      name: 'blockchainAuth',
      desc: 'Blockchain authentication title',
      args: [],
    );
  }

  /// `Click the button below to complete secure authentication in your browser`
  String get authInstructions {
    return Intl.message(
      'Click the button below to complete secure authentication in your browser',
      name: 'authInstructions',
      desc: 'Authentication instructions text',
      args: [],
    );
  }

  /// `Start Authentication`
  String get startAuth {
    return Intl.message(
      'Start Authentication',
      name: 'startAuth',
      desc: 'Start authentication button text',
      args: [],
    );
  }

  /// `Server Status: {status}`
  String serverStatus(String status) {
    return Intl.message(
      'Server Status: $status',
      name: 'serverStatus',
      desc: 'Server status text',
      args: [status],
    );
  }

  /// `Connected`
  String get connected {
    return Intl.message(
      'Connected',
      name: 'connected',
      desc: 'Connected status',
      args: [],
    );
  }

  /// `Disconnected`
  String get disconnected {
    return Intl.message(
      'Disconnected',
      name: 'disconnected',
      desc: 'Disconnected status',
      args: [],
    );
  }

  /// `Server not connected, please try again later`
  String get serverNotConnected {
    return Intl.message(
      'Server not connected, please try again later',
      name: 'serverNotConnected',
      desc: 'Server not connected snackbar message',
      args: [],
    );
  }

  /// `Please complete authentication in your browser...`
  String get completeAuthInBrowser {
    return Intl.message(
      'Please complete authentication in your browser...',
      name: 'completeAuthInBrowser',
      desc: 'Complete authentication in browser message',
      args: [],
    );
  }

  /// `Failed to start authentication`
  String get authStartFailed {
    return Intl.message(
      'Failed to start authentication',
      name: 'authStartFailed',
      desc: 'Authentication start failed message',
      args: [],
    );
  }

  /// `Authentication start failed: {error}`
  String authStartError(String error) {
    return Intl.message(
      'Authentication start failed: $error',
      name: 'authStartError',
      desc: 'Authentication start error message',
      args: [error],
    );
  }

  /// `Please connect to server first`
  String get connectServerFirst {
    return Intl.message(
      'Please connect to server first',
      name: 'connectServerFirst',
      desc: 'Connect server first message',
      args: [],
    );
  }

  /// `Cannot connect to React server, please ensure the server is running`
  String get cannotConnectToReactServer {
    return Intl.message(
      'Cannot connect to React server, please ensure the server is running',
      name: 'cannotConnectToReactServer',
      desc: 'Cannot connect to React server error message',
      args: [],
    );
  }

  /// `Connection failed: {error}`
  String connectionFailed(String error) {
    return Intl.message(
      'Connection failed: $error',
      name: 'connectionFailed',
      desc: 'Connection failed error message',
      args: [error],
    );
  }

  /// `Start Your Blur Journey!`
  String get startBlurJourney {
    return Intl.message(
      'Start Your Blur Journey!',
      name: 'startBlurJourney',
      desc: 'Start Blur journey success message',
      args: [],
    );
  }

  /// `Start Now!`
  String get startNow {
    return Intl.message(
      'Start Now!',
      name: 'startNow',
      desc: 'Start now button text',
      args: [],
    );
  }

  /// `Account created successfully, please complete your profile to help AI better match your ideal type.`
  String get accountCreatedSuccess {
    return Intl.message(
      'Account created successfully, please complete your profile to help AI better match your ideal type.',
      name: 'accountCreatedSuccess',
      desc: 'Account creation success message',
      args: [],
    );
  }

  /// `What's your name?`
  String get whatIsYourName {
    return Intl.message(
      'What\'s your name?',
      name: 'whatIsYourName',
      desc: 'Name step screen title',
      args: [],
    );
  }

  /// `Please enter your name or nickname, this will serve as your personal identifier`
  String get nameDescription {
    return Intl.message(
      'Please enter your name or nickname, this will serve as your personal identifier',
      name: 'nameDescription',
      desc: 'Name step description',
      args: [],
    );
  }

  /// `Enter your name or nickname`
  String get enterNameHint {
    return Intl.message(
      'Enter your name or nickname',
      name: 'enterNameHint',
      desc: 'Name input hint text',
      args: [],
    );
  }

  /// `This name will be displayed in your profile`
  String get nameDisplayNote {
    return Intl.message(
      'This name will be displayed in your profile',
      name: 'nameDisplayNote',
      desc: 'Name display note',
      args: [],
    );
  }

  /// `What's your MBTI type?`
  String get yourMBTIType {
    return Intl.message(
      'What\'s your MBTI type?',
      name: 'yourMBTIType',
      desc: 'MBTI step screen title',
      args: [],
    );
  }

  /// `Please select your MBTI personality type, this will help us match you better`
  String get mbtiDescription {
    return Intl.message(
      'Please select your MBTI personality type, this will help us match you better',
      name: 'mbtiDescription',
      desc: 'MBTI step description',
      args: [],
    );
  }

  /// `Don't know your MBTI type? You can take an online test later`
  String get mbtiTestNote {
    return Intl.message(
      'Don\'t know your MBTI type? You can take an online test later',
      name: 'mbtiTestNote',
      desc: 'MBTI test note',
      args: [],
    );
  }

  /// `What are your hobbies?`
  String get yourHobbies {
    return Intl.message(
      'What are your hobbies?',
      name: 'yourHobbies',
      desc: 'Hobbies step screen title',
      args: [],
    );
  }

  /// `Please select your hobbies, multiple selections allowed`
  String get hobbiesDescription {
    return Intl.message(
      'Please select your hobbies, multiple selections allowed',
      name: 'hobbiesDescription',
      desc: 'Hobbies step description',
      args: [],
    );
  }

  /// `Selected {count} hobbies`
  String selectedHobbiesCount(int count) {
    return Intl.message(
      'Selected $count hobbies',
      name: 'selectedHobbiesCount',
      desc: 'Selected hobbies count',
      args: [count],
    );
  }

  /// `Movies`
  String get movies {
    return Intl.message(
      'Movies',
      name: 'movies',
      desc: 'Movies hobby',
      args: [],
    );
  }

  /// `Music`
  String get music {
    return Intl.message(
      'Music',
      name: 'music',
      desc: 'Music hobby',
      args: [],
    );
  }

  /// `Outdoor Sports`
  String get outdoorSports {
    return Intl.message(
      'Outdoor Sports',
      name: 'outdoorSports',
      desc: 'Outdoor sports hobby',
      args: [],
    );
  }

  /// `Food Exploring`
  String get foodExploring {
    return Intl.message(
      'Food Exploring',
      name: 'foodExploring',
      desc: 'Food exploring hobby',
      args: [],
    );
  }

  /// `Reading`
  String get reading {
    return Intl.message(
      'Reading',
      name: 'reading',
      desc: 'Reading hobby',
      args: [],
    );
  }

  /// `Travel`
  String get travel {
    return Intl.message(
      'Travel',
      name: 'travel',
      desc: 'Travel hobby',
      args: [],
    );
  }

  /// `Gaming`
  String get gaming {
    return Intl.message(
      'Gaming',
      name: 'gaming',
      desc: 'Gaming hobby',
      args: [],
    );
  }

  /// `Photography`
  String get photography {
    return Intl.message(
      'Photography',
      name: 'photography',
      desc: 'Photography hobby',
      args: [],
    );
  }

  /// `Fitness`
  String get fitness {
    return Intl.message(
      'Fitness',
      name: 'fitness',
      desc: 'Fitness hobby',
      args: [],
    );
  }

  /// `Painting`
  String get painting {
    return Intl.message(
      'Painting',
      name: 'painting',
      desc: 'Painting hobby',
      args: [],
    );
  }

  /// `Writing`
  String get writing {
    return Intl.message(
      'Writing',
      name: 'writing',
      desc: 'Writing hobby',
      args: [],
    );
  }

  /// `Cooking`
  String get cooking {
    return Intl.message(
      'Cooking',
      name: 'cooking',
      desc: 'Cooking hobby',
      args: [],
    );
  }

  /// `Dancing`
  String get dancing {
    return Intl.message(
      'Dancing',
      name: 'dancing',
      desc: 'Dancing hobby',
      args: [],
    );
  }

  /// `Shopping`
  String get shopping {
    return Intl.message(
      'Shopping',
      name: 'shopping',
      desc: 'Shopping hobby',
      args: [],
    );
  }

  /// `Pets`
  String get pets {
    return Intl.message(
      'Pets',
      name: 'pets',
      desc: 'Pets hobby',
      args: [],
    );
  }

  /// `Crafts`
  String get crafts {
    return Intl.message(
      'Crafts',
      name: 'crafts',
      desc: 'Crafts hobby',
      args: [],
    );
  }

  /// `Collecting`
  String get collecting {
    return Intl.message(
      'Collecting',
      name: 'collecting',
      desc: 'Collecting hobby',
      args: [],
    );
  }

  /// `Gardening`
  String get gardening {
    return Intl.message(
      'Gardening',
      name: 'gardening',
      desc: 'Gardening hobby',
      args: [],
    );
  }

  /// `Vegetarian`
  String get vegetarian {
    return Intl.message(
      'Vegetarian',
      name: 'vegetarian',
      desc: 'Vegetarian dietary habit',
      args: [],
    );
  }

  /// `Light Eating`
  String get lightEating {
    return Intl.message(
      'Light Eating',
      name: 'lightEating',
      desc: 'Light eating dietary habit',
      args: [],
    );
  }

  /// `Spicy Food`
  String get spicyFood {
    return Intl.message(
      'Spicy Food',
      name: 'spicyFood',
      desc: 'Spicy food dietary habit',
      args: [],
    );
  }

  /// `Sweet Food`
  String get sweetFood {
    return Intl.message(
      'Sweet Food',
      name: 'sweetFood',
      desc: 'Sweet food dietary habit',
      args: [],
    );
  }

  /// `Meat Lover`
  String get meatLover {
    return Intl.message(
      'Meat Lover',
      name: 'meatLover',
      desc: 'Meat lover dietary habit',
      args: [],
    );
  }

  /// `What's your age?`
  String get whatIsYourAge {
    return Intl.message(
      'What\'s your age?',
      name: 'whatIsYourAge',
      desc: 'Age step screen title',
      args: [],
    );
  }

  /// `Please select your birth date`
  String get ageDescription {
    return Intl.message(
      'Please select your birth date',
      name: 'ageDescription',
      desc: 'Age step description',
      args: [],
    );
  }

  /// `Select birth date`
  String get selectBirthDate {
    return Intl.message(
      'Select birth date',
      name: 'selectBirthDate',
      desc: 'Select birth date placeholder',
      args: [],
    );
  }

  /// `{age} years old`
  String ageYears(int age) {
    return Intl.message(
      '$age years old',
      name: 'ageYears',
      desc: 'Age display format',
      args: [age],
    );
  }

  /// `You must be at least 18 years old to use this app`
  String get ageRequirement {
    return Intl.message(
      'You must be at least 18 years old to use this app',
      name: 'ageRequirement',
      desc: 'Age requirement notice',
      args: [],
    );
  }

  /// `Enter your age`
  String get enterAge {
    return Intl.message(
      'Enter your age',
      name: 'enterAge',
      desc: 'Age input hint',
      args: [],
    );
  }

  /// `What's your gender?`
  String get whatIsYourGender {
    return Intl.message(
      'What\'s your gender?',
      name: 'whatIsYourGender',
      desc: 'Gender step screen title',
      args: [],
    );
  }

  /// `Please select your gender`
  String get genderDescription {
    return Intl.message(
      'Please select your gender',
      name: 'genderDescription',
      desc: 'Gender step description',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: 'Male gender option',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: 'Female gender option',
      args: [],
    );
  }

  /// `Non-binary`
  String get nonBinary {
    return Intl.message(
      'Non-binary',
      name: 'nonBinary',
      desc: 'Non-binary gender option',
      args: [],
    );
  }

  /// `Add your photos`
  String get addYourPhotos {
    return Intl.message(
      'Add your photos',
      name: 'addYourPhotos',
      desc: 'Photos step screen title',
      args: [],
    );
  }

  /// `Add at least 2 photos to show your personality`
  String get photosDescription {
    return Intl.message(
      'Add at least 2 photos to show your personality',
      name: 'photosDescription',
      desc: 'Photos step description',
      args: [],
    );
  }

  /// `Add Photo`
  String get addPhoto {
    return Intl.message(
      'Add Photo',
      name: 'addPhoto',
      desc: 'Add photo button text',
      args: [],
    );
  }

  /// `Upgrade Your Subscription Plan`
  String get upgradeSubscriptionPlan {
    return Intl.message(
      'Upgrade Your Subscription Plan',
      name: 'upgradeSubscriptionPlan',
      desc: 'Subscription screen title',
      args: [],
    );
  }

  /// `Your current plan is: Free`
  String get currentPlan {
    return Intl.message(
      'Your current plan is: Free',
      name: 'currentPlan',
      desc: 'Current plan status text',
      args: [],
    );
  }

  /// `Coming soon...`
  String get comingSoon {
    return Intl.message(
      'Coming soon...',
      name: 'comingSoon',
      desc: 'Coming soon text',
      args: [],
    );
  }

  /// `Xion Membership Plan`
  String get xionMembershipPlan {
    return Intl.message(
      'Xion Membership Plan',
      name: 'xionMembershipPlan',
      desc: 'Xion membership plan title',
      args: [],
    );
  }

  /// `1. Qualification certification: Active users holding 50,000 XION tokens\n2. Tailored VIP dating club\n3. Carefully designed 5 dating experiences`
  String get xionMembershipDescription {
    return Intl.message(
      '1. Qualification certification: Active users holding 50,000 XION tokens\n2. Tailored VIP dating club\n3. Carefully designed 5 dating experiences',
      name: 'xionMembershipDescription',
      desc: 'Xion membership plan description',
      args: [],
    );
  }

  /// `Verify Eligibility`
  String get verifyEligibility {
    return Intl.message(
      'Verify Eligibility',
      name: 'verifyEligibility',
      desc: 'Verify eligibility button text',
      args: [],
    );
  }

  /// `Tips:`
  String get tips {
    return Intl.message(
      'Tips:',
      name: 'tips',
      desc: 'Tips label',
      args: [],
    );
  }

  /// `Don't want to pay?`
  String get dontWantToPay {
    return Intl.message(
      'Don\'t want to pay?',
      name: 'dontWantToPay',
      desc: 'Don\'t want to pay question',
      args: [],
    );
  }

  /// `Daily sign-in and completing diary sharing tasks can earn extra points, which can be used to redeem matching privileges.`
  String get dailySignInTip {
    return Intl.message(
      'Daily sign-in and completing diary sharing tasks can earn extra points, which can be used to redeem matching privileges.',
      name: 'dailySignInTip',
      desc: 'Daily sign-in tip text',
      args: [],
    );
  }

  /// `Premium Plan`
  String get premiumPlan {
    return Intl.message(
      'Premium Plan',
      name: 'premiumPlan',
      desc: 'Premium plan title',
      args: [],
    );
  }

  /// `1. Recharge 30 points/month\n2. Exclusive customer support`
  String get premiumPlanDescription {
    return Intl.message(
      '1. Recharge 30 points/month\n2. Exclusive customer support',
      name: 'premiumPlanDescription',
      desc: 'Premium plan description',
      args: [],
    );
  }

  /// `Manage Subscription`
  String get manageSubscription {
    return Intl.message(
      'Manage Subscription',
      name: 'manageSubscription',
      desc: 'Manage subscription button text',
      args: [],
    );
  }

  /// `Supreme Plan`
  String get supremePlan {
    return Intl.message(
      'Supreme Plan',
      name: 'supremePlan',
      desc: 'Supreme plan title',
      args: [],
    );
  }

  /// `1. Recharge 100 points/month\n2. VIP customer support\n3. Rematch rejected matches`
  String get supremePlanDescription {
    return Intl.message(
      '1. Recharge 100 points/month\n2. VIP customer support\n3. Rematch rejected matches',
      name: 'supremePlanDescription',
      desc: 'Supreme plan description',
      args: [],
    );
  }

  /// `Step {current} of {total}`
  String stepOfTotal(String current, String total) {
    return Intl.message(
      'Step $current of $total',
      name: 'stepOfTotal',
      desc: 'Step counter text',
      args: [current, total],
    );
  }

  /// `Continue`
  String get continueButton {
    return Intl.message(
      'Continue',
      name: 'continueButton',
      desc: 'Continue button text',
      args: [],
    );
  }

  /// `Complete`
  String get completeButton {
    return Intl.message(
      'Complete',
      name: 'completeButton',
      desc: 'Complete button text',
      args: [],
    );
  }

  /// `Other`
  String get other {
    return Intl.message(
      'Other',
      name: 'other',
      desc: 'Other gender option',
      args: [],
    );
  }

  /// `What is your sexual orientation?`
  String get whatIsYourSexualOrientation {
    return Intl.message(
      'What is your sexual orientation?',
      name: 'whatIsYourSexualOrientation',
      desc: 'Sexual orientation step screen title',
      args: [],
    );
  }

  /// `Please select the gender you are looking for`
  String get pleaseSelectGenderYouAreLookingFor {
    return Intl.message(
      'Please select the gender you are looking for',
      name: 'pleaseSelectGenderYouAreLookingFor',
      desc: 'Sexual orientation step description',
      args: [],
    );
  }

  /// `Looking for males`
  String get lookingForMales {
    return Intl.message(
      'Looking for males',
      name: 'lookingForMales',
      desc: 'Looking for males option',
      args: [],
    );
  }

  /// `Looking for females`
  String get lookingForFemales {
    return Intl.message(
      'Looking for females',
      name: 'lookingForFemales',
      desc: 'Looking for females option',
      args: [],
    );
  }

  /// `Both`
  String get lookingForBoth {
    return Intl.message(
      'Both',
      name: 'lookingForBoth',
      desc: 'Looking for both genders option',
      args: [],
    );
  }

  /// `Where do you live?`
  String get whereDoYouLive {
    return Intl.message(
      'Where do you live?',
      name: 'whereDoYouLive',
      desc: 'Location step screen title',
      args: [],
    );
  }

  /// `Please enter your city and area, this will be used to match nearby users`
  String get locationDescription {
    return Intl.message(
      'Please enter your city and area, this will be used to match nearby users',
      name: 'locationDescription',
      desc: 'Location step description',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: 'City field label',
      args: [],
    );
  }

  /// `e.g., Beijing`
  String get cityExample {
    return Intl.message(
      'e.g., Beijing',
      name: 'cityExample',
      desc: 'City field placeholder',
      args: [],
    );
  }

  /// `Area`
  String get area {
    return Intl.message(
      'Area',
      name: 'area',
      desc: 'Area field label',
      args: [],
    );
  }

  /// `e.g., Chaoyang District`
  String get areaExample {
    return Intl.message(
      'e.g., Chaoyang District',
      name: 'areaExample',
      desc: 'Area field placeholder',
      args: [],
    );
  }

  /// `Street`
  String get street {
    return Intl.message(
      'Street',
      name: 'street',
      desc: 'Street field label',
      args: [],
    );
  }

  /// `e.g., Xili District`
  String get streetExample {
    return Intl.message(
      'e.g., Xili District',
      name: 'streetExample',
      desc: 'Street field placeholder',
      args: [],
    );
  }

  /// `Your location information will be used to calculate distance from other users. If not filled, current location will be used automatically`
  String get locationInfo {
    return Intl.message(
      'Your location information will be used to calculate distance from other users. If not filled, current location will be used automatically',
      name: 'locationInfo',
      desc: 'Location info text',
      args: [],
    );
  }

  /// `What is your profession?`
  String get whatIsYourProfession {
    return Intl.message(
      'What is your profession?',
      name: 'whatIsYourProfession',
      desc: 'Profession step screen title',
      args: [],
    );
  }

  /// `Please select your profession and industry (optional)`
  String get professionDescription {
    return Intl.message(
      'Please select your profession and industry (optional)',
      name: 'professionDescription',
      desc: 'Profession step description',
      args: [],
    );
  }

  /// `Profession`
  String get profession {
    return Intl.message(
      'Profession',
      name: 'profession',
      desc: 'Profession label',
      args: [],
    );
  }

  /// `Industry`
  String get industry {
    return Intl.message(
      'Industry',
      name: 'industry',
      desc: 'Industry label',
      args: [],
    );
  }

  /// `Industry (optional)`
  String get industryOptional {
    return Intl.message(
      'Industry (optional)',
      name: 'industryOptional',
      desc: 'Industry optional label',
      args: [],
    );
  }

  /// `Profession: {profession}{industry}`
  String professionSummary(String profession, String industry) {
    return Intl.message(
      'Profession: $profession$industry',
      name: 'professionSummary',
      desc: 'Profession summary text',
      args: [profession, industry],
    );
  }

  /// `Please upload at least 3 photos, up to 9. Include photos with different expressions and life scenes to help AI get to know you better`
  String get photosStepDescription {
    return Intl.message(
      'Please upload at least 3 photos, up to 9. Include photos with different expressions and life scenes to help AI get to know you better',
      name: 'photosStepDescription',
      desc: 'Photos step description',
      args: [],
    );
  }

  /// `{count} / 9 photos (minimum 3 required)`
  String photosCounter(int count) {
    return Intl.message(
      '$count / 9 photos (minimum 3 required)',
      name: 'photosCounter',
      desc: 'Photos counter text',
      args: [count],
    );
  }

  /// `Add Photo`
  String get addPhotoButton {
    return Intl.message(
      'Add Photo',
      name: 'addPhotoButton',
      desc: 'Add photo button text',
      args: [],
    );
  }

  /// `Student`
  String get student {
    return Intl.message(
      'Student',
      name: 'student',
      desc: 'Student profession',
      args: [],
    );
  }

  /// `Teacher`
  String get teacher {
    return Intl.message(
      'Teacher',
      name: 'teacher',
      desc: 'Teacher profession',
      args: [],
    );
  }

  /// `Doctor`
  String get doctor {
    return Intl.message(
      'Doctor',
      name: 'doctor',
      desc: 'Doctor profession',
      args: [],
    );
  }

  /// `Engineer`
  String get engineer {
    return Intl.message(
      'Engineer',
      name: 'engineer',
      desc: 'Engineer profession',
      args: [],
    );
  }

  /// `Designer`
  String get designer {
    return Intl.message(
      'Designer',
      name: 'designer',
      desc: 'Designer profession',
      args: [],
    );
  }

  /// `Sales`
  String get sales {
    return Intl.message(
      'Sales',
      name: 'sales',
      desc: 'Sales profession',
      args: [],
    );
  }

  /// `Operations`
  String get operations {
    return Intl.message(
      'Operations',
      name: 'operations',
      desc: 'Operations profession',
      args: [],
    );
  }

  /// `Marketing`
  String get marketing {
    return Intl.message(
      'Marketing',
      name: 'marketing',
      desc: 'Marketing profession',
      args: [],
    );
  }

  /// `Product Manager`
  String get productManager {
    return Intl.message(
      'Product Manager',
      name: 'productManager',
      desc: 'Product Manager profession',
      args: [],
    );
  }

  /// `Programmer`
  String get programmer {
    return Intl.message(
      'Programmer',
      name: 'programmer',
      desc: 'Programmer profession',
      args: [],
    );
  }

  /// `Lawyer`
  String get lawyer {
    return Intl.message(
      'Lawyer',
      name: 'lawyer',
      desc: 'Lawyer profession',
      args: [],
    );
  }

  /// `Accountant`
  String get accountant {
    return Intl.message(
      'Accountant',
      name: 'accountant',
      desc: 'Accountant profession',
      args: [],
    );
  }

  /// `Finance`
  String get finance {
    return Intl.message(
      'Finance',
      name: 'finance',
      desc: 'Finance profession',
      args: [],
    );
  }

  /// `Consultant`
  String get consultant {
    return Intl.message(
      'Consultant',
      name: 'consultant',
      desc: 'Consultant profession',
      args: [],
    );
  }

  /// `Entrepreneur`
  String get entrepreneur {
    return Intl.message(
      'Entrepreneur',
      name: 'entrepreneur',
      desc: 'Entrepreneur profession',
      args: [],
    );
  }

  /// `Freelancer`
  String get freelancer {
    return Intl.message(
      'Freelancer',
      name: 'freelancer',
      desc: 'Freelancer profession',
      args: [],
    );
  }

  /// `Internet`
  String get internet {
    return Intl.message(
      'Internet',
      name: 'internet',
      desc: 'Internet industry',
      args: [],
    );
  }

  /// `Healthcare`
  String get healthcare {
    return Intl.message(
      'Healthcare',
      name: 'healthcare',
      desc: 'Healthcare industry',
      args: [],
    );
  }

  /// `Manufacturing`
  String get manufacturing {
    return Intl.message(
      'Manufacturing',
      name: 'manufacturing',
      desc: 'Manufacturing industry',
      args: [],
    );
  }

  /// `Real Estate`
  String get realEstate {
    return Intl.message(
      'Real Estate',
      name: 'realEstate',
      desc: 'Real Estate industry',
      args: [],
    );
  }

  /// `Retail`
  String get retail {
    return Intl.message(
      'Retail',
      name: 'retail',
      desc: 'Retail industry',
      args: [],
    );
  }

  /// `Media`
  String get media {
    return Intl.message(
      'Media',
      name: 'media',
      desc: 'Media industry',
      args: [],
    );
  }

  /// `Legal`
  String get legal {
    return Intl.message(
      'Legal',
      name: 'legal',
      desc: 'Legal industry',
      args: [],
    );
  }

  /// `Arts`
  String get arts {
    return Intl.message(
      'Arts',
      name: 'arts',
      desc: 'Arts industry',
      args: [],
    );
  }

  /// `Sports`
  String get sports {
    return Intl.message(
      'Sports',
      name: 'sports',
      desc: 'Sports industry',
      args: [],
    );
  }

  /// `Government`
  String get government {
    return Intl.message(
      'Government',
      name: 'government',
      desc: 'Government industry',
      args: [],
    );
  }

  /// `Non-profit`
  String get nonprofit {
    return Intl.message(
      'Non-profit',
      name: 'nonprofit',
      desc: 'Non-profit industry',
      args: [],
    );
  }

  /// `Location Details`
  String get locationDetails {
    return Intl.message(
      'Location Details',
      name: 'locationDetails',
      desc: 'Location details title',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: 'Dating theme label',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: 'Address label',
      args: [],
    );
  }

  /// `Distance`
  String get distance {
    return Intl.message(
      'Distance',
      name: 'distance',
      desc: 'Distance label',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: 'Time label',
      args: [],
    );
  }

  /// `Please confirm dating information`
  String get pleaseConfirmDatingInfo {
    return Intl.message(
      'Please confirm dating information',
      name: 'pleaseConfirmDatingInfo',
      desc: 'Confirm dating info title',
      args: [],
    );
  }

  /// `Pay Deposit`
  String get payDeposit {
    return Intl.message(
      'Pay Deposit',
      name: 'payDeposit',
      desc: 'Pay deposit title',
      args: [],
    );
  }

  /// `Why pay a deposit?`
  String get whyPayDeposit {
    return Intl.message(
      'Why pay a deposit?',
      name: 'whyPayDeposit',
      desc: 'Why pay deposit question',
      args: [],
    );
  }

  /// `The deposit is to protect both parties' rights. It will be automatically refunded in full after the date is completed. If you break the agreement without mutual consent, the deposit will be transferred to the other party as compensation.`
  String get depositExplanation {
    return Intl.message(
      'The deposit is to protect both parties\' rights. It will be automatically refunded in full after the date is completed. If you break the agreement without mutual consent, the deposit will be transferred to the other party as compensation.',
      name: 'depositExplanation',
      desc: 'Deposit explanation text',
      args: [],
    );
  }

  /// `Is my deposit safe?`
  String get isMyDepositSafe {
    return Intl.message(
      'Is my deposit safe?',
      name: 'isMyDepositSafe',
      desc: 'Deposit safety question',
      args: [],
    );
  }

  /// `Your deposit is completely safe! We use advanced blockchain technology to ensure your funds are traceable and verifiable. The platform cannot operate your funds without authorization - only you can operate them.`
  String get depositSafetyExplanation {
    return Intl.message(
      'Your deposit is completely safe! We use advanced blockchain technology to ensure your funds are traceable and verifiable. The platform cannot operate your funds without authorization - only you can operate them.',
      name: 'depositSafetyExplanation',
      desc: 'Deposit safety explanation text',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
