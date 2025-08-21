class UserModel {
  String userId;
  String name;
  String email;
  String password;

  UserModel({
    this.userId = " ",
    required this.name,
    required this.email,
    this.password = '',
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
          userId: json['userId'],
          name: json['name'],
          email: json['email'],
          password: json['password'],
        );

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
