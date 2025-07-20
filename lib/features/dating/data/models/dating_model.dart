enum DatingStatus {
  pending, // 待配对
  upcoming, // 未参加
  past, // 已完成
  canceled, // 取消
  declined, // 拒绝
}

class DatingModel {
  final String id;
  final String nickname;
  final List<String> photos;
  final String gender;
  final String personalityType;
  final String venueName;
  final double latitude;
  final double longitude;
  final String distance;
  final DateTime dateTime;
  final String theme;
  final List<String> commonalities;
  final List<String> differences;
  final String matchReason;
  final List<String> dateTips;
  final String coverImage;
  final DatingStatus status;

  DatingModel({
    required this.id,
    required this.nickname,
    required this.photos,
    required this.gender,
    required this.personalityType,
    required this.venueName,
    required this.latitude,
    required this.longitude,
    required this.distance,
    required this.dateTime,
    required this.theme,
    required this.commonalities,
    required this.differences,
    required this.matchReason,
    required this.dateTips,
    required this.coverImage,
    required this.status,
  });

  factory DatingModel.fromJson(Map<String, dynamic> json) => DatingModel(
    id: json["id"],
    nickname: json["nickname"],
    photos: List<String>.from(json["photos"] ?? []),
    gender: json["gender"],
    personalityType: json["personalityType"],
    venueName: json["venueName"],
    latitude: (json["latitude"] as num).toDouble(),
    longitude: (json["longitude"] as num).toDouble(),
    distance: json["distance"] ?? "天涯海角",
    dateTime: DateTime.parse(json["dateTime"]),
    theme: json["theme"],
    commonalities: List<String>.from(json["commonalities"] ?? []),
    differences: List<String>.from(json["differences"] ?? []),
    matchReason: json["matchReason"],
    dateTips: List<String>.from(json["dateTips"] ?? []),
    coverImage: json["coverImage"],
    status: DatingStatus.values[json["status"] ?? 0],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nickname": nickname,
    "photos": photos,
    "gender": gender,
    "personalityType": personalityType,
    "venueName": venueName,
    "latitude": latitude,
    "longitude": longitude,
    "dateTime": dateTime.toIso8601String(),
    "theme": theme,
    "commonalities": commonalities,
    "differences": differences,
    "matchReason": matchReason,
    "dateTips": dateTips,
    "coverImage": coverImage,
    "status": status.index,
  };
}

List<DatingModel> datings = [
  DatingModel(
    id: "1",
    nickname: "兔兔",
    photos: [
      "assets/images/tutu/tutu-0.jpg",
      "assets/images/tutu/tutu-1.jpg",
      "assets/images/tutu/tutu-2.jpg",
      "assets/images/tutu/tutu-3.jpg",
      "assets/images/tutu/tutu-6.jpg",
    ],
    gender: "女",
    personalityType: "外企工作狂",
    venueName: "蓝瓶咖啡 Blue Bottle",
    latitude: 39.9042,
    longitude: 116.4074,
    dateTime: DateTime(2024, 1, 20, 15, 30),
    theme: "咖啡约会",
    distance: "2.5 km",
    commonalities: ["都喜欢咖啡文化", "都是夜猫子", "都喜欢拍照记录生活"],
    differences: ["她更外向社交", "你更专注技术"],
    matchReason: "你们都有着对生活品质的追求，她的活力能平衡你的理性思维，而你的稳重也能给她安全感。咖啡厅的轻松氛围很适合你们初次见面。",
    dateTips: ["准备一些有趣的话题", "可以聊聊最近的网红咖啡店", "记得夸夸她的穿搭"],
    coverImage: "assets/images/tutu/tutu-0.jpg",
    status: DatingStatus.pending,
  ),

  DatingModel(
    id: "2",
    nickname: "十七",
    photos: [
      "assets/images/17/17-0.jpg",
      "assets/images/17/17-1.jpg",
      "assets/images/17/17-2.jpg",
      "assets/images/17/17-3.jpg",
      "assets/images/17/17-6.jpg",
    ],
    gender: "女",
    personalityType: "外向开朗",
    venueName: "Manner咖啡",
    latitude: 39.9163,
    longitude: 116.3972,
    distance: "1.7 km",
    dateTime: DateTime(2024, 1, 21, 19, 00),
    theme: "咖啡约会",
    commonalities: ["都喜欢看喜剧电影", "都是B站深度用户", "都喜欢二次元文化"],
    differences: ["她更爱表现自己", "你更喜欢安静观察"],
    matchReason: "你们有相似的幽默感和兴趣爱好，他的开朗能带动气氛，让约会不会冷场。一起和咖啡是很好的破冰方式。",
    dateTips: ["讨论一部轻松的喜剧电影", "准备一些电影相关的梗", "可以喝完咖啡后去电影院看电影"],
    coverImage: "assets/images/17/17-0.jpg",
    status: DatingStatus.pending,
  ),

  DatingModel(
    id: "3",
    nickname: "兔兔",
    photos: [
      "assets/images/tutu/tutu-0.jpg",
      "assets/images/tutu/tutu-1.jpg",
      "assets/images/tutu/tutu-2.jpg",
      "assets/images/tutu/tutu-3.jpg",
      "assets/images/tutu/tutu-6.jpg",
    ],
    gender: "女",
    personalityType: "外企工作狂",
    venueName: "蓝瓶咖啡 Blue Bottle",
    latitude: 39.9042,
    longitude: 116.4074,
    dateTime: DateTime(2024, 1, 20, 15, 30),
    theme: "咖啡约会",
    distance: "2.5 km",
    commonalities: ["都喜欢咖啡文化", "都是夜猫子", "都喜欢拍照记录生活"],
    differences: ["她更外向社交", "你更专注技术"],
    matchReason: "你们都有着对生活品质的追求，她的活力能平衡你的理性思维，而你的稳重也能给她安全感。咖啡厅的轻松氛围很适合你们初次见面。",
    dateTips: ["准备一些有趣的话题", "可以聊聊最近的网红咖啡店", "记得夸夸她的穿搭"],
    coverImage: "assets/images/tutu/tutu-0.jpg",
    status: DatingStatus.upcoming,
  ),
  // DatingModel(
  //   id: "3",
  //   nickname: "莉莉",
  //   photos: [
  //     "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=400&auto=format&fit=crop&q=60",
  //     "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?w=400&auto=format&fit=crop&q=60",
  //     "https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=400&auto=format&fit=crop&q=60",
  //   ],
  //   gender: "女",
  //   personalityType: "活力运动女孩",
  //   venueName: "朝阳公园",
  //   latitude: 39.9378,
  //   longitude: 116.4783,
  //   distance: "0.3 km",
  //   dateTime: DateTime(2024, 1, 22, 9, 00),
  //   theme: "City Walk",
  //   commonalities: ["都喜欢户外活动", "都关注健康生活", "都喜欢早起"],
  //   differences: ["她更爱运动挑战", "你更喜欢思考人生"],
  //   matchReason: "你们都有积极向上的生活态度，她的活力能激发你的运动热情，而你的深度思考也能给她不一样的视角。",
  //   dateTips: ["穿舒适的运动鞋", "准备一些有趣的拍照pose", "可以聊聊健身心得和生活规划"],
  //   coverImage:
  //       "https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=800&auto=format&fit=crop&q=60",
  //   status: DatingStatus.upcoming,
  // ),

  // DatingModel(
  //   id: "4",
  //   nickname: "小北",
  //   photos: [
  //     "https://images.unsplash.com/photo-1507591064344-4c6ce005b128?w=400&auto=format&fit=crop&q=60",
  //     "https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?w=400&auto=format&fit=crop&q=60",
  //     "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=400&auto=format&fit=crop&q=60",
  //   ],
  //   gender: "男",
  //   personalityType: "文艺清新男",
  //   venueName: "三联书店",
  //   latitude: 39.9388,
  //   longitude: 116.3974,
  //   distance: "1.6 km",

  //   dateTime: DateTime(2024, 1, 23, 14, 00),
  //   theme: "书店约会",
  //   commonalities: ["都喜欢阅读", "都有文艺情怀", "都喜欢安静的环境"],
  //   differences: ["他更感性浪漫", "你更理性务实"],
  //   matchReason: "你们都有内在的深度和对知识的渴望，能够进行有意义的深入交流，彼此的不同视角能碰撞出有趣的火花。",
  //   dateTips: ["可以一起挑选喜欢的书籍", "聊聊最近在读的书", "推荐一些好的咖啡书店"],
  //   coverImage:
  //       "https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?w=400&auto=format&fit=crop&q=60",

  //   status: DatingStatus.upcoming,
  // ),

  // DatingModel(
  //   id: "5",
  //   nickname: "小七",
  //   photos: [
  //     "https://images.unsplash.com/photo-1489424731084-a5d8b219a5bb?w=400&auto=format&fit=crop&q=60",
  //     "https://images.unsplash.com/photo-1517841905240-472988babdf9?w=400&auto=format&fit=crop&q=60",
  //     "https://images.unsplash.com/photo-1506863530036-1efeddceb993?w=400&auto=format&fit=crop&q=60",
  //   ],
  //   gender: "女",
  //   personalityType: "二次元少女",
  //   venueName: "动漫主题咖啡厅",
  //   latitude: 39.9075,
  //   longitude: 116.3972,
  //   distance: "6.6 km",

  //   dateTime: DateTime(2024, 1, 24, 16, 30),
  //   theme: "二次元主题约会",
  //   commonalities: ["都是动漫迷", "都玩手游", "都喜欢cosplay"],
  //   differences: ["她更喜欢萌系", "你更喜欢热血系"],
  //   matchReason: "共同的二次元爱好让你们有说不完的话题，能理解彼此的兴趣点，一起探讨动漫剧情会很有趣。",
  //   dateTips: ["聊聊最近追的番剧", "可以交流手游心得", "拍一些有趣的主题照片"],
  //   coverImage:
  //       "https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=800&auto=format&fit=crop&q=60",
  //   status: DatingStatus.past,
  // ),

  // DatingModel(
  //   id: "6",
  //   nickname: "小橙",
  //   photos: [
  //     "https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?w=400&auto=format&fit=crop&q=60",
  //     "https://images.unsplash.com/photo-1521146764736-56c929d59c83?w=400&auto=format&fit=crop&q=60",
  //     "https://images.unsplash.com/photo-1530785602389-07594beb8b73?w=400&auto=format&fit=crop&q=60",
  //   ],
  //   gender: "女",
  //   personalityType: "美食达人",
  //   venueName: "网红烤肉店",
  //   latitude: 39.9097,
  //   longitude: 116.4109,
  //   distance: "8.8 km",

  //   dateTime: DateTime(2024, 1, 25, 18, 00),
  //   theme: "美食探店",
  //   commonalities: ["都是吃货", "都喜欢尝试新餐厅", "都会拍美食照片"],
  //   differences: ["她更懂美食搭配", "你更关注性价比"],
  //   matchReason: "你们都对美食有热情，她能带你发现更多好吃的，而你的理性分析也能帮她更好地评价餐厅。",
  //   dateTips: ["准备好相机拍美食", "可以聊聊各自家乡的特色菜", "记得夸夸她的美食品味"],
  //   coverImage: "assets/images/covers/food_date_cover.jpg",
  //   status: DatingStatus.canceled,
  // ),
];
