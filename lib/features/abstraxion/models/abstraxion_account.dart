class AbstraxionAccount {
  final String? address;
  final String? nickname;
  final String? email;
  final bool isConnected;
  final DateTime? connectedAt;

  AbstraxionAccount({
    this.address,
    this.nickname,
    this.email,
    this.isConnected = false,
    this.connectedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'nickname': nickname,
      'email': email,
      'isConnected': isConnected,
      'connectedAt': connectedAt?.toIso8601String(),
    };
  }

  factory AbstraxionAccount.fromJson(Map<String, dynamic> json) {
    return AbstraxionAccount(
      address: json['address'],
      nickname: json['nickname'],
      email: json['email'],
      isConnected: json['isConnected'] ?? false,
      connectedAt:
          json['connectedAt'] != null
              ? DateTime.parse(json['connectedAt'])
              : null,
    );
  }

  AbstraxionAccount copyWith({
    String? address,
    String? nickname,
    String? email,
    bool? isConnected,
    DateTime? connectedAt,
  }) {
    return AbstraxionAccount(
      address: address ?? this.address,
      nickname: nickname ?? this.nickname,
      email: email ?? this.email,
      isConnected: isConnected ?? this.isConnected,
      connectedAt: connectedAt ?? this.connectedAt,
    );
  }

  // 显示格式化的地址（前6位...后4位）
  String get formattedAddress {
    if (address == null || address!.length < 10) return address ?? '';
    return '${address!.substring(0, 6)}...${address!.substring(address!.length - 4)}';
  }
}
