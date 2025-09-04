// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class SZh extends S {
  SZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => '模糊';

  @override
  String get login => '登录';

  @override
  String get register => '注册';

  @override
  String get email => '邮箱';

  @override
  String get password => '密码';

  @override
  String get confirmPassword => '确认密码';

  @override
  String get forgotPassword => '忘记密码？';

  @override
  String get resetPassword => '重置密码';

  @override
  String get verification => '验证';

  @override
  String get verificationCode => '验证码';

  @override
  String get resendCode => '重新发送验证码';

  @override
  String get onboarding => '欢迎';

  @override
  String get home => '首页';

  @override
  String get chat => '聊天';

  @override
  String get dating => '约会';

  @override
  String get match => '匹配';

  @override
  String get settings => '设置';

  @override
  String get profile => '个人资料';

  @override
  String get notifications => '通知';

  @override
  String get search => '搜索';

  @override
  String get filter => '筛选';

  @override
  String get location => '位置';

  @override
  String get age => '年龄';

  @override
  String get about => '关于';

  @override
  String get gallery => '图库';

  @override
  String get confirm => '确认';

  @override
  String get cancel => '取消';

  @override
  String get save => '保存';

  @override
  String get edit => '编辑';

  @override
  String get delete => '删除';

  @override
  String get share => '分享';

  @override
  String get send => '发送';

  @override
  String get message => '消息';

  @override
  String get conversation => '对话';

  @override
  String get datingDiary => '约会日记';

  @override
  String get checkin => '签到';

  @override
  String get success => '成功';

  @override
  String get error => '错误';

  @override
  String get loading => '加载中...';

  @override
  String get noData => '暂无数据';

  @override
  String get retry => '重试';

  @override
  String get back => '返回';

  @override
  String get next => '下一步';

  @override
  String get done => '完成';

  @override
  String get close => '关闭';

  @override
  String get processingAuthResult => '处理认证结果...';

  @override
  String datingNotFound(String uuid) {
    return '约会 $uuid 未找到';
  }

  @override
  String chatNotFound(String uuid) {
    return '聊天 $uuid 未找到';
  }

  @override
  String get yes => '是';

  @override
  String get no => '否';

  @override
  String get ok => '确定';

  @override
  String get otherMethods => '其他方式';

  @override
  String get noAccount => '没有账号？ ';

  @override
  String get registerNow => '立即注册';

  @override
  String get meet => '见面';

  @override
  String get matchTab => '匹配！';

  @override
  String get languageSettings => '语言设置';

  @override
  String get restartApp => '请重启应用以应用新的语言设置';

  @override
  String get english => 'English';

  @override
  String get chinese => '中文';

  @override
  String get selectLanguage => '选择语言';

  @override
  String get dateTime => '日期时间';

  @override
  String get checkinSuccess => '签到成功！';

  @override
  String get diary => '日记';

  @override
  String get poster => '海报';

  @override
  String get shareSuccess => '分享成功！';

  @override
  String get upcoming => '即将到来';

  @override
  String get past => '已过去';

  @override
  String get canceled => '已取消';

  @override
  String get addToCalendar => '🗓️ 添加到日历';

  @override
  String get completed => '✅ 已完成';

  @override
  String get pending => '⏱️ 待定';

  @override
  String dateWith(String nickname) {
    return '与 $nickname 的约会';
  }

  @override
  String get filterTitle => '过滤器';

  @override
  String get distanceRange => '距离范围';

  @override
  String get minDistance => '最小距离 (KM)';

  @override
  String get maxDistance => '最大距离 (KM)';

  @override
  String get minDistanceHint => '1 KM';

  @override
  String get maxDistanceHint => '30 KM';

  @override
  String get freeTime => '空闲时间';

  @override
  String get all => '所有';

  @override
  String get weekend => '周末';

  @override
  String get applyFilter => '应用过滤器';

  @override
  String get resetFilter => '重置';

  @override
  String get datingDetails => '约会详情';

  @override
  String get checkinSuccessTitle => '签到成功';

  @override
  String get enjoySweetMoment => '享受见面的甜美时光吧';

  @override
  String get cantFindPartnerMessage => '找不到TA？给TA发个消息吧~';

  @override
  String get confirmSuccess => '确认成功';

  @override
  String get shareToWechat => '分享海报到微信';

  @override
  String get returnHome => '返回主页';

  @override
  String get datingCheckin => '约会打卡';

  @override
  String get shareDatingDiary => '分享约会日记';

  @override
  String get submitDiary => '提交日记';

  @override
  String get diaryPlaceholder => '约会中有什么好玩的事情？或者来吐槽！提交后AI会自动进行自动美化';

  @override
  String get buyNFTAndConfirm => '确认';

  @override
  String get processingPayment => '正在处理支付...';

  @override
  String get continueBtn => '继续';

  @override
  String get membershipSubscription => '会员订阅';

  @override
  String get onboardingTagline => '让心动打个照面';

  @override
  String get letMeThink => '我再想想';

  @override
  String get confirmDating => '确认约会';

  @override
  String datingFeedbackMessage(String nickname) {
    return '今天跟$nickname的约会怎么样？有什么好玩或者吐槽的事情跟我分享吗？我会帮你自动润色成日记哦！';
  }

  @override
  String perfectDatingPartner(String nickname) {
    return '$nickname 绝对是你最佳的约会对象！';
  }

  @override
  String get photoAlbum => '相册';

  @override
  String get aiFoundCommonalities => '此外AI发现了些彼此的共同点';

  @override
  String get interestingDifferences => '以及一些有趣的差异点';

  @override
  String get datingDiaryTitle => '约会日记';

  @override
  String get faq => '常见问题';

  @override
  String get faqDatingSafetyQuestion => '我的约会安全吗？';

  @override
  String get faqDatingSafetyAnswer =>
      '我们非常重视用户的安全。所有约会都需要支付押金，约会完成后全额退款。若未协商一致情况下违约，押金将转给对方作为赔偿。此外，我们提供\"一键报警\"和\"实时位置共享\"等安全功能，确保您的安全。';

  @override
  String get faqEmergencyQuestion => '约会过程中遇到危险怎么办？';

  @override
  String get faqEmergencyAnswer =>
      '使用平台内的 \"一键报警\" 功能，快速联系警方，拨打平台客服热线寻求帮助， 平台24小时为您的安全保驾护航。';

  @override
  String get faqDepositRefundQuestion => '我的押金何时退还？';

  @override
  String get faqDepositRefundAnswer =>
      '双方约会打卡后，押金将在24小时内退还至您的账户。如未打卡，押金将转给对方作为违约赔偿。';

  @override
  String get matchReason => '匹配理由';

  @override
  String get showMore => '显示更多';

  @override
  String get showLess => '显示更少';

  @override
  String get userInfo => '用户信息';

  @override
  String get basicInfo => '基本信息';

  @override
  String get ageRange => '年龄';

  @override
  String get height => '身高';

  @override
  String get homeTown => '家乡';

  @override
  String get education => '教育';

  @override
  String get job => '职业';

  @override
  String datingRequestSent(String nickname) {
    return '您与 $nickname 的约会请求已发送!';
  }

  @override
  String get datingTipsTitle => '不会破冰？AI为你准备了约会小贴士';

  @override
  String get abstraxionAuth => 'Abstraxion 认证';

  @override
  String get reconnect => '重新连接';

  @override
  String get connectingToServer => '正在连接服务器...';

  @override
  String get connectionError => '连接错误';

  @override
  String get blockchainAuth => '区块链认证';

  @override
  String get authInstructions => '点击下方按钮，在浏览器中完成安全认证';

  @override
  String get startAuth => '开始认证';

  @override
  String serverStatus(String status) {
    return '服务器状态: $status';
  }

  @override
  String get connected => '已连接';

  @override
  String get disconnected => '未连接';

  @override
  String get serverNotConnected => '服务器未连接，请稍后重试';

  @override
  String get completeAuthInBrowser => '请在浏览器中完成认证...';

  @override
  String get authStartFailed => '启动认证失败';

  @override
  String authStartError(String error) {
    return '认证启动失败: $error';
  }

  @override
  String get connectServerFirst => '请先连接服务器';

  @override
  String get cannotConnectToReactServer => '无法连接到React服务器，请确保服务器正在运行';

  @override
  String connectionFailed(String error) {
    return '连接失败: $error';
  }

  @override
  String get startBlurJourney => '开启Blur之旅！';

  @override
  String get startNow => '立即开始！';

  @override
  String get accountCreatedSuccess => '账户创建成功, 请完善信息帮助AI更好配对到理想型.';

  @override
  String get whatIsYourName => '你的名字是什么？';

  @override
  String get nameDescription => '请输入你的姓名或昵称，这将作为你的个人标识';

  @override
  String get enterNameHint => '输入你的姓名或昵称';

  @override
  String get nameDisplayNote => '这个名字将在你的个人资料中显示';

  @override
  String get yourMBTIType => '你的MBTI类型是？';

  @override
  String get mbtiDescription => '请选择你的MBTI人格类型，这将帮助我们更好地为你匹配';

  @override
  String get mbtiTestNote => '不知道自己的MBTI类型？可以稍后在线测试';

  @override
  String get yourHobbies => '你的兴趣爱好？';

  @override
  String get hobbiesDescription => '请选择你的兴趣爱好，可以多选';

  @override
  String selectedHobbiesCount(int count) {
    return '已选择 $count 个兴趣爱好';
  }

  @override
  String get movies => '电影';

  @override
  String get music => '音乐';

  @override
  String get outdoorSports => '户外运动';

  @override
  String get foodExploring => '美食探店';

  @override
  String get reading => '阅读';

  @override
  String get travel => '旅行';

  @override
  String get gaming => '游戏';

  @override
  String get photography => '摄影';

  @override
  String get fitness => '健身';

  @override
  String get painting => '绘画';

  @override
  String get writing => '写作';

  @override
  String get cooking => '烹饪';

  @override
  String get dancing => '舞蹈';

  @override
  String get shopping => '购物';

  @override
  String get pets => '宠物';

  @override
  String get crafts => '手工';

  @override
  String get collecting => '收藏';

  @override
  String get gardening => '园艺';

  @override
  String get vegetarian => '素食';

  @override
  String get lightEating => '清淡';

  @override
  String get spicyFood => '爱吃辣';

  @override
  String get sweetFood => '爱吃甜';

  @override
  String get meatLover => '爱吃肉';

  @override
  String get whatIsYourAge => '你的年龄是？';

  @override
  String get ageDescription => '请选择你的出生日期';

  @override
  String get selectBirthDate => '选择出生日期';

  @override
  String ageYears(int age) {
    return '$age岁';
  }

  @override
  String get ageRequirement => '你必须年满18岁才能使用此应用';

  @override
  String get enterAge => '输入你的年龄';

  @override
  String get whatIsYourGender => '你的性别是？';

  @override
  String get genderDescription => '请选择你的性别';

  @override
  String get male => '男性';

  @override
  String get female => '女性';

  @override
  String get nonBinary => '非二元性别';

  @override
  String get addYourPhotos => '添加你的照片';

  @override
  String get photosDescription => '添加至少2张照片展示你的个性';

  @override
  String get addPhoto => '添加照片';

  @override
  String get upgradeSubscriptionPlan => '升级您的订阅计划';

  @override
  String get currentPlan => '您当前的计划是：免费';

  @override
  String get comingSoon => '即将到来...';

  @override
  String get xionMembershipPlan => 'Xion 会员计划';

  @override
  String get xionMembershipDescription =>
      '1. 资格认证：持有50000个XION代币的活跃用户\n2. 量身定制的VIP恋爱俱乐部\n3. 精心设计的5场恋爱体验';

  @override
  String get verifyEligibility => '验证资格';

  @override
  String get tips => 'Tips:';

  @override
  String get dontWantToPay => '不想付费？';

  @override
  String get dailySignInTip => '每日签到和完成分享日记任务可获得额外积分，积分可用于兑换匹配特权。';

  @override
  String get premiumPlan => 'Premium 计划';

  @override
  String get premiumPlanDescription => '1. 充值30积分/月\n2. 专属客服支持';

  @override
  String get manageSubscription => '管理订阅';

  @override
  String get supremePlan => 'Supreme 计划';

  @override
  String get supremePlanDescription =>
      '1. 充值100积分/月\n2. VIP客服支持\n3. 重新匹配已拒绝的配对';

  @override
  String stepOfTotal(String current, String total) {
    return '步骤 $current / $total';
  }

  @override
  String get continueButton => '继续';

  @override
  String get completeButton => '完成';

  @override
  String get other => '其他';

  @override
  String get whatIsYourSexualOrientation => '你的性取向是？';

  @override
  String get pleaseSelectGenderYouAreLookingFor => '请选择你寻找的对象性别';

  @override
  String get lookingForMales => '寻找男性';

  @override
  String get lookingForFemales => '寻找女性';

  @override
  String get lookingForBoth => '均可';

  @override
  String get whereDoYouLive => '你住在哪里？';

  @override
  String get locationDescription => '请输入你的居住城市和区域，这将用于匹配附近的用户';

  @override
  String get city => '城市';

  @override
  String get cityExample => '例如：北京';

  @override
  String get area => '区域';

  @override
  String get areaExample => '例如：朝阳区';

  @override
  String get street => '街道';

  @override
  String get streetExample => '例如：西丽区';

  @override
  String get locationInfo => '你的位置信息将用于计算与其他用户的距离，未填写将自动使用当前定位来确定';

  @override
  String get whatIsYourProfession => '你的职业是什么？';

  @override
  String get professionDescription => '请选择你的职业和所在行业（可选填）';

  @override
  String get profession => '职业';

  @override
  String get industry => '行业';

  @override
  String get industryOptional => '行业 (可选)';

  @override
  String professionSummary(String profession, String industry) {
    return '职业: $profession$industry';
  }

  @override
  String get photosStepDescription =>
      '请上传至少3张照片，最多9张。包含不同表情和生活场景的照片，让 AI 更好地认识你';

  @override
  String photosCounter(int count) {
    return '$count / 9 张照片 (最少需要3张)';
  }

  @override
  String get addPhotoButton => '添加照片';

  @override
  String get student => '学生';

  @override
  String get teacher => '教师';

  @override
  String get doctor => '医生';

  @override
  String get engineer => '工程师';

  @override
  String get designer => '设计师';

  @override
  String get sales => '销售';

  @override
  String get operations => '运营';

  @override
  String get marketing => '市场';

  @override
  String get productManager => '产品经理';

  @override
  String get programmer => '程序员';

  @override
  String get lawyer => '律师';

  @override
  String get accountant => '会计师';

  @override
  String get finance => '金融';

  @override
  String get consultant => '咨询师';

  @override
  String get entrepreneur => '创业者';

  @override
  String get freelancer => '自由职业';

  @override
  String get internet => '互联网';

  @override
  String get healthcare => '医疗';

  @override
  String get manufacturing => '制造业';

  @override
  String get realEstate => '房地产';

  @override
  String get retail => '零售';

  @override
  String get media => '媒体';

  @override
  String get legal => '法律';

  @override
  String get arts => '艺术';

  @override
  String get sports => '体育';

  @override
  String get government => '政府';

  @override
  String get nonprofit => '非营利组织';

  @override
  String get locationDetails => '地点详情';

  @override
  String get theme => '主题';

  @override
  String get address => '地址';

  @override
  String get distance => '距离';

  @override
  String get time => '时间';

  @override
  String get pleaseConfirmDatingInfo => '请确认约会信息';

  @override
  String get payDeposit => '支付押金';

  @override
  String get whyPayDeposit => '为什么要支付押金？';

  @override
  String get depositExplanation =>
      '支付押金是为了保护双方权益。约会完成后自动全额退款，若未协商一致情况下违约，押金将转给对方作为赔偿。';

  @override
  String get isMyDepositSafe => '我的押金安全吗？';

  @override
  String get depositSafetyExplanation =>
      '您的押金完全安全！我们使用业界先进的区块链技术，确保您的资金可查，可追溯。平台无法私自操作您的资金，仅有您本人可以操作。';
}
