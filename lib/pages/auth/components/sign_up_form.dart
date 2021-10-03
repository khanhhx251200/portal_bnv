import 'dart:io';
import 'dart:math';

import 'package:app_mobile/components/always_disable_focus_node.dart';
import 'package:app_mobile/components/btn_loading_widget.dart';
import 'package:app_mobile/components/btn_widget.dart';
import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/constant.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/core/models/request/sign_up_request.dart';
import 'package:app_mobile/pages/auth/verify_email/verify_email_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hb_check_code/hb_check_code.dart';
import 'package:intl/intl.dart';
import 'package:regexpattern/regexpattern.dart';

class SignUpForm extends StatefulWidget {
  final Function() toLogin;

  const SignUpForm(this.toLogin, {Key key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController codeEnterpriseController =
      TextEditingController();
  final TextEditingController nameEnterpriseController =
      TextEditingController();
  final TextEditingController passportController = TextEditingController();
  final TextEditingController dateCreateController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController _codeCaptchaController =
      TextEditingController();

  int _isCitizen = 0;
  bool isAccept = false;
  bool _passwordVisibility = true;
  bool _confirmPasswordVisibility = true;
  bool _isLoading = false;

  final patternOnlyText = RegExp(
      r'([0-9\~\!\@\#\$\%\^\&\*\(\)\_\+\=\-\[\]\{\}\;\:\"\\\/\<\>\?\.\,])');
  final patternCode = RegExp(
      r'^((?![~\!\@\#\$\%\^\&\*\(\)\_\+\=\-\[\]\{\}\;\:\"\\\/\<\>\?\.\,]).)+$');

  getFormSignUp() {
    String fullName = '';
    String passport = '';
    String codeEnterprise = '';
    String nameEnterprise = '';
    String dateCreate = dateCreateController.text;
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    SignUpRequest request;
    if (_isCitizen == 0) {
      //Cá nhân
      fullName = fullNameController.text.trim();
      passport = passportController.text.trim();
      request = SignUpRequest(
        fullName: fullName,
        passport: passport,
        dateCreatePassport: dateCreate,
        email: email,
        phone: phone,
        password: password,
      );
      handleSignUp(request);
    } else {
      //doanh nghiệp
      codeEnterprise = fullNameController.text.trim();
      nameEnterprise = passportController.text.trim();
      request = SignUpRequest(
        codeEnterprise: codeEnterprise,
        nameEnterprise: nameEnterprise,
        dateCreatePassport: dateCreate,
        email: email,
        phone: phone,
        password: password,
      );
      handleSignUp(request);
    }
  }

  void _toggle(isConfirm) {
    setState(() {
      if (isConfirm) {
        _confirmPasswordVisibility = !_confirmPasswordVisibility;
      } else {
        _passwordVisibility = !_passwordVisibility;
      }
    });
  }

  handleSignUp(SignUpRequest request) {
    print('req: ' + request.toString());
    Platform.isAndroid ? _showConfirmDialog() : _showCupertinoDialog();
  }

  void _showConfirmDialog() async {
    final res = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(kConfirm),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: Text(kClose)),
              TextButton(
                onPressed: () {
                  _dismissDialog(status: Constant.SIGN_IN);
                },
                child: Text(kAgree),
              )
            ],
          );
        });
    if (res != null) {
      // SignIn in here
      print('sign in after close dialog');
      setState(() {
        _isLoading = !_isLoading;
      });
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _isLoading = !_isLoading;
        });
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => VerifyEmailScreen()));
      });
    }
  }

  void _showCupertinoDialog() async {
    final res = await showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(kConfirmSignUp),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: Text(kClose)),
              TextButton(
                onPressed: () {
                  _dismissDialog(status: Constant.LOADING);
                },
                child: Text(kAgree),
              )
            ],
          );
        });
    if (res != null) {
      // SignIn in here
      print('sign in after close dialog');
      setState(() {
        _isLoading = !_isLoading;
      });
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _isLoading = !_isLoading;
        });
      });
    }
  }

  _dismissDialog({status}) {
    Navigator.pop(context, status);
  }

  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    passportController.dispose();
    codeEnterpriseController.dispose();
    nameEnterpriseController.dispose();
    dateCreateController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  String _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  @override
  Widget build(BuildContext context) {
    String code = getRandomString(6);
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    title: Text(
                      kCitizen,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onChanged: (value) {
                      setState(() {
                        print('value: $value');
                        _isCitizen = value;
                      });
                    },
                    value: 0,
                    groupValue: _isCitizen,
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: Text(kEnterprise),
                    onChanged: (value) {
                      setState(() {
                        print('value: $value');
                        _isCitizen = value;
                      });
                    },
                    value: 1,
                    groupValue: _isCitizen,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: defaultPadding),
                  child: Text("(*) là $kRequired",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: mediumSize, color: kErrorColor)),
                ),
              ],
            ),
            _isCitizen == 0
                ? _textFullNameInput(
                    fullNameController, kFullName + " (*)", Icons.person)
                : _textCodeEnterpriseInput(codeEnterpriseController,
                    kCodeEnterprise + " (*)", Icons.account_balance),
            _isCitizen == 0
                ? SizedBox()
                : _textNameEnterpriseInput(nameEnterpriseController,
                    kNameEnterprise + " (*)", Icons.account_balance),
            _isCitizen != 0
                ? SizedBox()
                : _textPassportInput(passportController, kPassport + " (*)",
                    Icons.assignment_rounded),
            _textDateCreatePassportInput(dateCreateController,
                kDateCreatePassport + " (*)", Icons.date_range),
            _textEmailInput(emailController, kEmail + " (*)", Icons.email),
            _textPhoneInput(phoneController, kNumberPhone, Icons.phone),
            _textPasswordInput(
                kPassword + " (*)", false, Icons.vpn_key, _passwordVisibility),
            _textPasswordInput(kConfirmPassword + " (*)", true, Icons.vpn_key,
                _confirmPasswordVisibility),
            SizedBox(height: defaultPadding),
            // ListTile(        Điều khoản sử dụng
            //   onTap: () {
            //     setState(() {
            //       isAccept = !isAccept;
            //     });
            //   },
            //   contentPadding: EdgeInsets.all(0),
            //   leading: Checkbox(
            //     checkColor: kWhiteColors,
            //     activeColor: kPrimaryColors,
            //     value: isAccept,
            //     onChanged: (bool value) {
            //       setState(() {
            //         isAccept = value;
            //       });
            //     },
            //   ),
            //   title: Text(kAgreeTerm),
            // ),
            SizedBox(height: defaultPadding),
            Row(children: [
              Expanded(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0),
                child: TextFormField(
                  maxLength: 6,
                  controller: _codeCaptchaController,
                  validator: (value) {
                    if(value.isEmpty){
                      return kRequired;
                    } else if(value != code){
                      setState(() {
                        _codeCaptchaController.clear();
                      });
                      return kCaptchaNotMatch;
                    }
                    return null;
                  },
                ),
              )),
              Container(
                  alignment: Alignment.center,
                  child: HBCheckCode(
                    code: code,
                  )),
              InkWell(
                  onTap: () {
                    setState(() {});
                  },
                  child: Icon(Icons.refresh)),
            ]),
            SizedBox(height: defaultPadding),
            Center(
              child: _isLoading
                  ? ButtonLoadingWidget()
                  : ButtonWidget(
                      onClick: () {
                        if (_formKey.currentState.validate()) {
                          print("Validated");
                          getFormSignUp();
                          // widget.toLogin();
                        } else {
                          print("Not Validated");
                        }
                      },
                      btnText: kRegistor,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  //Họ và tên
  Widget _textFullNameInput(
      TextEditingController controller, String hint, IconData icon) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radiusInputSize)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(
          left: xSmallSize, right: xSmallSize, bottom: defaultPadding),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            labelText: hint,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            contentPadding: EdgeInsets.symmetric(vertical: defaultPadding)),
        validator: (value) {
          if (value.isEmpty) {
            return kRequired;
          } else if (patternOnlyText.hasMatch(value)) {
            return kNotCharacterAndNumber;
          } else {
            return null;
          }
        },
      ),
    );
  }

  //Mật khẩu và xác nhận mật khẩu
  Widget _textPasswordInput(
      String hint, bool isConfirm, IconData icon, bool visible) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radiusInputSize)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(
          left: xSmallSize, right: xSmallSize, bottom: defaultPadding),
      child: TextFormField(
        obscureText: visible,
        textInputAction: isConfirm ? TextInputAction.done : TextInputAction.go,
        controller: isConfirm ? confirmPasswordController : passwordController,
        decoration: InputDecoration(
          labelText: hint,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          suffixIcon: IconButton(
              icon: visible
                  ? Icon(Icons.visibility_outlined, size: highSize)
                  : Icon(Icons.visibility_off_outlined, size: highSize),
              onPressed: () => _toggle(isConfirm)),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return kRequired;
          } else if (value.length < 4) {
            return kLengthPassword;
          } else if (isConfirm && value != passwordController.text) {
            return kConfirmPasswordFailed;
          }
          return null;
        },
      ),
    );
  }

  //Hộ chiếu/CMND
  Widget _textPassportInput(
      TextEditingController controller, String hint, IconData icon) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radiusInputSize)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(
          left: xSmallSize, right: xSmallSize, bottom: defaultPadding),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: hint,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return kRequired;
          } else if (value.length != 9 && value.length != 13) {
            return kLengthPassport;
          } else if (!value.isPassport()) {
            return kNotCharacter;
          }
          return null;
        },
      ),
    );
  }

  //Ngày cấp hộ chiếu/ CMND
  Widget _textDateCreatePassportInput(
      TextEditingController controller, String hint, IconData icon) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radiusInputSize)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(
          left: xSmallSize, right: xSmallSize, bottom: defaultPadding),
      child: TextFormField(
        focusNode: AlwaysDisabledFocusNode(),
        controller: controller,
        decoration: InputDecoration(
          labelText: hint,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          suffixIcon: Icon(icon),
        ),
        onTap: () async {
          await DatePicker.showDatePicker(context,
              showTitleActions: true,
              minTime: DateTime(1900, 1, 1),
              maxTime: DateTime.now(),
              onChanged: (date) {}, onConfirm: (date) {
            setState(() {
              controller.text = DateFormat('dd/MM/yyyy').format(date);
            });
            print('confirm $date');
          }, currentTime: DateTime.now(), locale: LocaleType.vi);
        },
      ),
    );
  }

  //Email
  Widget _textEmailInput(
      TextEditingController controller, String hint, IconData icon) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radiusInputSize)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(
          left: xSmallSize, right: xSmallSize, bottom: defaultPadding),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: hint,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return kRequired;
          } else if (!value.isEmail()) {
            return kNotEmail;
          }
          return null;
        },
      ),
    );
  }

  //Số điện thoại
  Widget _textPhoneInput(
      TextEditingController controller, String hint, IconData icon) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radiusInputSize)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(
          left: xSmallSize, right: xSmallSize, bottom: defaultPadding),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          labelText: hint,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
        validator: (value) {
          if (value.isNotEmpty) {
            if (value.length != 10) {
              return kLengthPhone;
            } else if (!value.isPhone()) {
              return kNotPhone;
            }
          }
          return null;
        },
      ),
    );
  }

  //Mã số doanh nghiệp
  Widget _textCodeEnterpriseInput(
      TextEditingController controller, String hint, IconData icon) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radiusInputSize)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(
          left: xSmallSize, right: xSmallSize, bottom: defaultPadding),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: hint,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return kRequired;
          } else if (!patternCode.hasMatch(value)) {
            return kNotCharacter;
          }
          return null;
        },
      ),
    );
  }

  //Tên doanh nghiệp
  Widget _textNameEnterpriseInput(
      TextEditingController controller, String hint, IconData icon) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radiusInputSize)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(
          left: xSmallSize, right: xSmallSize, bottom: defaultPadding),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: hint,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
