import 'dart:math';

import 'package:app_mobile/components/always_disable_focus_node.dart';
import 'package:app_mobile/components/btn_widget.dart';
import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/core/models/request/sign_up_request.dart';
import 'package:app_mobile/core/providers/auth_provider/sign_up_provider.dart';
import 'package:app_mobile/core/utils/keyboard_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hb_check_code/hb_check_code.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:toast/toast.dart';

class SignUpForm extends StatefulWidget {
  final Function() toLogin;

  const SignUpForm(this.toLogin, {Key key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  final focus = FocusNode();

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
  final TextEditingController _codeCaptchaController = TextEditingController();

  int _isCitizen = 0;
  bool isAccept = false;
  bool _passwordVisibility = true;
  bool _confirmPasswordVisibility = true;

  getFormSignUp(SignUpProvider provider) {
    String name = '';
    String code = '';
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();
    String confirmPassword = confirmPasswordController.text;
    String createDate = dateCreateController.text;
    SignUpRequest request;
    if (_isCitizen == 0) {
      //Cá nhân
      name = fullNameController.text.trim();
      code = passportController.text.trim();
    } else {
      //doanh nghiệp
      name = nameEnterpriseController.text.trim();
      code = codeEnterpriseController.text.trim();
    }

    request = SignUpRequest(
      name: name,
      code: code,
      dateCreatePassport: createDate,
      email: email,
      phone: phone,
      password: confirmPassword,
      type: _isCitizen,
    );
    handleSignUp(request, provider);
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

  handleSignUp(SignUpRequest request, SignUpProvider provider) {
    print('req: ' + request.toString());
    provider.setSignUpRequest = request;
    context.loaderOverlay.show();
    Future.delayed(Duration(milliseconds: 500), () async {
      try {
        final response = await provider.signUp(provider.signUpRequest);
        if (response['resultCode'] == 200) {
          Toast.show(kRegistor + " $kSuccess", context,
              backgroundColor: kSuccessColor,
              textColor: kWhiteColors,
              duration: Toast.LENGTH_LONG,
              gravity: Toast.BOTTOM);
          widget.toLogin();
        } else {
          Toast.show(response['message'], context,
              backgroundColor: kErrorColor,
              textColor: kWhiteColors,
              duration: Toast.LENGTH_LONG,
              gravity: Toast.BOTTOM);
        }
        context.loaderOverlay.hide();
      } catch (e) {
        Toast.show(kErrorServer, context,
            backgroundColor: kErrorColor,
            textColor: kWhiteColors,
            duration: Toast.LENGTH_LONG,
            gravity: Toast.BOTTOM);
        context.loaderOverlay.hide();
      }
    });
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
    _codeCaptchaController.dispose();
  }

  String _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  @override
  Widget build(BuildContext context) {
    String code = getRandomString(6);
    return LoaderOverlay(
      child: Consumer(
        builder: (BuildContext context, SignUpProvider provider, Widget child) {
          return LoaderOverlay(
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
                              _formKey.currentState.reset();
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
                              _formKey.currentState.reset();
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
                            style: TextStyle(
                                fontSize: mediumSize, color: kErrorColor)),
                      ),
                    ],
                  ),
                  Expanded(
                      child: ListView(padding: EdgeInsets.all(0), children: [
                    _isCitizen == 0
                        ? _textFullNameInput(
                            fullNameController, kFullName, Icons.person)
                        : _textNameEnterpriseInput(nameEnterpriseController,
                            kNameEnterprise, Icons.account_balance),
                    _isCitizen == 0
                        ? _textPassportInput(passportController, kPassport,
                            Icons.assignment_rounded)
                        : _textCodeEnterpriseInput(codeEnterpriseController,
                            kCodeEnterprise, Icons.account_balance),
                    _textDateCreatePassportInput(dateCreateController,
                        kDateCreatePassport, Icons.date_range),
                    _textEmailInput(emailController, kEmail, Icons.email),
                    _textPhoneInput(phoneController, kNumberPhone, Icons.phone),
                    _textPasswordInput(
                        kPassword, false, Icons.vpn_key, _passwordVisibility),
                    _textPasswordInput(kConfirmPassword, true, Icons.vpn_key,
                        _confirmPasswordVisibility),
                    SizedBox(height: defaultPadding),
                    inputCaptcha(code),
                  ])),
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
                  Center(
                    child: ButtonWidget(
                      onClick: () {
                        KeyboardUtil.hideKeyboard(context);
                        if (_formKey.currentState.validate()) {
                          print("Validated");
                          getFormSignUp(provider);
                          // widget.toLogin();
                        } else {
                          Toast.show(kFormNotValidated, context,
                              backgroundColor: kWarningColor,
                              textColor: kWhiteColors,
                              duration: Toast.LENGTH_LONG,
                              gravity: Toast.BOTTOM);
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
        },
      ),
    );
  }

  Row inputCaptcha(String code) {
    return Row(children: [
      Expanded(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextFormField(
          maxLength: 6,
          controller: _codeCaptchaController,
          decoration: InputDecoration(
              counterText: "",
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: 'Mã captcha (*)'),
          validator: (value) {
            if (value.isEmpty) {
              return kRequired;
            } else if (value != code) {
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
    ]);
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
        textInputAction: TextInputAction.next,
        controller: controller,
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: hint + " (*)",
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
        focusNode: isConfirm ? focus : null,
        obscureText: visible,
        textInputAction:
            isConfirm ? TextInputAction.done : TextInputAction.next,
        controller: isConfirm ? confirmPasswordController : passwordController,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: hint + " (*)",
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          suffixIcon: IconButton(
              icon: visible
                  ? Icon(Icons.visibility_outlined, size: highSize)
                  : Icon(Icons.visibility_off_outlined, size: highSize),
              onPressed: () => _toggle(isConfirm)),
        ),
        onFieldSubmitted: isConfirm
            ? null
            : (v) {
                print('next');
                FocusScope.of(context).requestFocus(focus);
              },
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
        textInputAction: TextInputAction.next,
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: hint + " (*)",
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
        textInputAction: TextInputAction.next,
        focusNode: AlwaysDisabledFocusNode(),
        controller: controller,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: hint + " (*)",
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          suffixIcon: Icon(icon),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return kRequired;
          }
          return null;
        },
        onTap: () async {
          await showDatePicker(controller);
        },
      ),
    );
  }

  Future<void> showDatePicker(TextEditingController controller) async {
    FocusScope.of(context).unfocus();
    await DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(1900, 1, 1),
        maxTime: DateTime.now(),
        onChanged: (date) {}, onConfirm: (date) {
      setState(() {
        controller.text = DateFormat('dd/MM/yyyy').format(date);
        KeyboardUtil.hideKeyboard(context);
      });
    }, currentTime: DateTime.now(), locale: LocaleType.vi);
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
        textInputAction: TextInputAction.next,
        controller: controller,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: hint + " (*)",
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
        onFieldSubmitted: (v) {
          FocusScope.of(context).nextFocus();
        },
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
        textInputAction: TextInputAction.next,
        controller: controller,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
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
        textInputAction: TextInputAction.next,
        controller: controller,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: hint + " (*)",
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
        textInputAction: TextInputAction.next,
        controller: controller,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: hint + " (*)",
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
}
