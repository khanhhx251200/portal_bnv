import 'package:app_mobile/components/header_container.dart';
import 'package:app_mobile/pages/auth/components/sign_up_form.dart';
import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/pages/auth/components/sign_in_form.dart';
import 'package:app_mobile/pages/frequently_asked_questions/submit_a_help_request/submit_a_help_request_screen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  static String routeName = '/login';

  const AuthScreen({Key key, this.isLogin}) : super(key: key);

  final bool isLogin;

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;

  @override
  void initState() {
    super.initState();
    if (widget.isLogin != null) {
      isLogin = widget.isLogin;
    }
  }

  changeLayout() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => widget.isLogin != null ? true : false,
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              HeaderContainer(
                text: isLogin ? kLogin : kRegistor,
              ),
              Flexible(
                child: Container(
                  margin: EdgeInsets.only(left: xSmallSize, right: xSmallSize),
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
                          text: isLogin
                              ? "$kDonHaveAnAccount? "
                              : "$kHaveAnAccount ",
                          style: TextStyle(color: kBlackColors)),
                      TextSpan(
                          text: isLogin ? kRegistor : kLogin,
                          style: TextStyle(color: kPrimaryColors)),
                    ]),
                  ),
                ),
              ),
              SizedBox(height: defaultPadding),
              !isLogin ? Container() :ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SubmitAHelpRequestScreen(
                                  isLogin: false,
                                )));
                  },
                  child: Text(kSubmitAHelpRequest,
                      style: TextStyle(color: kWhiteColors))),
              SizedBox(height: defaultPadding),
            ],
          ),
        ),
      ),
    );
  }
}
