class LoginEntity {
  LoginEntity({
    this.userId,
    this.nickname,
    this.username,
    this.phone,
    this.avatarUrl,
    this.token,
  });

  LoginEntity.fromJson(dynamic json) {
    userId = json['userId'].toString();
    nickname = json['nickname'];
    username = json['username'];
    phone = json['phone'];
    avatarUrl = json['avatarUrl'];
    token = json['token'];
  }
  String? userId;
  String? nickname;
  String? username;
  String? phone;
  String? avatarUrl;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['nickname'] = nickname;
    map['username'] = username;
    map['phone'] = phone;
    map['avatarUrl'] = avatarUrl;
    map['token'] = token;
    return map;
  }

}