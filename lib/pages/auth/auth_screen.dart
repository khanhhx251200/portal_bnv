import 'package:app_mobile/components/header_container.dart';
import 'package:app_mobile/pages/auth/components/sign_up_form.dart';
import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/pages/auth/components/sign_in_form.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  static String routeName = '/login';

  const AuthScreen({Key key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;

  changeLayout(){
    setState(() {
      isLogin = !isLogin;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            HeaderContainer(
              text: isLogin ? kLogin : kRegistor,
            ),
            Flexible(
              child: Container(
                margin:
                    EdgeInsets.only(left: xSmallSize, right: xSmallSize),
                child: isLogin ? SignInForm() : SignUpForm(changeLayout),
              ),
            ),
            SizedBox(height: defaultPadding),
            GestureDetector(
              onTap: () {
                setState(() {
                  isLogin = !isLogin;
                });
              },
              child: Container(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: isLogin ? "$kDonHaveAnAccount? " : "$kHaveAnAccount ",
                        style: TextStyle(color: kBlackColors)),
                    TextSpan(
                        text: isLogin ? kRegistor : kLogin,
                        style: TextStyle(color: kPrimaryColors)),
                  ]),
                ),
              ),
            ),
            SizedBox(height: defaultPadding),
          ],
        ),
      ),
    );
  }
}
