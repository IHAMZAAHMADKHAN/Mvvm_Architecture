class UserModel {
  String? token;

  UserModel({this.token});

  // Deserialize from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(token: json['token']);
  }

  // Serialize to JSON
  Map<String, dynamic> toJson() {
    return {'token': token};
  }
}
