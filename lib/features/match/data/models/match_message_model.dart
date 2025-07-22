import 'package:blur/features/dating/data/models/dating_model.dart';

enum MessageDirection {
  sent, // 发送
  received, // 接收
}

enum SenderType {
  human, // 人类
  ai, // AI
}

class MatchMessageModel {
  final String content;
  final MessageDirection direction;
  final SenderType senderType;
  final DateTime timestamp;
  final String? aiThinking;
  final List<DatingModel>? datingModels;

  MatchMessageModel({
    required this.content,
    required this.direction,
    required this.senderType,
    required this.timestamp,
    this.aiThinking,
    this.datingModels,
  });

  factory MatchMessageModel.fromJson(Map<String, dynamic> json) {
    return MatchMessageModel(
      content: json['content'],
      direction: MessageDirection.values[json['direction']],
      senderType: SenderType.values[json['senderType']],
      timestamp: DateTime.parse(json['timestamp']),
      aiThinking: json['aiThinking'],
      datingModels:
          json['datingModels'] != null
              ? (json['datingModels'] as List)
                  .map((e) => DatingModel.fromJson(e))
                  .toList()
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'direction': direction.index,
      'senderType': senderType.index,
      'timestamp': timestamp.toIso8601String(),
      'aiThinking': aiThinking,
      'datingModels': datingModels?.map((e) => e.toJson()).toList(),
    };
  }
}

// 模拟消息数据
List<MatchMessageModel> mockMessages = [
  MatchMessageModel(
    content: '看看今日匹配？或者什么约会的好点子可以告诉我！~',
    direction: MessageDirection.received,
    senderType: SenderType.ai,
    timestamp: DateTime.now().subtract(Duration(minutes: 9)),
  ),
  // MatchMessageModel(
  //   content: '我想找个有趣的人一起喝咖啡',
  //   direction: MessageDirection.sent,
  //   senderType: SenderType.human,
  //   timestamp: DateTime.now().subtract(Duration(minutes: 10)),
  // ),
  // MatchMessageModel(
  //   content: '根据您的需求，我为您推荐了几位喜欢咖啡文化的匹配对象，他们都有着不同的个性和兴趣爱好，相信能给您带来愉快的约会体验。',
  //   direction: MessageDirection.received,
  //   senderType: SenderType.ai,
  //   timestamp: DateTime.now().subtract(Duration(minutes: 9)),
  //   aiThinking: '正在分析您的偏好...\n匹配咖啡约会场景...\n考虑性格互补和共同话题...\n为您推荐最合适的约会对象...',
  //   datingModels: [datings[3]],
  // ),
  // MatchMessageModel(
  //   content: '今天跟小北的约会怎么样？有什么好玩或者吐槽的事情跟我分享吗？我会帮你自动润色成日记哦！',
  //   direction: MessageDirection.received,
  //   senderType: SenderType.ai,
  //   timestamp: DateTime.now().subtract(Duration(minutes: 1)),
  // ),
  // MatchMessageModel(
  //   content: '第一次约会，他带我去抓娃娃，结果我成了老师，教了半天才抓到一个，最后还被小朋友抢走了，绝了哈哈！',
  //   direction: MessageDirection.sent,
  //   senderType: SenderType.human,
  //   timestamp: DateTime.now().subtrac t(Duration(minutes: 1)),
  // ),
  // MatchMessageModel(
  //   content:
  //       'Dating日记｜第一次约会，我们在娃娃机前杠上了他约我见面，说想去个“压力小一点的地方”。结果目的地是商场负一楼的一整排娃娃机。“你擅长这个？”我问。“不会，但我觉得有意思。”他说。结果从第一台机子开始，他就陷入沉思——不是在想怎么抓，是在研究力学结构和夹爪角度。我站在旁边，看着他一脸认真地投了五十块，娃娃纹丝不动，倒是他频频回头看我表情。“你来吧。”他把位置让出来。于是，我开始教学。从“先晃晃看有没有动的”“要卡边”“下爪前拉一下角度”到“下去前提前放手”。他一边听一边点头，看起来比我当年辅导表弟写作业还认真。我们站在那里整整二十分钟，围了一圈路过的小朋友。我一边讲解，他一边操作，终于夹起一个毛茸茸的小熊，在半空中缓慢移动。我们两个像屏住呼吸一样盯着它——结果快落下那一瞬，一个五六岁的小孩扑上来，一把从出口拿走了娃娃。我当场愣住。他反应比我快，笑着弯腰对小孩说：“这个是姐姐夹的哦。”小孩的妈妈在旁边摆摆手，说：“哎呀小朋友嘛。”他看了我一眼，笑了笑，没说什么，只是重新又换了一张卡，说：“再来一个。”那一刻我突然有点破防。不是因为娃娃，而是他没急，也没演温柔——就是一副“走吧，再来一次”的笃定。最后我们什么都没带走，只在娃娃机旁拍了张合影。我穿着印着爆改kitty图案的白T恤，他T恤胸口写着“Anti Social Social Club”。两个人笑得像刚完成一场荒唐但不无意义的通关任务。我想，大概这就是我喜欢dating的理由——不是因为谁带我去哪儿，而是我们曾在某个没人注意的角落里，一起为了一只三十块的玩具，毫无保留地认真过一次。',
  //   direction: MessageDirection.received,
  //   senderType: SenderType.ai,
  //   timestamp: DateTime.now().subtract(Duration(minutes: 1)),
  // ),
];
