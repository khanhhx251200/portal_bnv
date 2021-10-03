import 'package:app_mobile/components/btn_loading_widget.dart';
import 'package:app_mobile/components/btn_widget.dart';
import 'package:app_mobile/components/form_error.dart';
import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/core/models/request/login_request.dart';
import 'package:app_mobile/core/services/share_preferences_service.dart';
import 'package:app_mobile/core/utils/keyboard_utils.dart';
import 'package:app_mobile/pages/auth/forgot_password/forgot_password_screen.dart';
import 'package:app_mobile/pages/dashboard/dashboard_screen.dart';
import 'package:app_mobile/pages/update_account/update_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:regexpattern/regexpattern.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  final _preferences = PreferencesService();

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  bool rememberLogin = false;
  bool _passwordVisibility = true;
  bool _isLoading = false;

  String error = '';
  String _matchEmail;
  String _matchPassword;

  handleLogin(String email, String password, bool remember) {
    SignInRequest loginRequest = SignInRequest(email, password, remember, true);

    print('email: $email ');
    print('password: $password ');

    setState(() {
      _isLoading = !_isLoading;
    });
    Future.delayed(Duration(seconds: 2), (){
      setState(() {
        _isLoading = !_isLoading;
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DashBoardScreen()));
    });
    if (rememberLogin) {
      _preferences.setRememberLogin(loginRequest);
    } else {
      _preferences.setRememberLogin(loginRequest);
      _preferences.removeRememberLogin();
    }
  }

  int numberLogin = 0;

  @override
  void initState() {
    super.initState();
    _populateFields();
  }

  @override
  void dispose() {
    super.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
  }

  void _toggle() {
    setState(() {
      _passwordVisibility = !_passwordVisibility;
    });
  }

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  void removeAllError() {
    removeError(error: kMatchPassError);
  }

  void _populateFields() async {
    final account = await _preferences.getRememberLogin();

    if (account.remember) {
      emailTextController.text = account.username;
      passwordTextController.text = account.password;
      setState(() {
        rememberLogin = account.remember;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        children: [
          _emailInput(
              controller: emailTextController, hint: kEmail, icon: Icons.email),
          _passwordInput(
              controller: passwordTextController,
              hint: kPassword,
              icon: Icons.vpn_key),
          FormError(errors: errors),
          Row(
            children: [
              Checkbox(
                checkColor: kWhiteColors,
                activeColor: kPrimaryColors,
                value: rememberLogin,
                onChanged: (value) {
                  setState(() {
                    rememberLogin = value;
                  });
                },
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    rememberLogin = !rememberLogin;
                  });
                },
                child: Text(kRememberPassword,
                    style: TextStyle(
                        color: kBlackColors, fontWeight: FontWeight.bold)),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                      );
                    },
                    child: Text("$kForgotPassword?",
                        style: TextStyle(color: kBlackColors)),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: _isLoading ? ButtonLoadingWidget() : ButtonWidget(
              onClick: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  // if all are valid then go to success screen
                  KeyboardUtil.hideKeyboard(context);
                  handleLogin(emailTextController.text, passwordTextController.text,
                      rememberLogin);
                }
              },
              btnText: kLogin,
            ),
          ),
        ],
      ),
    );
  }

  Widget _emailInput({controller, hint, icon}) {
    return Container(
      margin: EdgeInsets.only(top: xSmallSize),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(bigSize)),
        color: kWhiteColors,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 3.0,
          ),
        ],
      ),
      padding: EdgeInsets.only(left: xSmallSize),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        obscureText: hint == kPassword ? true : false,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return kEmailNull;
          } else if(!value.isEmail()){
            return kNotEmail;
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _passwordInput({controller, hint, icon}) {
    return Container(
      margin: EdgeInsets.only(top: xSmallSize),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(bigSize)),
        color: kWhiteColors,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 3.0,
          ),
        ],
      ),
      padding: EdgeInsets.only(left: xSmallSize),
      child: TextFormField(
        textInputAction: TextInputAction.done,
        obscureText: _passwordVisibility,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
          suffixIcon: IconButton(
              icon: _passwordVisibility == true
                  ? Icon(Icons.visibility_outlined, size: highSize)
                  : Icon(Icons.visibility_off_outlined, size: highSize),
              onPressed: _toggle),
        ),
        validator: (value) {
          if (value.isEmpty) {
            addError(error: kPassNull);
            return null;
          } else if (value.length < 4) {
            return kLengthPassword;
          }
          return null;
        },
        onFieldSubmitted: (value) {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            // if all are valid then go to success screen
            KeyboardUtil.hideKeyboard(context);
            handleLogin(emailTextController.text, passwordTextController.text,
                rememberLogin);
          }
        },
      ),
    );
  }
}
