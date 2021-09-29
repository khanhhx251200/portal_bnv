import 'package:app_mobile/components/btn_widget.dart';
import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:regexpattern/regexpattern.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Spacer(),
              Text(
                kForgotPassword,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: bigSize+4,
                    fontWeight: FontWeight.bold,
                    color: kSecondColors),
              ),
              SizedBox(height: defaultPadding),
              Text(
                kEnterTheEmailAddressAssociatedWithYourAccount,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: mediumSize,
                    fontWeight: FontWeight.values[4],
                    color: kBlackColors),
              ),
              _emailInput(),
              Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: highSize),
                    child: ButtonWidget(
                      btnText: kSend,
                      onClick: () {},
                    ),
                  )),
              Spacer(flex: 2,),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailInput({controller, hint, icon}) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: xSmallSize, horizontal: defaultPadding * 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(bigSize)),
          color: kWhiteColors,
          border: Border.all(color: kBlackColors)),
      child: TextFormField(
        textInputAction: TextInputAction.done,
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: kEmail,
            contentPadding: EdgeInsets.only(left: mediumSize)),
        validator: (value) {
          if (value.isEmpty) {
            return kEmailNull;
          } else if (!value.isEmail()) {
            return kNotEmail;
          } else {
            return null;
          }
        },
      ),
    );
  }
}
