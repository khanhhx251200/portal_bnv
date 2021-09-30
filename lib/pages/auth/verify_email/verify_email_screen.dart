import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({Key key}) : super(key: key);

  @override
  _VerifyEmailScreenState createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
              height: getProportionateScreenHeight(300),
              child: SvgPicture.asset('assets/images/verify.svg')),
          Text(kVerifyEmail, style: TextStyle(fontWeight: FontWeight.bold, fontSize: bigSize)),
          SizedBox(height: smallSize),
          RichText(text: TextSpan(
            children: [
              TextSpan(text: kEnterTheCodeSentTo, style: TextStyle( fontSize: highSize, color: kGreyColors)),
              TextSpan(text: 'khanhhx@gmail.com', style: TextStyle(fontWeight: FontWeight.bold, fontSize: veryHighSize, color: kBlackColors)),
            ]
          )),
        ],
      ),
    ));
  }
}
