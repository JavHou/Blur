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
  DatingStatus status; // Remove 'final' to make it mutable

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

  DatingModel copyWith({
    DatingStatus? status,
    String? id,
    String? nickname,
    List<String>? photos,
    String? gender,
    String? personalityType,
    String? venueName,
    double? latitude,
    double? longitude,
    String? distance,
    DateTime? dateTime,
    String? theme,
    List<String>? commonalities,
    List<String>? differences,
    String? matchReason,
    List<String>? dateTips,
    String? coverImage,
  }) {
    return DatingModel(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
      photos: photos ?? this.photos,
      gender: gender ?? this.gender,
      personalityType: personalityType ?? this.personalityType,
      venueName: venueName ?? this.venueName,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      distance: distance ?? this.distance,
      dateTime: dateTime ?? this.dateTime,
      theme: theme ?? this.theme,
      commonalities: commonalities ?? this.commonalities,
      differences: differences ?? this.differences,
      matchReason: matchReason ?? this.matchReason,
      dateTips: dateTips ?? this.dateTips,
      coverImage: coverImage ?? this.coverImage,
      status: status ?? this.status,
    );
  }
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
    gender: "Female",
    personalityType: "Corporate workaholic",
    venueName: "Blue Bottle Coffee",
    latitude: 39.9042,
    longitude: 116.4074,
    dateTime: DateTime(2025, 9, 03, 15, 30),
    theme: "Coffee Date",
    distance: "2.5 km",
    commonalities: [
      "Both enjoy coffee culture",
      "Both are night owls",
      "Both like photographing life",
    ],
    differences: [
      "She is more extroverted and social",
      "You are more focused on technology",
    ],
    matchReason:
        "You both pursue a high quality of life. Her energy balances your rational thinking, while your steadiness provides her with a sense of security. The relaxed atmosphere of a coffee shop is ideal for a first meeting.",
    dateTips: [
      "Prepare some interesting topics",
      "Talk about recent popular coffee spots",
      "Remember to compliment her outfit",
    ],
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
    gender: "Female",
    personalityType: "Outgoing, cheerful",
    venueName: "Manner Coffee",
    latitude: 39.9163,
    longitude: 116.3972,
    distance: "1.7 km",
    dateTime: DateTime(2025, 9, 03, 19, 00),
    theme: "Coffee Date",
    commonalities: [
      "Both like comedy films",
      "Both are heavy Bilibili users",
      "Both enjoy anime culture",
    ],
    differences: [
      "She loves to express herself more",
      "You prefer quiet observation",
    ],
    matchReason:
        "You share a similar sense of humor and interests. Her openness can lift the atmosphere so the date won't feel awkward; coffee is a great icebreaker.",
    dateTips: [
      "Talk about a light comedy film",
      "Prepare some movie-related jokes",
      "Consider going to the cinema after coffee",
    ],
    coverImage: "assets/images/17/17-0.jpg",
    status: DatingStatus.pending,
  ),
];
