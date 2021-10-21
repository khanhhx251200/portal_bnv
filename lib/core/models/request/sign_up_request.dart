class SignUpRequest {
  String name;
  String code;
  String dateCreatePassport;
  String email;
  String phone;
  String password;
  int type;

  SignUpRequest(
      {this.name,
      this.code,
      this.dateCreatePassport,
      this.email,
      this.phone,
      this.type,
      this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "name": name,
      "code": code,
      "ngayCap": dateCreatePassport,
      "email": email,
      "phone": phone,
      "passWord": password,
      "rePassWord": password,
      "type": type,
    };
    return map;
  }
}
