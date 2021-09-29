class SignInRequest {
  String username;
  String password;
  bool remember;
  bool keepLogin;
  SignInRequest(this.username, this.password, this.remember, this.keepLogin);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'userName': username.trim(),
      'password': password.trim(),
    };
    return map;
  }

}