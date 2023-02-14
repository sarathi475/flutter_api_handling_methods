import 'dart:convert';

List<User> userFromJson(dynamic decode) =>
    List<User>.from(decode.map((x) => User.fromJson(x)));

class User {
  int id;
  String firstName;
  String lastName;
  String email;
  String avatar;

  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.avatar});

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      email: json["email"],
      avatar: json["avatar"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['avatar'] = avatar;

    return data;
  }
}
