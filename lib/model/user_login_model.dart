class UserLogin {
  String? username_or_email;
  String? password;
  String? token;

  UserLogin({
    this.username_or_email,
    this.password,
    this.token,
  });

  factory UserLogin.fromJson(Map<String, dynamic> responseData) {
    return UserLogin(
      username_or_email: responseData['username_or_email'],
      password: responseData['password'],
      token: responseData['token'],
    );
  }
}
