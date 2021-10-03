import 'package:app_mobile/components/btn_widget.dart';
import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/core/utils/keyboard_utils.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:regexpattern/regexpattern.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  String error = '';
  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Scaffold(
        appBar: AppBar(
        ),
        body: SafeArea(
          child: Form(
            key: _formKey,
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
                        color: kPrimaryColors),
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
                  error.isEmpty ? SizedBox() : Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: bigSize),
                        child: Text(error, textAlign: TextAlign.start, style: TextStyle(color: kErrorColor),),
                      ),
                    ],
                  ),
                  Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: highSize),
                        child: ButtonWidget(
                          btnText: kSend,
                          onClick: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              // if all are valid then go to success screen
                              KeyboardUtil.hideKeyboard(context);
                              context.loaderOverlay.show();
                              Future.delayed(defaultDuration, ()=> context.loaderOverlay.hide());
                            }
                          },
                        ),
                      )),
                  Spacer(flex: 2,),
                ],
              ),
            ),
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
        onSaved: (value) {
          setState(() {
            if (value.isEmpty) {
              error = kEmailNull;
            } else if (!value.isEmail()) {
              error = kNotEmail;
            } else {
              error = '';
            }
          });
        },
        onChanged: (value)=> setState(() => error =''),
      ),
    );
  }
}
