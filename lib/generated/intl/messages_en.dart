// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(age) => "${age} years old";

  static String m1(error) => "Authentication start failed: ${error}";

  static String m2(uuid) => "Chat with uuid ${uuid} not found";

  static String m3(error) => "Connection failed: ${error}";

  static String m4(nickname) => "Date with ${nickname}";

  static String m5(nickname) =>
      "How was your date with ${nickname} today? Share any fun or interesting things with me, and I\'ll help polish it into a diary entry!";

  static String m6(uuid) => "Dating with uuid ${uuid} not found";

  static String m7(nickname) =>
      "Your dating request with ${nickname} has been sent!";

  static String m8(nickname) =>
      "${nickname} is definitely your perfect dating partner!";

  static String m9(count) => "${count} / 9 photos (minimum 3 required)";

  static String m10(profession, industry) =>
      "Profession: ${profession}${industry}";

  static String m11(count) => "Selected ${count} hobbies";

  static String m12(status) => "Server Status: ${status}";

  static String m13(current, total) => "Step ${current} of ${total}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("About"),
        "abstraxionAuth":
            MessageLookupByLibrary.simpleMessage("Abstraxion Authentication"),
        "accountCreatedSuccess": MessageLookupByLibrary.simpleMessage(
            "Account created successfully, please complete your profile to help AI better match your ideal type."),
        "accountant": MessageLookupByLibrary.simpleMessage("Accountant"),
        "addPhoto": MessageLookupByLibrary.simpleMessage("Add Photo"),
        "addPhotoButton": MessageLookupByLibrary.simpleMessage("Add Photo"),
        "addToCalendar":
            MessageLookupByLibrary.simpleMessage("🗓️ Add to Calendar"),
        "addYourPhotos":
            MessageLookupByLibrary.simpleMessage("Add your photos"),
        "address": MessageLookupByLibrary.simpleMessage("Address"),
        "age": MessageLookupByLibrary.simpleMessage("Age"),
        "ageDescription": MessageLookupByLibrary.simpleMessage(
            "Please select your birth date"),
        "ageRange": MessageLookupByLibrary.simpleMessage("Age"),
        "ageRequirement": MessageLookupByLibrary.simpleMessage(
            "You must be at least 18 years old to use this app"),
        "ageYears": m0,
        "aiFoundCommonalities": MessageLookupByLibrary.simpleMessage(
            "AI also discovered some commonalities between you"),
        "all": MessageLookupByLibrary.simpleMessage("All"),
        "appName": MessageLookupByLibrary.simpleMessage("Blur"),
        "applyFilter": MessageLookupByLibrary.simpleMessage("Apply Filter"),
        "area": MessageLookupByLibrary.simpleMessage("Area"),
        "areaExample":
            MessageLookupByLibrary.simpleMessage("e.g., Chaoyang District"),
        "arts": MessageLookupByLibrary.simpleMessage("Arts"),
        "authInstructions": MessageLookupByLibrary.simpleMessage(
            "Click the button below to complete secure authentication in your browser"),
        "authStartError": m1,
        "authStartFailed": MessageLookupByLibrary.simpleMessage(
            "Failed to start authentication"),
        "back": MessageLookupByLibrary.simpleMessage("Back"),
        "basicInfo": MessageLookupByLibrary.simpleMessage("Basic Info"),
        "blockchainAuth":
            MessageLookupByLibrary.simpleMessage("Blockchain Authentication"),
        "buyNFTAndConfirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "canceled": MessageLookupByLibrary.simpleMessage("Canceled"),
        "cannotConnectToReactServer": MessageLookupByLibrary.simpleMessage(
            "Cannot connect to React server, please ensure the server is running"),
        "cantFindPartnerMessage": MessageLookupByLibrary.simpleMessage(
            "Can\'t find them? Send them a message!"),
        "chat": MessageLookupByLibrary.simpleMessage("Chat"),
        "chatNotFound": m2,
        "checkin": MessageLookupByLibrary.simpleMessage("Check In"),
        "checkinSuccess":
            MessageLookupByLibrary.simpleMessage("Check-in successful!"),
        "checkinSuccessTitle":
            MessageLookupByLibrary.simpleMessage("Check-in Successful"),
        "chinese": MessageLookupByLibrary.simpleMessage("中文"),
        "city": MessageLookupByLibrary.simpleMessage("City"),
        "cityExample": MessageLookupByLibrary.simpleMessage("e.g., Beijing"),
        "close": MessageLookupByLibrary.simpleMessage("Close"),
        "collecting": MessageLookupByLibrary.simpleMessage("Collecting"),
        "comingSoon": MessageLookupByLibrary.simpleMessage("Coming soon..."),
        "completeAuthInBrowser": MessageLookupByLibrary.simpleMessage(
            "Please complete authentication in your browser..."),
        "completeButton": MessageLookupByLibrary.simpleMessage("Complete"),
        "completed": MessageLookupByLibrary.simpleMessage("✅ Completed"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "confirmDating": MessageLookupByLibrary.simpleMessage("Confirm Dating"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "confirmSuccess":
            MessageLookupByLibrary.simpleMessage("Confirmation Successful"),
        "connectServerFirst": MessageLookupByLibrary.simpleMessage(
            "Please connect to server first"),
        "connected": MessageLookupByLibrary.simpleMessage("Connected"),
        "connectingToServer":
            MessageLookupByLibrary.simpleMessage("Connecting to server..."),
        "connectionError":
            MessageLookupByLibrary.simpleMessage("Connection Error"),
        "connectionFailed": m3,
        "consultant": MessageLookupByLibrary.simpleMessage("Consultant"),
        "continueBtn": MessageLookupByLibrary.simpleMessage("Continue"),
        "continueButton": MessageLookupByLibrary.simpleMessage("Continue"),
        "conversation": MessageLookupByLibrary.simpleMessage("Conversation"),
        "cooking": MessageLookupByLibrary.simpleMessage("Cooking"),
        "crafts": MessageLookupByLibrary.simpleMessage("Crafts"),
        "currentPlan":
            MessageLookupByLibrary.simpleMessage("Your current plan is: Free"),
        "dailySignInTip": MessageLookupByLibrary.simpleMessage(
            "Daily sign-in and completing diary sharing tasks can earn extra points, which can be used to redeem matching privileges."),
        "dancing": MessageLookupByLibrary.simpleMessage("Dancing"),
        "dateTime": MessageLookupByLibrary.simpleMessage("Date & Time"),
        "dateWith": m4,
        "dating": MessageLookupByLibrary.simpleMessage("Dating"),
        "datingCheckin":
            MessageLookupByLibrary.simpleMessage("Dating Check-in"),
        "datingDetails": MessageLookupByLibrary.simpleMessage("Dating Details"),
        "datingDiary": MessageLookupByLibrary.simpleMessage("Dating Diary"),
        "datingDiaryTitle":
            MessageLookupByLibrary.simpleMessage("Dating Diary"),
        "datingFeedbackMessage": m5,
        "datingNotFound": m6,
        "datingRequestSent": m7,
        "datingTipsTitle": MessageLookupByLibrary.simpleMessage(
            "Need help breaking the ice? AI has prepared dating tips for you"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "depositExplanation": MessageLookupByLibrary.simpleMessage(
            "The deposit is to protect both parties\' rights. It will be automatically refunded in full after the date is completed. If you break the agreement without mutual consent, the deposit will be transferred to the other party as compensation."),
        "depositSafetyExplanation": MessageLookupByLibrary.simpleMessage(
            "Your deposit is completely safe! We use advanced blockchain technology to ensure your funds are traceable and verifiable. The platform cannot operate your funds without authorization - only you can operate them."),
        "designer": MessageLookupByLibrary.simpleMessage("Designer"),
        "diary": MessageLookupByLibrary.simpleMessage("Diary"),
        "diaryPlaceholder": MessageLookupByLibrary.simpleMessage(
            "What interesting things happened during the date? Or come and complain! AI will automatically beautify after submission"),
        "disconnected": MessageLookupByLibrary.simpleMessage("Disconnected"),
        "distance": MessageLookupByLibrary.simpleMessage("Distance"),
        "distanceRange": MessageLookupByLibrary.simpleMessage("Distance Range"),
        "doctor": MessageLookupByLibrary.simpleMessage("Doctor"),
        "done": MessageLookupByLibrary.simpleMessage("Done"),
        "dontWantToPay":
            MessageLookupByLibrary.simpleMessage("Don\'t want to pay?"),
        "edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "education": MessageLookupByLibrary.simpleMessage("Education"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "engineer": MessageLookupByLibrary.simpleMessage("Engineer"),
        "english": MessageLookupByLibrary.simpleMessage("English"),
        "enjoySweetMoment": MessageLookupByLibrary.simpleMessage(
            "Enjoy the sweet moments of meeting!"),
        "enterAge": MessageLookupByLibrary.simpleMessage("Enter your age"),
        "enterNameHint":
            MessageLookupByLibrary.simpleMessage("Enter your name or nickname"),
        "entrepreneur": MessageLookupByLibrary.simpleMessage("Entrepreneur"),
        "error": MessageLookupByLibrary.simpleMessage("Error"),
        "faq": MessageLookupByLibrary.simpleMessage("FAQ"),
        "faqDatingSafetyAnswer": MessageLookupByLibrary.simpleMessage(
            "We take user safety very seriously. All dates require a deposit, which is fully refunded after the date is completed. If there is a breach of contract without mutual agreement, the deposit will be transferred to the other party as compensation. Additionally, we provide safety features such as \"one-touch emergency\" and \"real-time location sharing\" to ensure your safety."),
        "faqDatingSafetyQuestion":
            MessageLookupByLibrary.simpleMessage("Is my date safe?"),
        "faqDepositRefundAnswer": MessageLookupByLibrary.simpleMessage(
            "After both parties check in for the date, the deposit will be refunded to your account within 24 hours. If there is no check-in, the deposit will be transferred to the other party as breach compensation."),
        "faqDepositRefundQuestion": MessageLookupByLibrary.simpleMessage(
            "When will my deposit be refunded?"),
        "faqEmergencyAnswer": MessageLookupByLibrary.simpleMessage(
            "Use the \"one-touch emergency\" feature in the platform to quickly contact the police, call the platform customer service hotline for help. The platform provides 24-hour safety protection for you."),
        "faqEmergencyQuestion": MessageLookupByLibrary.simpleMessage(
            "What to do if I encounter danger during a date?"),
        "female": MessageLookupByLibrary.simpleMessage("Female"),
        "filter": MessageLookupByLibrary.simpleMessage("Filter"),
        "filterTitle": MessageLookupByLibrary.simpleMessage("Filter"),
        "finance": MessageLookupByLibrary.simpleMessage("Finance"),
        "fitness": MessageLookupByLibrary.simpleMessage("Fitness"),
        "foodExploring": MessageLookupByLibrary.simpleMessage("Food Exploring"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot Password?"),
        "freeTime": MessageLookupByLibrary.simpleMessage("Free Time"),
        "freelancer": MessageLookupByLibrary.simpleMessage("Freelancer"),
        "gallery": MessageLookupByLibrary.simpleMessage("Gallery"),
        "gaming": MessageLookupByLibrary.simpleMessage("Gaming"),
        "gardening": MessageLookupByLibrary.simpleMessage("Gardening"),
        "genderDescription":
            MessageLookupByLibrary.simpleMessage("Please select your gender"),
        "government": MessageLookupByLibrary.simpleMessage("Government"),
        "healthcare": MessageLookupByLibrary.simpleMessage("Healthcare"),
        "height": MessageLookupByLibrary.simpleMessage("Height"),
        "hobbiesDescription": MessageLookupByLibrary.simpleMessage(
            "Please select your hobbies, multiple selections allowed"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "homeTown": MessageLookupByLibrary.simpleMessage("Hometown"),
        "industry": MessageLookupByLibrary.simpleMessage("Industry"),
        "industryOptional":
            MessageLookupByLibrary.simpleMessage("Industry (optional)"),
        "interestingDifferences": MessageLookupByLibrary.simpleMessage(
            "And some interesting differences"),
        "internet": MessageLookupByLibrary.simpleMessage("Internet"),
        "isMyDepositSafe":
            MessageLookupByLibrary.simpleMessage("Is my deposit safe?"),
        "job": MessageLookupByLibrary.simpleMessage("Job"),
        "languageSettings":
            MessageLookupByLibrary.simpleMessage("Language Settings"),
        "lawyer": MessageLookupByLibrary.simpleMessage("Lawyer"),
        "legal": MessageLookupByLibrary.simpleMessage("Legal"),
        "letMeThink": MessageLookupByLibrary.simpleMessage("Let me think"),
        "lightEating": MessageLookupByLibrary.simpleMessage("Light Eating"),
        "loading": MessageLookupByLibrary.simpleMessage("Loading..."),
        "location": MessageLookupByLibrary.simpleMessage("Location"),
        "locationDescription": MessageLookupByLibrary.simpleMessage(
            "Please enter your city and area, this will be used to match nearby users"),
        "locationDetails":
            MessageLookupByLibrary.simpleMessage("Location Details"),
        "locationInfo": MessageLookupByLibrary.simpleMessage(
            "Your location information will be used to calculate distance from other users. If not filled, current location will be used automatically"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "lookingForBoth": MessageLookupByLibrary.simpleMessage("Both"),
        "lookingForFemales":
            MessageLookupByLibrary.simpleMessage("Looking for females"),
        "lookingForMales":
            MessageLookupByLibrary.simpleMessage("Looking for males"),
        "male": MessageLookupByLibrary.simpleMessage("Male"),
        "manageSubscription":
            MessageLookupByLibrary.simpleMessage("Manage Subscription"),
        "manufacturing": MessageLookupByLibrary.simpleMessage("Manufacturing"),
        "marketing": MessageLookupByLibrary.simpleMessage("Marketing"),
        "match": MessageLookupByLibrary.simpleMessage("Match"),
        "matchReason": MessageLookupByLibrary.simpleMessage("Match Reason"),
        "matchTab": MessageLookupByLibrary.simpleMessage("Match!"),
        "maxDistance":
            MessageLookupByLibrary.simpleMessage("Max Distance (KM)"),
        "maxDistanceHint": MessageLookupByLibrary.simpleMessage("30 KM"),
        "mbtiDescription": MessageLookupByLibrary.simpleMessage(
            "Please select your MBTI personality type, this will help us match you better"),
        "mbtiTestNote": MessageLookupByLibrary.simpleMessage(
            "Don\'t know your MBTI type? You can take an online test later"),
        "meatLover": MessageLookupByLibrary.simpleMessage("Meat Lover"),
        "media": MessageLookupByLibrary.simpleMessage("Media"),
        "meet": MessageLookupByLibrary.simpleMessage("Meet"),
        "membershipSubscription":
            MessageLookupByLibrary.simpleMessage("Membership Subscription"),
        "message": MessageLookupByLibrary.simpleMessage("Message"),
        "minDistance":
            MessageLookupByLibrary.simpleMessage("Min Distance (KM)"),
        "minDistanceHint": MessageLookupByLibrary.simpleMessage("1 KM"),
        "movies": MessageLookupByLibrary.simpleMessage("Movies"),
        "music": MessageLookupByLibrary.simpleMessage("Music"),
        "nameDescription": MessageLookupByLibrary.simpleMessage(
            "Please enter your name or nickname, this will serve as your personal identifier"),
        "nameDisplayNote": MessageLookupByLibrary.simpleMessage(
            "This name will be displayed in your profile"),
        "next": MessageLookupByLibrary.simpleMessage("Next"),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "noAccount":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account? "),
        "noData": MessageLookupByLibrary.simpleMessage("No data available"),
        "nonBinary": MessageLookupByLibrary.simpleMessage("Non-binary"),
        "nonprofit": MessageLookupByLibrary.simpleMessage("Non-profit"),
        "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "onboarding": MessageLookupByLibrary.simpleMessage("Welcome"),
        "onboardingTagline":
            MessageLookupByLibrary.simpleMessage("See me, then talk to me"),
        "operations": MessageLookupByLibrary.simpleMessage("Operations"),
        "other": MessageLookupByLibrary.simpleMessage("Other"),
        "otherMethods": MessageLookupByLibrary.simpleMessage("Other Methods"),
        "outdoorSports": MessageLookupByLibrary.simpleMessage("Outdoor Sports"),
        "painting": MessageLookupByLibrary.simpleMessage("Painting"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "past": MessageLookupByLibrary.simpleMessage("Past"),
        "payDeposit": MessageLookupByLibrary.simpleMessage("Pay Deposit"),
        "pending": MessageLookupByLibrary.simpleMessage("⏱️ Pending"),
        "perfectDatingPartner": m8,
        "pets": MessageLookupByLibrary.simpleMessage("Pets"),
        "photoAlbum": MessageLookupByLibrary.simpleMessage("Photo Album"),
        "photography": MessageLookupByLibrary.simpleMessage("Photography"),
        "photosCounter": m9,
        "photosDescription": MessageLookupByLibrary.simpleMessage(
            "Add at least 2 photos to show your personality"),
        "photosStepDescription": MessageLookupByLibrary.simpleMessage(
            "Please upload at least 3 photos, up to 9. Include photos with different expressions and life scenes to help AI get to know you better"),
        "pleaseConfirmDatingInfo": MessageLookupByLibrary.simpleMessage(
            "Please confirm dating information"),
        "pleaseSelectGenderYouAreLookingFor":
            MessageLookupByLibrary.simpleMessage(
                "Please select the gender you are looking for"),
        "poster": MessageLookupByLibrary.simpleMessage("Poster"),
        "premiumPlan": MessageLookupByLibrary.simpleMessage("Premium Plan"),
        "premiumPlanDescription": MessageLookupByLibrary.simpleMessage(
            "1. Recharge 30 points/month\n2. Exclusive customer support"),
        "processingAuthResult": MessageLookupByLibrary.simpleMessage(
            "Processing authentication result..."),
        "processingPayment":
            MessageLookupByLibrary.simpleMessage("Processing Payment..."),
        "productManager":
            MessageLookupByLibrary.simpleMessage("Product Manager"),
        "profession": MessageLookupByLibrary.simpleMessage("Profession"),
        "professionDescription": MessageLookupByLibrary.simpleMessage(
            "Please select your profession and industry (optional)"),
        "professionSummary": m10,
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "programmer": MessageLookupByLibrary.simpleMessage("Programmer"),
        "reading": MessageLookupByLibrary.simpleMessage("Reading"),
        "realEstate": MessageLookupByLibrary.simpleMessage("Real Estate"),
        "reconnect": MessageLookupByLibrary.simpleMessage("Reconnect"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "registerNow": MessageLookupByLibrary.simpleMessage("Register Now"),
        "resendCode": MessageLookupByLibrary.simpleMessage("Resend Code"),
        "resetFilter": MessageLookupByLibrary.simpleMessage("Reset"),
        "resetPassword": MessageLookupByLibrary.simpleMessage("Reset Password"),
        "restartApp": MessageLookupByLibrary.simpleMessage(
            "Please restart the app to apply the new language settings"),
        "retail": MessageLookupByLibrary.simpleMessage("Retail"),
        "retry": MessageLookupByLibrary.simpleMessage("Retry"),
        "returnHome": MessageLookupByLibrary.simpleMessage("Return Home"),
        "sales": MessageLookupByLibrary.simpleMessage("Sales"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "selectBirthDate":
            MessageLookupByLibrary.simpleMessage("Select birth date"),
        "selectLanguage":
            MessageLookupByLibrary.simpleMessage("Select Language"),
        "selectedHobbiesCount": m11,
        "send": MessageLookupByLibrary.simpleMessage("Send"),
        "serverNotConnected": MessageLookupByLibrary.simpleMessage(
            "Server not connected, please try again later"),
        "serverStatus": m12,
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "share": MessageLookupByLibrary.simpleMessage("Share"),
        "shareDatingDiary":
            MessageLookupByLibrary.simpleMessage("Share Dating Diary"),
        "shareSuccess":
            MessageLookupByLibrary.simpleMessage("Shared successfully!"),
        "shareToWechat":
            MessageLookupByLibrary.simpleMessage("Share Poster to WeChat"),
        "shopping": MessageLookupByLibrary.simpleMessage("Shopping"),
        "showLess": MessageLookupByLibrary.simpleMessage("Show less"),
        "showMore": MessageLookupByLibrary.simpleMessage("Show more"),
        "spicyFood": MessageLookupByLibrary.simpleMessage("Spicy Food"),
        "sports": MessageLookupByLibrary.simpleMessage("Sports"),
        "startAuth":
            MessageLookupByLibrary.simpleMessage("Start Authentication"),
        "startBlurJourney":
            MessageLookupByLibrary.simpleMessage("Start Your Blur Journey!"),
        "startNow": MessageLookupByLibrary.simpleMessage("Start Now!"),
        "stepOfTotal": m13,
        "street": MessageLookupByLibrary.simpleMessage("Street"),
        "streetExample":
            MessageLookupByLibrary.simpleMessage("e.g., Xili District"),
        "student": MessageLookupByLibrary.simpleMessage("Student"),
        "submitDiary": MessageLookupByLibrary.simpleMessage("Submit Diary"),
        "success": MessageLookupByLibrary.simpleMessage("Success"),
        "supremePlan": MessageLookupByLibrary.simpleMessage("Supreme Plan"),
        "supremePlanDescription": MessageLookupByLibrary.simpleMessage(
            "1. Recharge 100 points/month\n2. VIP customer support\n3. Rematch rejected matches"),
        "sweetFood": MessageLookupByLibrary.simpleMessage("Sweet Food"),
        "teacher": MessageLookupByLibrary.simpleMessage("Teacher"),
        "theme": MessageLookupByLibrary.simpleMessage("Theme"),
        "time": MessageLookupByLibrary.simpleMessage("Time"),
        "tips": MessageLookupByLibrary.simpleMessage("Tips:"),
        "travel": MessageLookupByLibrary.simpleMessage("Travel"),
        "upcoming": MessageLookupByLibrary.simpleMessage("Upcoming"),
        "upgradeSubscriptionPlan": MessageLookupByLibrary.simpleMessage(
            "Upgrade Your Subscription Plan"),
        "userInfo": MessageLookupByLibrary.simpleMessage("User Info"),
        "vegetarian": MessageLookupByLibrary.simpleMessage("Vegetarian"),
        "verification": MessageLookupByLibrary.simpleMessage("Verification"),
        "verificationCode":
            MessageLookupByLibrary.simpleMessage("Verification Code"),
        "verifyEligibility":
            MessageLookupByLibrary.simpleMessage("Verify Eligibility"),
        "weekend": MessageLookupByLibrary.simpleMessage("Weekend"),
        "whatIsYourAge":
            MessageLookupByLibrary.simpleMessage("What\'s your age?"),
        "whatIsYourGender":
            MessageLookupByLibrary.simpleMessage("What\'s your gender?"),
        "whatIsYourName":
            MessageLookupByLibrary.simpleMessage("What\'s your name?"),
        "whatIsYourProfession":
            MessageLookupByLibrary.simpleMessage("What is your profession?"),
        "whatIsYourSexualOrientation": MessageLookupByLibrary.simpleMessage(
            "What is your sexual orientation?"),
        "whereDoYouLive":
            MessageLookupByLibrary.simpleMessage("Where do you live?"),
        "whyPayDeposit":
            MessageLookupByLibrary.simpleMessage("Why pay a deposit?"),
        "writing": MessageLookupByLibrary.simpleMessage("Writing"),
        "xionMembershipDescription": MessageLookupByLibrary.simpleMessage(
            "1. Qualification certification: Active users holding 50,000 XION tokens\n2. Tailored VIP dating club\n3. Carefully designed 5 dating experiences"),
        "xionMembershipPlan":
            MessageLookupByLibrary.simpleMessage("Xion Membership Plan"),
        "yes": MessageLookupByLibrary.simpleMessage("Yes"),
        "yourHobbies":
            MessageLookupByLibrary.simpleMessage("What are your hobbies?"),
        "yourMBTIType":
            MessageLookupByLibrary.simpleMessage("What\'s your MBTI type?")
      };
}
