import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/pages/auth/auth_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class NotificationLoggedIn extends StatelessWidget {
  const NotificationLoggedIn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: mediumSize, vertical: defaultPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(xSmallSize)),
          color: kErrorColor),
      child: ListTile(
        leading: Icon(
          Icons.report,
          color: kWarningColor,
        ),
        title: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "Vui lòng",
              style: TextStyle(fontSize: mediumSize, color: kWhiteColors)),
          TextSpan(
            text: ' đăng nhập',
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: mediumSize,
                decoration: TextDecoration.underline,
                color: kWhiteColors),
            recognizer: new TapGestureRecognizer()
              ..onTap = () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AuthScreen(isLogin: true))),
          ),
          TextSpan(
              text:
                  " tài khoản để gửi phản ánh, kiến nghị!\nNếu chưa có vui lòng đăng ký",
              style: TextStyle(fontSize: mediumSize, color: kWhiteColors)),
          TextSpan(
              text: ' tại đây',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: mediumSize,
                decoration: TextDecoration.underline,
                color: kWhiteColors,
              ),
              recognizer: new TapGestureRecognizer()
                ..onTap = () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AuthScreen(isLogin: false)))),
        ])),
      ),
    );
  }
}
