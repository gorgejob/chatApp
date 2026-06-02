class UserSignIn {
  final String email;
  final String password;

  UserSignIn({required this.email, required this.password});
  factory UserSignIn.fromjson(Map<String, dynamic> json) {
    return UserSignIn(
      email: json["email"],
      password: json["password"],
    );
  }

  tojson() {
    return {
      "email": email,
      "password": password,
    };
  }
}
