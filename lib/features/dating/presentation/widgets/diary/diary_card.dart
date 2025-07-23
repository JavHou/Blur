import 'package:flutter/material.dart';

class DatingDiaryCard extends StatefulWidget {
  const DatingDiaryCard({super.key});

  @override
  State<DatingDiaryCard> createState() => _DatingDiaryCardState();
}

class _DatingDiaryCardState extends State<DatingDiaryCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        // color: Colors.grey.shade100, // 添加背景色避免透明
      ),
      // padding: const EdgeInsets.all(16), // 添加内边距
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // 重要：避免无限高度
        children: [
          TextField(
            maxLines: 5,
            readOnly: true,
            decoration: InputDecoration(
              hintText:
                  'Dating日记｜第一次约会，我们在娃娃机前杠上了他约我见面，说想去个"压力小一点的地方"。结果目的地是商场负一楼的一整排娃娃机。"你擅长这个？"我问。"不会，但我觉得有意思。"他说。结果从第一台机子开始，他就陷入沉思——不是在想怎么抓，是在研究力学结构和夹爪角度。我站在旁边，看着他一脸认真地投了五十块，娃娃纹丝不动，倒是他频频回头看我表情。"你来吧。"他把位置让出来。于是，我开始教学。从"先晃晃看有没有动的""要卡边""下爪前拉一下角度"到"下去前提前放手"。他一边听一边点头，看起来比我当年辅导表弟写作业还认真。我们站在那里整整二十分钟，围了一圈路过的小朋友。我一边讲解，他一边操作，终于夹起一个毛茸茸的小熊，在半空中缓慢移动。我们两个像屏住呼吸一样盯着它——结果快落下那一瞬，一个五六岁的小孩扑上来，一把从出口拿走了娃娃。我当场愣住。他反应比我快，笑着弯腰对小孩说："这个是姐姐夹的哦。"小孩的妈妈在旁边摆摆手，说："哎呀小朋友嘛。"他看了我一眼，笑了笑，没说什么，只是重新又换了一张卡，说："再来一个。"那一刻我突然有点破防。不是因为娃娃，而是他没急，也没演温柔——就是一副"走吧，再来一次"的笃定。最后我们什么都没带走，只在娃娃机旁拍了张合影。我穿着印着爆改kitty图案的白T恤，他T恤胸口写着"Anti Social Social Club"。两个人笑得像刚完成一场荒唐但不无意义的通关任务。我想，大概这就是我喜欢dating的理由——不是因为谁带我去哪儿，而是我们曾在某个没人注意的角落里，一起为了一只三十块的玩具，毫无保留地认真过一次。',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.all(16),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
