// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
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
  String get localeName => 'zh';

  static String m0(age) => "${age}岁";

  static String m1(error) => "认证启动失败: ${error}";

  static String m2(uuid) => "聊天 ${uuid} 未找到";

  static String m3(error) => "连接失败: ${error}";

  static String m4(nickname) => "与 ${nickname} 的约会";

  static String m5(nickname) =>
      "今天跟${nickname}的约会怎么样？有什么好玩或者吐槽的事情跟我分享吗？我会帮你自动润色成日记哦！";

  static String m6(uuid) => "约会 ${uuid} 未找到";

  static String m7(nickname) => "您与 ${nickname} 的约会请求已发送!";

  static String m8(nickname) => "${nickname} 绝对是你最佳的约会对象！";

  static String m9(count) => "${count} / 9 张照片 (最少需要3张)";

  static String m10(profession, industry) => "职业: ${profession}${industry}";

  static String m11(count) => "已选择 ${count} 个兴趣爱好";

  static String m12(status) => "服务器状态: ${status}";

  static String m13(current, total) => "步骤 ${current} / ${total}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("关于"),
        "abstraxionAuth": MessageLookupByLibrary.simpleMessage("Abstraxion 认证"),
        "accountCreatedSuccess":
            MessageLookupByLibrary.simpleMessage("账户创建成功, 请完善信息帮助AI更好配对到理想型."),
        "accountant": MessageLookupByLibrary.simpleMessage("会计师"),
        "addPhoto": MessageLookupByLibrary.simpleMessage("添加照片"),
        "addPhotoButton": MessageLookupByLibrary.simpleMessage("添加照片"),
        "addToCalendar": MessageLookupByLibrary.simpleMessage("🗓️ 添加到日历"),
        "addYourPhotos": MessageLookupByLibrary.simpleMessage("添加你的照片"),
        "address": MessageLookupByLibrary.simpleMessage("地址"),
        "age": MessageLookupByLibrary.simpleMessage("年龄"),
        "ageDescription": MessageLookupByLibrary.simpleMessage("请选择你的出生日期"),
        "ageRange": MessageLookupByLibrary.simpleMessage("年龄"),
        "ageRequirement":
            MessageLookupByLibrary.simpleMessage("你必须年满18岁才能使用此应用"),
        "ageYears": m0,
        "aiFoundCommonalities":
            MessageLookupByLibrary.simpleMessage("此外AI发现了些彼此的共同点"),
        "all": MessageLookupByLibrary.simpleMessage("所有"),
        "appName": MessageLookupByLibrary.simpleMessage("模糊"),
        "applyFilter": MessageLookupByLibrary.simpleMessage("应用过滤器"),
        "area": MessageLookupByLibrary.simpleMessage("区域"),
        "areaExample": MessageLookupByLibrary.simpleMessage("例如：朝阳区"),
        "arts": MessageLookupByLibrary.simpleMessage("艺术"),
        "authInstructions":
            MessageLookupByLibrary.simpleMessage("点击下方按钮，在浏览器中完成安全认证"),
        "authStartError": m1,
        "authStartFailed": MessageLookupByLibrary.simpleMessage("启动认证失败"),
        "back": MessageLookupByLibrary.simpleMessage("返回"),
        "basicInfo": MessageLookupByLibrary.simpleMessage("基本信息"),
        "blockchainAuth": MessageLookupByLibrary.simpleMessage("区块链认证"),
        "buyNFTAndConfirm": MessageLookupByLibrary.simpleMessage("确认"),
        "cancel": MessageLookupByLibrary.simpleMessage("取消"),
        "canceled": MessageLookupByLibrary.simpleMessage("已取消"),
        "cannotConnectToReactServer":
            MessageLookupByLibrary.simpleMessage("无法连接到React服务器，请确保服务器正在运行"),
        "cantFindPartnerMessage":
            MessageLookupByLibrary.simpleMessage("找不到TA？给TA发个消息吧~"),
        "chat": MessageLookupByLibrary.simpleMessage("聊天"),
        "chatNotFound": m2,
        "checkin": MessageLookupByLibrary.simpleMessage("签到"),
        "checkinSuccess": MessageLookupByLibrary.simpleMessage("签到成功！"),
        "checkinSuccessTitle": MessageLookupByLibrary.simpleMessage("签到成功"),
        "chinese": MessageLookupByLibrary.simpleMessage("中文"),
        "city": MessageLookupByLibrary.simpleMessage("城市"),
        "cityExample": MessageLookupByLibrary.simpleMessage("例如：北京"),
        "close": MessageLookupByLibrary.simpleMessage("关闭"),
        "collecting": MessageLookupByLibrary.simpleMessage("收藏"),
        "comingSoon": MessageLookupByLibrary.simpleMessage("即将到来..."),
        "completeAuthInBrowser":
            MessageLookupByLibrary.simpleMessage("请在浏览器中完成认证..."),
        "completeButton": MessageLookupByLibrary.simpleMessage("完成"),
        "completed": MessageLookupByLibrary.simpleMessage("✅ 已完成"),
        "confirm": MessageLookupByLibrary.simpleMessage("确认"),
        "confirmDating": MessageLookupByLibrary.simpleMessage("确认约会"),
        "confirmPassword": MessageLookupByLibrary.simpleMessage("确认密码"),
        "confirmSuccess": MessageLookupByLibrary.simpleMessage("确认成功"),
        "connectServerFirst": MessageLookupByLibrary.simpleMessage("请先连接服务器"),
        "connected": MessageLookupByLibrary.simpleMessage("已连接"),
        "connectingToServer":
            MessageLookupByLibrary.simpleMessage("正在连接服务器..."),
        "connectionError": MessageLookupByLibrary.simpleMessage("连接错误"),
        "connectionFailed": m3,
        "consultant": MessageLookupByLibrary.simpleMessage("咨询师"),
        "continueBtn": MessageLookupByLibrary.simpleMessage("继续"),
        "continueButton": MessageLookupByLibrary.simpleMessage("继续"),
        "conversation": MessageLookupByLibrary.simpleMessage("对话"),
        "cooking": MessageLookupByLibrary.simpleMessage("烹饪"),
        "crafts": MessageLookupByLibrary.simpleMessage("手工"),
        "currentPlan": MessageLookupByLibrary.simpleMessage("您当前的计划是：免费"),
        "dailySignInTip": MessageLookupByLibrary.simpleMessage(
            "每日签到和完成分享日记任务可获得额外积分，积分可用于兑换匹配特权。"),
        "dancing": MessageLookupByLibrary.simpleMessage("舞蹈"),
        "dateTime": MessageLookupByLibrary.simpleMessage("日期时间"),
        "dateWith": m4,
        "dating": MessageLookupByLibrary.simpleMessage("约会"),
        "datingCheckin": MessageLookupByLibrary.simpleMessage("约会打卡"),
        "datingDetails": MessageLookupByLibrary.simpleMessage("约会详情"),
        "datingDiary": MessageLookupByLibrary.simpleMessage("约会日记"),
        "datingDiaryTitle": MessageLookupByLibrary.simpleMessage("约会日记"),
        "datingFeedbackMessage": m5,
        "datingNotFound": m6,
        "datingRequestSent": m7,
        "datingTipsTitle":
            MessageLookupByLibrary.simpleMessage("不会破冰？AI为你准备了约会小贴士"),
        "delete": MessageLookupByLibrary.simpleMessage("删除"),
        "depositExplanation": MessageLookupByLibrary.simpleMessage(
            "支付押金是为了保护双方权益。约会完成后自动全额退款，若未协商一致情况下违约，押金将转给对方作为赔偿。"),
        "depositSafetyExplanation": MessageLookupByLibrary.simpleMessage(
            "您的押金完全安全！我们使用业界先进的区块链技术，确保您的资金可查，可追溯。平台无法私自操作您的资金，仅有您本人可以操作。"),
        "designer": MessageLookupByLibrary.simpleMessage("设计师"),
        "diary": MessageLookupByLibrary.simpleMessage("日记"),
        "diaryPlaceholder": MessageLookupByLibrary.simpleMessage(
            "约会中有什么好玩的事情？或者来吐槽！提交后AI会自动进行自动美化"),
        "disconnected": MessageLookupByLibrary.simpleMessage("未连接"),
        "distance": MessageLookupByLibrary.simpleMessage("距离"),
        "distanceRange": MessageLookupByLibrary.simpleMessage("距离范围"),
        "doctor": MessageLookupByLibrary.simpleMessage("医生"),
        "done": MessageLookupByLibrary.simpleMessage("完成"),
        "dontWantToPay": MessageLookupByLibrary.simpleMessage("不想付费？"),
        "edit": MessageLookupByLibrary.simpleMessage("编辑"),
        "education": MessageLookupByLibrary.simpleMessage("教育"),
        "email": MessageLookupByLibrary.simpleMessage("邮箱"),
        "engineer": MessageLookupByLibrary.simpleMessage("工程师"),
        "english": MessageLookupByLibrary.simpleMessage("English"),
        "enjoySweetMoment": MessageLookupByLibrary.simpleMessage("享受见面的甜美时光吧"),
        "enterAge": MessageLookupByLibrary.simpleMessage("输入你的年龄"),
        "enterNameHint": MessageLookupByLibrary.simpleMessage("输入你的姓名或昵称"),
        "entrepreneur": MessageLookupByLibrary.simpleMessage("创业者"),
        "error": MessageLookupByLibrary.simpleMessage("错误"),
        "faq": MessageLookupByLibrary.simpleMessage("常见问题"),
        "faqDatingSafetyAnswer": MessageLookupByLibrary.simpleMessage(
            "我们非常重视用户的安全。所有约会都需要支付押金，约会完成后全额退款。若未协商一致情况下违约，押金将转给对方作为赔偿。此外，我们提供\"一键报警\"和\"实时位置共享\"等安全功能，确保您的安全。"),
        "faqDatingSafetyQuestion":
            MessageLookupByLibrary.simpleMessage("我的约会安全吗？"),
        "faqDepositRefundAnswer": MessageLookupByLibrary.simpleMessage(
            "双方约会打卡后，押金将在24小时内退还至您的账户。如未打卡，押金将转给对方作为违约赔偿。"),
        "faqDepositRefundQuestion":
            MessageLookupByLibrary.simpleMessage("我的押金何时退还？"),
        "faqEmergencyAnswer": MessageLookupByLibrary.simpleMessage(
            "使用平台内的 \"一键报警\" 功能，快速联系警方，拨打平台客服热线寻求帮助， 平台24小时为您的安全保驾护航。"),
        "faqEmergencyQuestion":
            MessageLookupByLibrary.simpleMessage("约会过程中遇到危险怎么办？"),
        "female": MessageLookupByLibrary.simpleMessage("女性"),
        "filter": MessageLookupByLibrary.simpleMessage("筛选"),
        "filterTitle": MessageLookupByLibrary.simpleMessage("过滤器"),
        "finance": MessageLookupByLibrary.simpleMessage("金融"),
        "fitness": MessageLookupByLibrary.simpleMessage("健身"),
        "foodExploring": MessageLookupByLibrary.simpleMessage("美食探店"),
        "forgotPassword": MessageLookupByLibrary.simpleMessage("忘记密码？"),
        "freeTime": MessageLookupByLibrary.simpleMessage("空闲时间"),
        "freelancer": MessageLookupByLibrary.simpleMessage("自由职业"),
        "gallery": MessageLookupByLibrary.simpleMessage("图库"),
        "gaming": MessageLookupByLibrary.simpleMessage("游戏"),
        "gardening": MessageLookupByLibrary.simpleMessage("园艺"),
        "genderDescription": MessageLookupByLibrary.simpleMessage("请选择你的性别"),
        "government": MessageLookupByLibrary.simpleMessage("政府"),
        "healthcare": MessageLookupByLibrary.simpleMessage("医疗"),
        "height": MessageLookupByLibrary.simpleMessage("身高"),
        "hobbiesDescription":
            MessageLookupByLibrary.simpleMessage("请选择你的兴趣爱好，可以多选"),
        "home": MessageLookupByLibrary.simpleMessage("首页"),
        "homeTown": MessageLookupByLibrary.simpleMessage("家乡"),
        "industry": MessageLookupByLibrary.simpleMessage("行业"),
        "industryOptional": MessageLookupByLibrary.simpleMessage("行业 (可选)"),
        "interestingDifferences":
            MessageLookupByLibrary.simpleMessage("以及一些有趣的差异点"),
        "internet": MessageLookupByLibrary.simpleMessage("互联网"),
        "isMyDepositSafe": MessageLookupByLibrary.simpleMessage("我的押金安全吗？"),
        "job": MessageLookupByLibrary.simpleMessage("职业"),
        "languageSettings": MessageLookupByLibrary.simpleMessage("语言设置"),
        "lawyer": MessageLookupByLibrary.simpleMessage("律师"),
        "legal": MessageLookupByLibrary.simpleMessage("法律"),
        "letMeThink": MessageLookupByLibrary.simpleMessage("我再想想"),
        "lightEating": MessageLookupByLibrary.simpleMessage("清淡"),
        "loading": MessageLookupByLibrary.simpleMessage("加载中..."),
        "location": MessageLookupByLibrary.simpleMessage("位置"),
        "locationDescription":
            MessageLookupByLibrary.simpleMessage("请输入你的居住城市和区域，这将用于匹配附近的用户"),
        "locationDetails": MessageLookupByLibrary.simpleMessage("地点详情"),
        "locationInfo": MessageLookupByLibrary.simpleMessage(
            "你的位置信息将用于计算与其他用户的距离，未填写将自动使用当前定位来确定"),
        "login": MessageLookupByLibrary.simpleMessage("登录"),
        "lookingForBoth": MessageLookupByLibrary.simpleMessage("均可"),
        "lookingForFemales": MessageLookupByLibrary.simpleMessage("寻找女性"),
        "lookingForMales": MessageLookupByLibrary.simpleMessage("寻找男性"),
        "male": MessageLookupByLibrary.simpleMessage("男性"),
        "manageSubscription": MessageLookupByLibrary.simpleMessage("管理订阅"),
        "manufacturing": MessageLookupByLibrary.simpleMessage("制造业"),
        "marketing": MessageLookupByLibrary.simpleMessage("市场"),
        "match": MessageLookupByLibrary.simpleMessage("匹配"),
        "matchReason": MessageLookupByLibrary.simpleMessage("匹配理由"),
        "matchTab": MessageLookupByLibrary.simpleMessage("匹配！"),
        "maxDistance": MessageLookupByLibrary.simpleMessage("最大距离 (KM)"),
        "maxDistanceHint": MessageLookupByLibrary.simpleMessage("30 KM"),
        "mbtiDescription":
            MessageLookupByLibrary.simpleMessage("请选择你的MBTI人格类型，这将帮助我们更好地为你匹配"),
        "mbtiTestNote":
            MessageLookupByLibrary.simpleMessage("不知道自己的MBTI类型？可以稍后在线测试"),
        "meatLover": MessageLookupByLibrary.simpleMessage("爱吃肉"),
        "media": MessageLookupByLibrary.simpleMessage("媒体"),
        "meet": MessageLookupByLibrary.simpleMessage("见面"),
        "membershipSubscription": MessageLookupByLibrary.simpleMessage("会员订阅"),
        "message": MessageLookupByLibrary.simpleMessage("消息"),
        "minDistance": MessageLookupByLibrary.simpleMessage("最小距离 (KM)"),
        "minDistanceHint": MessageLookupByLibrary.simpleMessage("1 KM"),
        "movies": MessageLookupByLibrary.simpleMessage("电影"),
        "music": MessageLookupByLibrary.simpleMessage("音乐"),
        "nameDescription":
            MessageLookupByLibrary.simpleMessage("请输入你的姓名或昵称，这将作为你的个人标识"),
        "nameDisplayNote":
            MessageLookupByLibrary.simpleMessage("这个名字将在你的个人资料中显示"),
        "next": MessageLookupByLibrary.simpleMessage("下一步"),
        "no": MessageLookupByLibrary.simpleMessage("否"),
        "noAccount": MessageLookupByLibrary.simpleMessage("没有账号？ "),
        "noData": MessageLookupByLibrary.simpleMessage("暂无数据"),
        "nonBinary": MessageLookupByLibrary.simpleMessage("非二元性别"),
        "nonprofit": MessageLookupByLibrary.simpleMessage("非营利组织"),
        "notifications": MessageLookupByLibrary.simpleMessage("通知"),
        "ok": MessageLookupByLibrary.simpleMessage("确定"),
        "onboarding": MessageLookupByLibrary.simpleMessage("欢迎"),
        "onboardingTagline": MessageLookupByLibrary.simpleMessage("让心动打个照面"),
        "operations": MessageLookupByLibrary.simpleMessage("运营"),
        "other": MessageLookupByLibrary.simpleMessage("其他"),
        "otherMethods": MessageLookupByLibrary.simpleMessage("其他方式"),
        "outdoorSports": MessageLookupByLibrary.simpleMessage("户外运动"),
        "painting": MessageLookupByLibrary.simpleMessage("绘画"),
        "password": MessageLookupByLibrary.simpleMessage("密码"),
        "past": MessageLookupByLibrary.simpleMessage("已过去"),
        "payDeposit": MessageLookupByLibrary.simpleMessage("支付押金"),
        "pending": MessageLookupByLibrary.simpleMessage("⏱️ 待定"),
        "perfectDatingPartner": m8,
        "pets": MessageLookupByLibrary.simpleMessage("宠物"),
        "photoAlbum": MessageLookupByLibrary.simpleMessage("相册"),
        "photography": MessageLookupByLibrary.simpleMessage("摄影"),
        "photosCounter": m9,
        "photosDescription":
            MessageLookupByLibrary.simpleMessage("添加至少2张照片展示你的个性"),
        "photosStepDescription": MessageLookupByLibrary.simpleMessage(
            "请上传至少3张照片，最多9张。包含不同表情和生活场景的照片，让 AI 更好地认识你"),
        "pleaseConfirmDatingInfo":
            MessageLookupByLibrary.simpleMessage("请确认约会信息"),
        "pleaseSelectGenderYouAreLookingFor":
            MessageLookupByLibrary.simpleMessage("请选择你寻找的对象性别"),
        "poster": MessageLookupByLibrary.simpleMessage("海报"),
        "premiumPlan": MessageLookupByLibrary.simpleMessage("Premium 计划"),
        "premiumPlanDescription":
            MessageLookupByLibrary.simpleMessage("1. 充值30积分/月\n2. 专属客服支持"),
        "processingAuthResult":
            MessageLookupByLibrary.simpleMessage("处理认证结果..."),
        "processingPayment": MessageLookupByLibrary.simpleMessage("正在处理支付..."),
        "productManager": MessageLookupByLibrary.simpleMessage("产品经理"),
        "profession": MessageLookupByLibrary.simpleMessage("职业"),
        "professionDescription":
            MessageLookupByLibrary.simpleMessage("请选择你的职业和所在行业（可选填）"),
        "professionSummary": m10,
        "profile": MessageLookupByLibrary.simpleMessage("个人资料"),
        "programmer": MessageLookupByLibrary.simpleMessage("程序员"),
        "reading": MessageLookupByLibrary.simpleMessage("阅读"),
        "realEstate": MessageLookupByLibrary.simpleMessage("房地产"),
        "reconnect": MessageLookupByLibrary.simpleMessage("重新连接"),
        "register": MessageLookupByLibrary.simpleMessage("注册"),
        "registerNow": MessageLookupByLibrary.simpleMessage("立即注册"),
        "resendCode": MessageLookupByLibrary.simpleMessage("重新发送验证码"),
        "resetFilter": MessageLookupByLibrary.simpleMessage("重置"),
        "resetPassword": MessageLookupByLibrary.simpleMessage("重置密码"),
        "restartApp": MessageLookupByLibrary.simpleMessage("请重启应用以应用新的语言设置"),
        "retail": MessageLookupByLibrary.simpleMessage("零售"),
        "retry": MessageLookupByLibrary.simpleMessage("重试"),
        "returnHome": MessageLookupByLibrary.simpleMessage("返回主页"),
        "sales": MessageLookupByLibrary.simpleMessage("销售"),
        "save": MessageLookupByLibrary.simpleMessage("保存"),
        "search": MessageLookupByLibrary.simpleMessage("搜索"),
        "selectBirthDate": MessageLookupByLibrary.simpleMessage("选择出生日期"),
        "selectLanguage": MessageLookupByLibrary.simpleMessage("选择语言"),
        "selectedHobbiesCount": m11,
        "send": MessageLookupByLibrary.simpleMessage("发送"),
        "serverNotConnected":
            MessageLookupByLibrary.simpleMessage("服务器未连接，请稍后重试"),
        "serverStatus": m12,
        "settings": MessageLookupByLibrary.simpleMessage("设置"),
        "share": MessageLookupByLibrary.simpleMessage("分享"),
        "shareDatingDiary": MessageLookupByLibrary.simpleMessage("分享约会日记"),
        "shareSuccess": MessageLookupByLibrary.simpleMessage("分享成功！"),
        "shareToWechat": MessageLookupByLibrary.simpleMessage("分享海报到微信"),
        "shopping": MessageLookupByLibrary.simpleMessage("购物"),
        "showLess": MessageLookupByLibrary.simpleMessage("显示更少"),
        "showMore": MessageLookupByLibrary.simpleMessage("显示更多"),
        "spicyFood": MessageLookupByLibrary.simpleMessage("爱吃辣"),
        "sports": MessageLookupByLibrary.simpleMessage("体育"),
        "startAuth": MessageLookupByLibrary.simpleMessage("开始认证"),
        "startBlurJourney": MessageLookupByLibrary.simpleMessage("开启Blur之旅！"),
        "startNow": MessageLookupByLibrary.simpleMessage("立即开始！"),
        "stepOfTotal": m13,
        "street": MessageLookupByLibrary.simpleMessage("街道"),
        "streetExample": MessageLookupByLibrary.simpleMessage("例如：西丽区"),
        "student": MessageLookupByLibrary.simpleMessage("学生"),
        "submitDiary": MessageLookupByLibrary.simpleMessage("提交日记"),
        "success": MessageLookupByLibrary.simpleMessage("成功"),
        "supremePlan": MessageLookupByLibrary.simpleMessage("Supreme 计划"),
        "supremePlanDescription": MessageLookupByLibrary.simpleMessage(
            "1. 充值100积分/月\n2. VIP客服支持\n3. 重新匹配已拒绝的配对"),
        "sweetFood": MessageLookupByLibrary.simpleMessage("爱吃甜"),
        "teacher": MessageLookupByLibrary.simpleMessage("教师"),
        "theme": MessageLookupByLibrary.simpleMessage("主题"),
        "time": MessageLookupByLibrary.simpleMessage("时间"),
        "tips": MessageLookupByLibrary.simpleMessage("Tips:"),
        "travel": MessageLookupByLibrary.simpleMessage("旅行"),
        "upcoming": MessageLookupByLibrary.simpleMessage("即将到来"),
        "upgradeSubscriptionPlan":
            MessageLookupByLibrary.simpleMessage("升级您的订阅计划"),
        "userInfo": MessageLookupByLibrary.simpleMessage("用户信息"),
        "vegetarian": MessageLookupByLibrary.simpleMessage("素食"),
        "verification": MessageLookupByLibrary.simpleMessage("验证"),
        "verificationCode": MessageLookupByLibrary.simpleMessage("验证码"),
        "verifyEligibility": MessageLookupByLibrary.simpleMessage("验证资格"),
        "weekend": MessageLookupByLibrary.simpleMessage("周末"),
        "whatIsYourAge": MessageLookupByLibrary.simpleMessage("你的年龄是？"),
        "whatIsYourGender": MessageLookupByLibrary.simpleMessage("你的性别是？"),
        "whatIsYourName": MessageLookupByLibrary.simpleMessage("你的名字是什么？"),
        "whatIsYourProfession":
            MessageLookupByLibrary.simpleMessage("你的职业是什么？"),
        "whatIsYourSexualOrientation":
            MessageLookupByLibrary.simpleMessage("你的性取向是？"),
        "whereDoYouLive": MessageLookupByLibrary.simpleMessage("你住在哪里？"),
        "whyPayDeposit": MessageLookupByLibrary.simpleMessage("为什么要支付押金？"),
        "writing": MessageLookupByLibrary.simpleMessage("写作"),
        "xionMembershipDescription": MessageLookupByLibrary.simpleMessage(
            "1. 资格认证：持有50000个XION代币的活跃用户\n2. 量身定制的VIP恋爱俱乐部\n3. 精心设计的5场恋爱体验"),
        "xionMembershipPlan": MessageLookupByLibrary.simpleMessage("Xion 会员计划"),
        "yes": MessageLookupByLibrary.simpleMessage("是"),
        "yourHobbies": MessageLookupByLibrary.simpleMessage("你的兴趣爱好？"),
        "yourMBTIType": MessageLookupByLibrary.simpleMessage("你的MBTI类型是？")
      };
}
