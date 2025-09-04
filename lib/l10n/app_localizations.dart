import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S? of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh'),
  ];

  /// The application name
  ///
  /// In en, this message translates to:
  /// **'Blur'**
  String get appName;

  /// Login button text
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// Register button text
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// Email field label
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Password field label
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Confirm password field label
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// Forgot password link text
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// Reset password button text
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// Verification screen title
  ///
  /// In en, this message translates to:
  /// **'Verification'**
  String get verification;

  /// Verification code field label
  ///
  /// In en, this message translates to:
  /// **'Verification Code'**
  String get verificationCode;

  /// Resend verification code button text
  ///
  /// In en, this message translates to:
  /// **'Resend Code'**
  String get resendCode;

  /// Onboarding screen title
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get onboarding;

  /// Home tab title
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Chat tab title
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// Dating tab title
  ///
  /// In en, this message translates to:
  /// **'Dating'**
  String get dating;

  /// Match tab title
  ///
  /// In en, this message translates to:
  /// **'Match'**
  String get match;

  /// Settings tab title
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Profile screen title
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// Notifications screen title
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// Search placeholder text
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// Filter button text
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// Location field label
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// Age field label
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// About section title
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// Gallery section title
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// Confirm button text
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// Cancel button text
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Save button text
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Edit button text
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// Delete button text
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Share button text
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// Send button text
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// Message field label
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// Conversation screen title
  ///
  /// In en, this message translates to:
  /// **'Conversation'**
  String get conversation;

  /// Dating diary screen title
  ///
  /// In en, this message translates to:
  /// **'Dating Diary'**
  String get datingDiary;

  /// Check in button text
  ///
  /// In en, this message translates to:
  /// **'Check In'**
  String get checkin;

  /// Success message
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// Error message
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// Loading message
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No data message
  ///
  /// In en, this message translates to:
  /// **'No data available'**
  String get noData;

  /// Retry button text
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// Back button text
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// Next button text
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// Done button text
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// Close button text
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// Loading text for authentication callback page
  ///
  /// In en, this message translates to:
  /// **'Processing authentication result...'**
  String get processingAuthResult;

  /// Dating not found error message
  ///
  /// In en, this message translates to:
  /// **'Dating with uuid {uuid} not found'**
  String datingNotFound(String uuid);

  /// Chat not found error message
  ///
  /// In en, this message translates to:
  /// **'Chat with uuid {uuid} not found'**
  String chatNotFound(String uuid);

  /// Yes button text
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No button text
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// OK button text
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// Other login methods text
  ///
  /// In en, this message translates to:
  /// **'Other Methods'**
  String get otherMethods;

  /// No account text
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get noAccount;

  /// Register now link text
  ///
  /// In en, this message translates to:
  /// **'Register Now'**
  String get registerNow;

  /// Meet tab title
  ///
  /// In en, this message translates to:
  /// **'Meet'**
  String get meet;

  /// Match tab title with exclamation
  ///
  /// In en, this message translates to:
  /// **'Match!'**
  String get matchTab;

  /// Language settings screen title
  ///
  /// In en, this message translates to:
  /// **'Language Settings'**
  String get languageSettings;

  /// Restart app message
  ///
  /// In en, this message translates to:
  /// **'Please restart the app to apply the new language settings'**
  String get restartApp;

  /// English language option
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// Chinese language option
  ///
  /// In en, this message translates to:
  /// **'中文'**
  String get chinese;

  /// Select language prompt
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// Date and time label
  ///
  /// In en, this message translates to:
  /// **'Date & Time'**
  String get dateTime;

  /// Check-in success message
  ///
  /// In en, this message translates to:
  /// **'Check-in successful!'**
  String get checkinSuccess;

  /// Diary screen title
  ///
  /// In en, this message translates to:
  /// **'Diary'**
  String get diary;

  /// Poster section title
  ///
  /// In en, this message translates to:
  /// **'Poster'**
  String get poster;

  /// Share success message
  ///
  /// In en, this message translates to:
  /// **'Shared successfully!'**
  String get shareSuccess;

  /// Upcoming status
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get upcoming;

  /// Past status
  ///
  /// In en, this message translates to:
  /// **'Past'**
  String get past;

  /// Canceled status
  ///
  /// In en, this message translates to:
  /// **'Canceled'**
  String get canceled;

  /// Add to calendar button text
  ///
  /// In en, this message translates to:
  /// **'🗓️ Add to Calendar'**
  String get addToCalendar;

  /// Completed status
  ///
  /// In en, this message translates to:
  /// **'✅ Completed'**
  String get completed;

  /// Pending status
  ///
  /// In en, this message translates to:
  /// **'⏱️ Pending'**
  String get pending;

  /// Date with nickname text
  ///
  /// In en, this message translates to:
  /// **'Date with {nickname}'**
  String dateWith(String nickname);

  /// Filter title
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filterTitle;

  /// Distance range label
  ///
  /// In en, this message translates to:
  /// **'Distance Range'**
  String get distanceRange;

  /// Minimum distance input label
  ///
  /// In en, this message translates to:
  /// **'Min Distance (KM)'**
  String get minDistance;

  /// Maximum distance input label
  ///
  /// In en, this message translates to:
  /// **'Max Distance (KM)'**
  String get maxDistance;

  /// Minimum distance input hint
  ///
  /// In en, this message translates to:
  /// **'1 KM'**
  String get minDistanceHint;

  /// Maximum distance input hint
  ///
  /// In en, this message translates to:
  /// **'30 KM'**
  String get maxDistanceHint;

  /// Free time label
  ///
  /// In en, this message translates to:
  /// **'Free Time'**
  String get freeTime;

  /// All option
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// Weekend option
  ///
  /// In en, this message translates to:
  /// **'Weekend'**
  String get weekend;

  /// Apply filter button
  ///
  /// In en, this message translates to:
  /// **'Apply Filter'**
  String get applyFilter;

  /// Reset filter button
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get resetFilter;

  /// Dating details screen title
  ///
  /// In en, this message translates to:
  /// **'Dating Details'**
  String get datingDetails;

  /// Check-in success screen title
  ///
  /// In en, this message translates to:
  /// **'Check-in Successful'**
  String get checkinSuccessTitle;

  /// Blessing text on check-in success page
  ///
  /// In en, this message translates to:
  /// **'Enjoy the sweet moments of meeting!'**
  String get enjoySweetMoment;

  /// Message input hint on check-in success page
  ///
  /// In en, this message translates to:
  /// **'Can\'t find them? Send them a message!'**
  String get cantFindPartnerMessage;

  /// Confirm success screen title
  ///
  /// In en, this message translates to:
  /// **'Confirmation Successful'**
  String get confirmSuccess;

  /// Share to WeChat button
  ///
  /// In en, this message translates to:
  /// **'Share Poster to WeChat'**
  String get shareToWechat;

  /// Return home button
  ///
  /// In en, this message translates to:
  /// **'Return Home'**
  String get returnHome;

  /// Dating check-in button
  ///
  /// In en, this message translates to:
  /// **'Dating Check-in'**
  String get datingCheckin;

  /// Share dating diary button
  ///
  /// In en, this message translates to:
  /// **'Share Dating Diary'**
  String get shareDatingDiary;

  /// Submit diary button
  ///
  /// In en, this message translates to:
  /// **'Submit Diary'**
  String get submitDiary;

  /// Diary input placeholder
  ///
  /// In en, this message translates to:
  /// **'What interesting things happened during the date? Or come and complain! AI will automatically beautify after submission'**
  String get diaryPlaceholder;

  /// Buy NFT and confirm button
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get buyNFTAndConfirm;

  /// Processing payment text
  ///
  /// In en, this message translates to:
  /// **'Processing Payment...'**
  String get processingPayment;

  /// Continue button
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueBtn;

  /// Membership subscription option in profile
  ///
  /// In en, this message translates to:
  /// **'Membership Subscription'**
  String get membershipSubscription;

  /// Onboarding screen tagline
  ///
  /// In en, this message translates to:
  /// **'See me, then talk to me'**
  String get onboardingTagline;

  /// Dating decision button text
  ///
  /// In en, this message translates to:
  /// **'Let me think'**
  String get letMeThink;

  /// Confirm dating button text
  ///
  /// In en, this message translates to:
  /// **'Confirm Dating'**
  String get confirmDating;

  /// AI message asking for dating feedback
  ///
  /// In en, this message translates to:
  /// **'How was your date with {nickname} today? Share any fun or interesting things with me, and I\'ll help polish it into a diary entry!'**
  String datingFeedbackMessage(String nickname);

  /// Perfect dating partner text
  ///
  /// In en, this message translates to:
  /// **'{nickname} is definitely your perfect dating partner!'**
  String perfectDatingPartner(String nickname);

  /// Photo album section title
  ///
  /// In en, this message translates to:
  /// **'Photo Album'**
  String get photoAlbum;

  /// AI found commonalities section title
  ///
  /// In en, this message translates to:
  /// **'AI also discovered some commonalities between you'**
  String get aiFoundCommonalities;

  /// Interesting differences section title
  ///
  /// In en, this message translates to:
  /// **'And some interesting differences'**
  String get interestingDifferences;

  /// Dating diary section title
  ///
  /// In en, this message translates to:
  /// **'Dating Diary'**
  String get datingDiaryTitle;

  /// FAQ section title
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get faq;

  /// FAQ question about dating safety
  ///
  /// In en, this message translates to:
  /// **'Is my date safe?'**
  String get faqDatingSafetyQuestion;

  /// FAQ answer about dating safety
  ///
  /// In en, this message translates to:
  /// **'We take user safety very seriously. All dates require a deposit, which is fully refunded after the date is completed. If there is a breach of contract without mutual agreement, the deposit will be transferred to the other party as compensation. Additionally, we provide safety features such as \"one-touch emergency\" and \"real-time location sharing\" to ensure your safety.'**
  String get faqDatingSafetyAnswer;

  /// FAQ question about emergency situations
  ///
  /// In en, this message translates to:
  /// **'What to do if I encounter danger during a date?'**
  String get faqEmergencyQuestion;

  /// FAQ answer about emergency situations
  ///
  /// In en, this message translates to:
  /// **'Use the \"one-touch emergency\" feature in the platform to quickly contact the police, call the platform customer service hotline for help. The platform provides 24-hour safety protection for you.'**
  String get faqEmergencyAnswer;

  /// FAQ question about deposit refund
  ///
  /// In en, this message translates to:
  /// **'When will my deposit be refunded?'**
  String get faqDepositRefundQuestion;

  /// FAQ answer about deposit refund
  ///
  /// In en, this message translates to:
  /// **'After both parties check in for the date, the deposit will be refunded to your account within 24 hours. If there is no check-in, the deposit will be transferred to the other party as breach compensation.'**
  String get faqDepositRefundAnswer;

  /// Match reason section title
  ///
  /// In en, this message translates to:
  /// **'Match Reason'**
  String get matchReason;

  /// Show more text for expandable content
  ///
  /// In en, this message translates to:
  /// **'Show more'**
  String get showMore;

  /// Show less text for expandable content
  ///
  /// In en, this message translates to:
  /// **'Show less'**
  String get showLess;

  /// User information section title
  ///
  /// In en, this message translates to:
  /// **'User Info'**
  String get userInfo;

  /// Basic information section title
  ///
  /// In en, this message translates to:
  /// **'Basic Info'**
  String get basicInfo;

  /// Age range field label
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get ageRange;

  /// Height field label
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get height;

  /// Hometown field label
  ///
  /// In en, this message translates to:
  /// **'Hometown'**
  String get homeTown;

  /// Education field label
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get education;

  /// Job field label
  ///
  /// In en, this message translates to:
  /// **'Job'**
  String get job;

  /// Dating request sent message
  ///
  /// In en, this message translates to:
  /// **'Your dating request with {nickname} has been sent!'**
  String datingRequestSent(String nickname);

  /// Dating tips section title
  ///
  /// In en, this message translates to:
  /// **'Need help breaking the ice? AI has prepared dating tips for you'**
  String get datingTipsTitle;

  /// Abstraxion authentication screen title
  ///
  /// In en, this message translates to:
  /// **'Abstraxion Authentication'**
  String get abstraxionAuth;

  /// Reconnect button tooltip
  ///
  /// In en, this message translates to:
  /// **'Reconnect'**
  String get reconnect;

  /// Connecting to server loading message
  ///
  /// In en, this message translates to:
  /// **'Connecting to server...'**
  String get connectingToServer;

  /// Connection error title
  ///
  /// In en, this message translates to:
  /// **'Connection Error'**
  String get connectionError;

  /// Blockchain authentication title
  ///
  /// In en, this message translates to:
  /// **'Blockchain Authentication'**
  String get blockchainAuth;

  /// Authentication instructions text
  ///
  /// In en, this message translates to:
  /// **'Click the button below to complete secure authentication in your browser'**
  String get authInstructions;

  /// Start authentication button text
  ///
  /// In en, this message translates to:
  /// **'Start Authentication'**
  String get startAuth;

  /// Server status text
  ///
  /// In en, this message translates to:
  /// **'Server Status: {status}'**
  String serverStatus(String status);

  /// Connected status
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get connected;

  /// Disconnected status
  ///
  /// In en, this message translates to:
  /// **'Disconnected'**
  String get disconnected;

  /// Server not connected snackbar message
  ///
  /// In en, this message translates to:
  /// **'Server not connected, please try again later'**
  String get serverNotConnected;

  /// Complete authentication in browser message
  ///
  /// In en, this message translates to:
  /// **'Please complete authentication in your browser...'**
  String get completeAuthInBrowser;

  /// Authentication start failed message
  ///
  /// In en, this message translates to:
  /// **'Failed to start authentication'**
  String get authStartFailed;

  /// Authentication start error message
  ///
  /// In en, this message translates to:
  /// **'Authentication start failed: {error}'**
  String authStartError(String error);

  /// Connect server first message
  ///
  /// In en, this message translates to:
  /// **'Please connect to server first'**
  String get connectServerFirst;

  /// Cannot connect to React server error message
  ///
  /// In en, this message translates to:
  /// **'Cannot connect to React server, please ensure the server is running'**
  String get cannotConnectToReactServer;

  /// Connection failed error message
  ///
  /// In en, this message translates to:
  /// **'Connection failed: {error}'**
  String connectionFailed(String error);

  /// Start Blur journey success message
  ///
  /// In en, this message translates to:
  /// **'Start Your Blur Journey!'**
  String get startBlurJourney;

  /// Start now button text
  ///
  /// In en, this message translates to:
  /// **'Start Now!'**
  String get startNow;

  /// Account creation success message
  ///
  /// In en, this message translates to:
  /// **'Account created successfully, please complete your profile to help AI better match your ideal type.'**
  String get accountCreatedSuccess;

  /// Name step screen title
  ///
  /// In en, this message translates to:
  /// **'What\'s your name?'**
  String get whatIsYourName;

  /// Name step description
  ///
  /// In en, this message translates to:
  /// **'Please enter your name or nickname, this will serve as your personal identifier'**
  String get nameDescription;

  /// Name input hint text
  ///
  /// In en, this message translates to:
  /// **'Enter your name or nickname'**
  String get enterNameHint;

  /// Name display note
  ///
  /// In en, this message translates to:
  /// **'This name will be displayed in your profile'**
  String get nameDisplayNote;

  /// MBTI step screen title
  ///
  /// In en, this message translates to:
  /// **'What\'s your MBTI type?'**
  String get yourMBTIType;

  /// MBTI step description
  ///
  /// In en, this message translates to:
  /// **'Please select your MBTI personality type, this will help us match you better'**
  String get mbtiDescription;

  /// MBTI test note
  ///
  /// In en, this message translates to:
  /// **'Don\'t know your MBTI type? You can take an online test later'**
  String get mbtiTestNote;

  /// Hobbies step screen title
  ///
  /// In en, this message translates to:
  /// **'What are your hobbies?'**
  String get yourHobbies;

  /// Hobbies step description
  ///
  /// In en, this message translates to:
  /// **'Please select your hobbies, multiple selections allowed'**
  String get hobbiesDescription;

  /// Selected hobbies count
  ///
  /// In en, this message translates to:
  /// **'Selected {count} hobbies'**
  String selectedHobbiesCount(int count);

  /// Movies hobby
  ///
  /// In en, this message translates to:
  /// **'Movies'**
  String get movies;

  /// Music hobby
  ///
  /// In en, this message translates to:
  /// **'Music'**
  String get music;

  /// Outdoor sports hobby
  ///
  /// In en, this message translates to:
  /// **'Outdoor Sports'**
  String get outdoorSports;

  /// Food exploring hobby
  ///
  /// In en, this message translates to:
  /// **'Food Exploring'**
  String get foodExploring;

  /// Reading hobby
  ///
  /// In en, this message translates to:
  /// **'Reading'**
  String get reading;

  /// Travel hobby
  ///
  /// In en, this message translates to:
  /// **'Travel'**
  String get travel;

  /// Gaming hobby
  ///
  /// In en, this message translates to:
  /// **'Gaming'**
  String get gaming;

  /// Photography hobby
  ///
  /// In en, this message translates to:
  /// **'Photography'**
  String get photography;

  /// Fitness hobby
  ///
  /// In en, this message translates to:
  /// **'Fitness'**
  String get fitness;

  /// Painting hobby
  ///
  /// In en, this message translates to:
  /// **'Painting'**
  String get painting;

  /// Writing hobby
  ///
  /// In en, this message translates to:
  /// **'Writing'**
  String get writing;

  /// Cooking hobby
  ///
  /// In en, this message translates to:
  /// **'Cooking'**
  String get cooking;

  /// Dancing hobby
  ///
  /// In en, this message translates to:
  /// **'Dancing'**
  String get dancing;

  /// Shopping hobby
  ///
  /// In en, this message translates to:
  /// **'Shopping'**
  String get shopping;

  /// Pets hobby
  ///
  /// In en, this message translates to:
  /// **'Pets'**
  String get pets;

  /// Crafts hobby
  ///
  /// In en, this message translates to:
  /// **'Crafts'**
  String get crafts;

  /// Collecting hobby
  ///
  /// In en, this message translates to:
  /// **'Collecting'**
  String get collecting;

  /// Gardening hobby
  ///
  /// In en, this message translates to:
  /// **'Gardening'**
  String get gardening;

  /// Vegetarian dietary habit
  ///
  /// In en, this message translates to:
  /// **'Vegetarian'**
  String get vegetarian;

  /// Light eating dietary habit
  ///
  /// In en, this message translates to:
  /// **'Light Eating'**
  String get lightEating;

  /// Spicy food dietary habit
  ///
  /// In en, this message translates to:
  /// **'Spicy Food'**
  String get spicyFood;

  /// Sweet food dietary habit
  ///
  /// In en, this message translates to:
  /// **'Sweet Food'**
  String get sweetFood;

  /// Meat lover dietary habit
  ///
  /// In en, this message translates to:
  /// **'Meat Lover'**
  String get meatLover;

  /// Age step screen title
  ///
  /// In en, this message translates to:
  /// **'What\'s your age?'**
  String get whatIsYourAge;

  /// Age step description
  ///
  /// In en, this message translates to:
  /// **'Please select your birth date'**
  String get ageDescription;

  /// Select birth date placeholder
  ///
  /// In en, this message translates to:
  /// **'Select birth date'**
  String get selectBirthDate;

  /// Age display format
  ///
  /// In en, this message translates to:
  /// **'{age} years old'**
  String ageYears(int age);

  /// Age requirement notice
  ///
  /// In en, this message translates to:
  /// **'You must be at least 18 years old to use this app'**
  String get ageRequirement;

  /// Age input hint
  ///
  /// In en, this message translates to:
  /// **'Enter your age'**
  String get enterAge;

  /// Gender step screen title
  ///
  /// In en, this message translates to:
  /// **'What\'s your gender?'**
  String get whatIsYourGender;

  /// Gender step description
  ///
  /// In en, this message translates to:
  /// **'Please select your gender'**
  String get genderDescription;

  /// Male gender option
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// Female gender option
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// Non-binary gender option
  ///
  /// In en, this message translates to:
  /// **'Non-binary'**
  String get nonBinary;

  /// Photos step screen title
  ///
  /// In en, this message translates to:
  /// **'Add your photos'**
  String get addYourPhotos;

  /// Photos step description
  ///
  /// In en, this message translates to:
  /// **'Add at least 2 photos to show your personality'**
  String get photosDescription;

  /// Add photo button text
  ///
  /// In en, this message translates to:
  /// **'Add Photo'**
  String get addPhoto;

  /// Subscription screen title
  ///
  /// In en, this message translates to:
  /// **'Upgrade Your Subscription Plan'**
  String get upgradeSubscriptionPlan;

  /// Current plan status text
  ///
  /// In en, this message translates to:
  /// **'Your current plan is: Free'**
  String get currentPlan;

  /// Coming soon text
  ///
  /// In en, this message translates to:
  /// **'Coming soon...'**
  String get comingSoon;

  /// Xion membership plan title
  ///
  /// In en, this message translates to:
  /// **'Xion Membership Plan'**
  String get xionMembershipPlan;

  /// Xion membership plan description
  ///
  /// In en, this message translates to:
  /// **'1. Qualification certification: Active users holding 50,000 XION tokens\n2. Tailored VIP dating club\n3. Carefully designed 5 dating experiences'**
  String get xionMembershipDescription;

  /// Verify eligibility button text
  ///
  /// In en, this message translates to:
  /// **'Verify Eligibility'**
  String get verifyEligibility;

  /// Tips label
  ///
  /// In en, this message translates to:
  /// **'Tips:'**
  String get tips;

  /// Don't want to pay question
  ///
  /// In en, this message translates to:
  /// **'Don\'t want to pay?'**
  String get dontWantToPay;

  /// Daily sign-in tip text
  ///
  /// In en, this message translates to:
  /// **'Daily sign-in and completing diary sharing tasks can earn extra points, which can be used to redeem matching privileges.'**
  String get dailySignInTip;

  /// Premium plan title
  ///
  /// In en, this message translates to:
  /// **'Premium Plan'**
  String get premiumPlan;

  /// Premium plan description
  ///
  /// In en, this message translates to:
  /// **'1. Recharge 30 points/month\n2. Exclusive customer support'**
  String get premiumPlanDescription;

  /// Manage subscription button text
  ///
  /// In en, this message translates to:
  /// **'Manage Subscription'**
  String get manageSubscription;

  /// Supreme plan title
  ///
  /// In en, this message translates to:
  /// **'Supreme Plan'**
  String get supremePlan;

  /// Supreme plan description
  ///
  /// In en, this message translates to:
  /// **'1. Recharge 100 points/month\n2. VIP customer support\n3. Rematch rejected matches'**
  String get supremePlanDescription;

  /// Step counter text
  ///
  /// In en, this message translates to:
  /// **'Step {current} of {total}'**
  String stepOfTotal(String current, String total);

  /// Continue button text
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// Complete button text
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get completeButton;

  /// Other gender option
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// Sexual orientation step screen title
  ///
  /// In en, this message translates to:
  /// **'What is your sexual orientation?'**
  String get whatIsYourSexualOrientation;

  /// Sexual orientation step description
  ///
  /// In en, this message translates to:
  /// **'Please select the gender you are looking for'**
  String get pleaseSelectGenderYouAreLookingFor;

  /// Looking for males option
  ///
  /// In en, this message translates to:
  /// **'Looking for males'**
  String get lookingForMales;

  /// Looking for females option
  ///
  /// In en, this message translates to:
  /// **'Looking for females'**
  String get lookingForFemales;

  /// Looking for both genders option
  ///
  /// In en, this message translates to:
  /// **'Both'**
  String get lookingForBoth;

  /// Location step screen title
  ///
  /// In en, this message translates to:
  /// **'Where do you live?'**
  String get whereDoYouLive;

  /// Location step description
  ///
  /// In en, this message translates to:
  /// **'Please enter your city and area, this will be used to match nearby users'**
  String get locationDescription;

  /// City field label
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// City field placeholder
  ///
  /// In en, this message translates to:
  /// **'e.g., Beijing'**
  String get cityExample;

  /// Area field label
  ///
  /// In en, this message translates to:
  /// **'Area'**
  String get area;

  /// Area field placeholder
  ///
  /// In en, this message translates to:
  /// **'e.g., Chaoyang District'**
  String get areaExample;

  /// Street field label
  ///
  /// In en, this message translates to:
  /// **'Street'**
  String get street;

  /// Street field placeholder
  ///
  /// In en, this message translates to:
  /// **'e.g., Xili District'**
  String get streetExample;

  /// Location info text
  ///
  /// In en, this message translates to:
  /// **'Your location information will be used to calculate distance from other users. If not filled, current location will be used automatically'**
  String get locationInfo;

  /// Profession step screen title
  ///
  /// In en, this message translates to:
  /// **'What is your profession?'**
  String get whatIsYourProfession;

  /// Profession step description
  ///
  /// In en, this message translates to:
  /// **'Please select your profession and industry (optional)'**
  String get professionDescription;

  /// Profession label
  ///
  /// In en, this message translates to:
  /// **'Profession'**
  String get profession;

  /// Industry label
  ///
  /// In en, this message translates to:
  /// **'Industry'**
  String get industry;

  /// Industry optional label
  ///
  /// In en, this message translates to:
  /// **'Industry (optional)'**
  String get industryOptional;

  /// Profession summary text
  ///
  /// In en, this message translates to:
  /// **'Profession: {profession}{industry}'**
  String professionSummary(String profession, String industry);

  /// Photos step description
  ///
  /// In en, this message translates to:
  /// **'Please upload at least 3 photos, up to 9. Include photos with different expressions and life scenes to help AI get to know you better'**
  String get photosStepDescription;

  /// Photos counter text
  ///
  /// In en, this message translates to:
  /// **'{count} / 9 photos (minimum 3 required)'**
  String photosCounter(int count);

  /// Add photo button text
  ///
  /// In en, this message translates to:
  /// **'Add Photo'**
  String get addPhotoButton;

  /// Student profession
  ///
  /// In en, this message translates to:
  /// **'Student'**
  String get student;

  /// Teacher profession
  ///
  /// In en, this message translates to:
  /// **'Teacher'**
  String get teacher;

  /// Doctor profession
  ///
  /// In en, this message translates to:
  /// **'Doctor'**
  String get doctor;

  /// Engineer profession
  ///
  /// In en, this message translates to:
  /// **'Engineer'**
  String get engineer;

  /// Designer profession
  ///
  /// In en, this message translates to:
  /// **'Designer'**
  String get designer;

  /// Sales profession
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get sales;

  /// Operations profession
  ///
  /// In en, this message translates to:
  /// **'Operations'**
  String get operations;

  /// Marketing profession
  ///
  /// In en, this message translates to:
  /// **'Marketing'**
  String get marketing;

  /// Product Manager profession
  ///
  /// In en, this message translates to:
  /// **'Product Manager'**
  String get productManager;

  /// Programmer profession
  ///
  /// In en, this message translates to:
  /// **'Programmer'**
  String get programmer;

  /// Lawyer profession
  ///
  /// In en, this message translates to:
  /// **'Lawyer'**
  String get lawyer;

  /// Accountant profession
  ///
  /// In en, this message translates to:
  /// **'Accountant'**
  String get accountant;

  /// Finance profession
  ///
  /// In en, this message translates to:
  /// **'Finance'**
  String get finance;

  /// Consultant profession
  ///
  /// In en, this message translates to:
  /// **'Consultant'**
  String get consultant;

  /// Entrepreneur profession
  ///
  /// In en, this message translates to:
  /// **'Entrepreneur'**
  String get entrepreneur;

  /// Freelancer profession
  ///
  /// In en, this message translates to:
  /// **'Freelancer'**
  String get freelancer;

  /// Internet industry
  ///
  /// In en, this message translates to:
  /// **'Internet'**
  String get internet;

  /// Healthcare industry
  ///
  /// In en, this message translates to:
  /// **'Healthcare'**
  String get healthcare;

  /// Manufacturing industry
  ///
  /// In en, this message translates to:
  /// **'Manufacturing'**
  String get manufacturing;

  /// Real Estate industry
  ///
  /// In en, this message translates to:
  /// **'Real Estate'**
  String get realEstate;

  /// Retail industry
  ///
  /// In en, this message translates to:
  /// **'Retail'**
  String get retail;

  /// Media industry
  ///
  /// In en, this message translates to:
  /// **'Media'**
  String get media;

  /// Legal industry
  ///
  /// In en, this message translates to:
  /// **'Legal'**
  String get legal;

  /// Arts industry
  ///
  /// In en, this message translates to:
  /// **'Arts'**
  String get arts;

  /// Sports industry
  ///
  /// In en, this message translates to:
  /// **'Sports'**
  String get sports;

  /// Government industry
  ///
  /// In en, this message translates to:
  /// **'Government'**
  String get government;

  /// Non-profit industry
  ///
  /// In en, this message translates to:
  /// **'Non-profit'**
  String get nonprofit;

  /// Location details title
  ///
  /// In en, this message translates to:
  /// **'Location Details'**
  String get locationDetails;

  /// Dating theme label
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// Address label
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// Distance label
  ///
  /// In en, this message translates to:
  /// **'Distance'**
  String get distance;

  /// Time label
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// Confirm dating info title
  ///
  /// In en, this message translates to:
  /// **'Please confirm dating information'**
  String get pleaseConfirmDatingInfo;

  /// Pay deposit title
  ///
  /// In en, this message translates to:
  /// **'Pay Deposit'**
  String get payDeposit;

  /// Why pay deposit question
  ///
  /// In en, this message translates to:
  /// **'Why pay a deposit?'**
  String get whyPayDeposit;

  /// Deposit explanation text
  ///
  /// In en, this message translates to:
  /// **'The deposit is to protect both parties\' rights. It will be automatically refunded in full after the date is completed. If you break the agreement without mutual consent, the deposit will be transferred to the other party as compensation.'**
  String get depositExplanation;

  /// Deposit safety question
  ///
  /// In en, this message translates to:
  /// **'Is my deposit safe?'**
  String get isMyDepositSafe;

  /// Deposit safety explanation text
  ///
  /// In en, this message translates to:
  /// **'Your deposit is completely safe! We use advanced blockchain technology to ensure your funds are traceable and verifiable. The platform cannot operate your funds without authorization - only you can operate them.'**
  String get depositSafetyExplanation;
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return SEn();
    case 'zh':
      return SZh();
  }

  throw FlutterError(
    'S.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
