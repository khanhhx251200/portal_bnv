import 'dart:async';

import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/pages/auth/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../components/btn_loading_widget.dart';
import '../../../components/btn_widget.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/constants/size_constant.dart';
import '../../../core/constants/string_constants.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({Key key}) : super(key: key);

  @override
  _VerifyEmailScreenState createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  TextEditingController _codeController = TextEditingController();


  // ignore: close_sinks
  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  bool isLoading = false;
  String codeText = "";
  String errorText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
  }

  sendCode() {
    setState(() {
      isLoading = true;
    });
    print('valid: ${codeText}');
    Future.delayed(Duration(milliseconds: 1500), () {
      setState(() {
        if (codeText == '000000') {
          isLoading = false;
          hasError = false;
          Navigator.of(context).pushNamedAndRemoveUntil(
              AuthScreen.routeName,
                  (Route<dynamic> route) => false);
        } else {
          isLoading = false;
          hasError = true;
          errorText = kVerifyEmailNotMatch;
        }
      });
    });
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
    } else {
      print('not Validate');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: getProportionateScreenHeight(300),
                child: SvgPicture.asset('assets/images/verify.svg')),
            Text(kVerifyEmail,
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: bigSize)),
            SizedBox(height: smallSize),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: kEnterTheCodeSentTo,
                  style: TextStyle(fontSize: highSize, color: kGreyColors)),
              TextSpan(
                  text: 'khanhhx@gmail.com',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: veryHighSize,
                      color: kBlackColors)),
            ])),
            Form(
              key: formKey,
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: mediumSize, horizontal: iconBottomSize),
                  child: PinCodeTextField(
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 6,
                    obscuringCharacter: '*',
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      inactiveColor: kWhiteColors,
                      inactiveFillColor: kWhiteColors,
                      activeFillColor: kWhiteColors,
                      selectedColor: kPrimaryColors,
                      activeColor: errorText.isEmpty
                          ? Colors.green.shade600
                          : kErrorColor,
                      selectedFillColor: kWhiteColors,
                    ),
                    cursorColor: kBlackColors,
                    animationDuration: Duration(milliseconds: 300),
                    enableActiveFill: true,
                    errorAnimationController: errorController,
                    controller: _codeController,
                    keyboardType: TextInputType.number,

                    boxShadows: [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.black12,
                        blurRadius: 10,
                      )
                    ],
                    onCompleted: (value) {
                      print("Completed: $value");
                      sendCode();
                    },
                    // onTap: () {
                    //   print("Pressed");
                    // },
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        codeText = value;
                        errorText = '';
                      });
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  )),
            ),
            errorText.isEmpty
                ? SizedBox()
                : Text(errorText,
                    style: TextStyle(
                        color: kErrorColor, fontWeight: FontWeight.w500)),
            SizedBox(height: defaultPadding),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: isLoading
                  ? ButtonLoadingWidget(
                      color: 'verify',
                    )
                  : ButtonWidget(
                      color: 'color',
                      btnText: kConfirm,
                      onClick: () {
                        sendCode();
                      },
                    ),
            )
          ],
        ),
      ),
    ));
  }
}
