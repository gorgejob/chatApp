import 'package:chrush/app/auth/domin/entitiy/user_entitiey.dart';

class UserModel extends UserEntitiey {
  final String id;

  UserModel({
    required this.id,
    required super.name,
    required super.email,
    required super.number,
    required super.password,
  });
  factory UserModel.fromjson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      number: json["number"],
      password: json["password"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id":id,
      "name":name,
      "email":email,
      "number":number,
      "password":password,
    };
  }
}
