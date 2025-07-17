class UserProfileModel {
  // 📸 基础信息 & 外貌呈现
  String? nickname;
  String? gender;
  String? sexualOrientation;
  DateTime? birthDate;
  String? city;
  String? region;
  List<String>? photos;

  // 🧠 心理画像 / 性格倾向
  String? mbtiType;

  // 💌 恋爱偏好
  List<String>? partnerExpectations;
  String? partnerExpectationsText;
  List<String>? unacceptableTraits;
  String? unacceptableTraitsText;

  // 💼 生活方式
  String? profession;
  String? industry;
  String? sleepSchedule;
  List<String>? hobbies;
  List<String>? dietaryHabits;

  UserProfileModel({
    this.nickname,
    this.gender,
    this.sexualOrientation,
    this.birthDate,
    this.city,
    this.region,
    this.photos,
    this.mbtiType,
    this.partnerExpectations,
    this.partnerExpectationsText,
    this.unacceptableTraits,
    this.unacceptableTraitsText,
    this.profession,
    this.industry,
    this.sleepSchedule,
    this.hobbies,
    this.dietaryHabits,
  });

  Map<String, dynamic> toJson() {
    return {
      'nickname': nickname,
      'gender': gender,
      'sexualOrientation': sexualOrientation,
      'birthDate': birthDate?.toIso8601String(),
      'city': city,
      'region': region,
      'photos': photos,
      'mbtiType': mbtiType,
      'partnerExpectations': partnerExpectations,
      'partnerExpectationsText': partnerExpectationsText,
      'unacceptableTraits': unacceptableTraits,
      'unacceptableTraitsText': unacceptableTraitsText,
      'profession': profession,
      'industry': industry,
      'sleepSchedule': sleepSchedule,
      'hobbies': hobbies,
      'dietaryHabits': dietaryHabits,
    };
  }

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      nickname: json['nickname'],
      gender: json['gender'],
      sexualOrientation: json['sexualOrientation'],
      birthDate:
          json['birthDate'] != null ? DateTime.parse(json['birthDate']) : null,
      city: json['city'],
      region: json['region'],
      photos: json['photos']?.cast<String>(),
      mbtiType: json['mbtiType'],
      partnerExpectations: json['partnerExpectations']?.cast<String>(),
      partnerExpectationsText: json['partnerExpectationsText'],
      unacceptableTraits: json['unacceptableTraits']?.cast<String>(),
      unacceptableTraitsText: json['unacceptableTraitsText'],
      profession: json['profession'],
      industry: json['industry'],
      sleepSchedule: json['sleepSchedule'],
      hobbies: json['hobbies']?.cast<String>(),
      dietaryHabits: json['dietaryHabits']?.cast<String>(),
    );
  }
}
