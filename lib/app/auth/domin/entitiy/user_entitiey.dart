class UserEntitiey {
  final String name;
  final String email;
  final String number;
  final String password;

  UserEntitiey({
    required this.name,
    required this.email,
    required this.number,
    required this.password,
  });

  factory UserEntitiey.fromjson(Map<String, dynamic> json) {
    return UserEntitiey(
      name: json["name"],
      email: json["email"],
      number: json["number"],
      password: json["password"],
    );
  }

  tojson() {
    return {
      "name": name,
      "email": email,
      "number": number,
      "password": password,
    };
  }
}
