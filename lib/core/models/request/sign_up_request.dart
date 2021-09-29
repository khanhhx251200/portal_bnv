class SignUpRequest {
  String fullName;
  String passport;
  String codeEnterprise;
  String nameEnterprise;
  String dateCreatePassport;
  String email;
  String phone;
  String password;

  SignUpRequest(
      {this.fullName,
      this.passport,
      this.codeEnterprise,
      this.nameEnterprise,
      this.dateCreatePassport,
      this.email,
      this.phone,
      this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "fullName": fullName,
      "passport": passport,
      "codeEnterprise": codeEnterprise,
      "nameEnterprise": nameEnterprise,
      "dateCreatePassport": dateCreatePassport,
      "email": email,
      "phone": phone,
      "password": password,
    };
    return map;
  }
}
