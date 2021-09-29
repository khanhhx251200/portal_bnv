import 'package:app_mobile/components/btn_widget.dart';
import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/core/utils/keyboard_utils.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

class PasswordManagerScreen extends StatefulWidget {
  const PasswordManagerScreen({Key key}) : super(key: key);

  @override
  _PasswordManagerScreenState createState() => _PasswordManagerScreenState();
}

class _PasswordManagerScreenState extends State<PasswordManagerScreen> {
  final _formKey = GlobalKey<FormState>();
  final _textPasswordOldController = TextEditingController();
  final _textPasswordNewController = TextEditingController();
  final _textPasswordConfirmController = TextEditingController();

  bool isShowHidePw = true;
  bool isShowHidePwN = true;
  bool isShowHidePwCFN = true;

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: highSize),
                child: Column(
                  children: [
                    Spacer(),
                    Text(
                      kChangePassword,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: bigSize + 4,
                          fontWeight: FontWeight.bold,
                          color: kSecondColors),
                    ),
                    _textPasswordOldInput(kPasswordCurrent, isShowHidePw),
                    _textPasswordNewInput(kPasswordNew, isShowHidePwN),
                    _textPasswordConfirmNewInput(
                        kConfirmPasswordNew, isShowHidePwCFN),
                    SizedBox(height: defaultPadding),
                    Flexible(child: ButtonWidget(
                      btnText: kUpdate,
                      onClick: (){
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          // if all are valid then go to success screen
                          KeyboardUtil.hideKeyboard(context);
                          context.loaderOverlay.show();
                          Future.delayed(defaultDuration, ()=> context.loaderOverlay.hide());
                        }
                      },
                    )),
                    Spacer(flex: 2),

                  ],
                ),
              ),
            )),
      ),
    );
  }

  //Mật khẩu hiện tại
  Widget _textPasswordOldInput(String hint, bool visible) {
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
        textInputAction: TextInputAction.go,
        controller: _textPasswordOldController,
        decoration: InputDecoration(
          labelText: hint,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          suffixIcon: IconButton(
              icon: visible
                  ? Icon(Icons.visibility_outlined, size: highSize)
                  : Icon(Icons.visibility_off_outlined, size: highSize),
              onPressed: () {
                setState(() {
                  isShowHidePw = !isShowHidePw;
                });
              }),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return kRequired;
          } else if (value.length < 4) {
            return kLengthPassword;
          }
          return null;
        },
      ),
    );
  }

  //Mật khẩu mới
  Widget _textPasswordNewInput(String hint, bool visible) {
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
        textInputAction: TextInputAction.go,
        controller: _textPasswordNewController,
        decoration: InputDecoration(
          labelText: hint,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          suffixIcon: IconButton(
              icon: visible
                  ? Icon(Icons.visibility_outlined, size: highSize)
                  : Icon(Icons.visibility_off_outlined, size: highSize),
              onPressed: () {
                setState(() {
                  isShowHidePwN = !isShowHidePwN;
                });
              }),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return kRequired;
          } else if (value.length < 4) {
            return kLengthPassword;
          } else if (value == _textPasswordOldController.text) {
            return kNewPassSameOldPass;
          }
          return null;
        },
      ),
    );
  }

  //Xác nhận mật khẩu mới
  Widget _textPasswordConfirmNewInput(String hint, bool visible) {
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
        textInputAction: TextInputAction.go,
        controller: _textPasswordConfirmController,
        decoration: InputDecoration(
          labelText: hint,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          suffixIcon: IconButton(
              icon: visible
                  ? Icon(Icons.visibility_outlined, size: highSize)
                  : Icon(Icons.visibility_off_outlined, size: highSize),
              onPressed: () {
                setState(() {
                  isShowHidePwCFN = !isShowHidePwCFN;
                });
              }),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return kRequired;
          } else if (value.length < 4) {
            return kLengthPassword;
          } else if (value != _textPasswordNewController.text) {
            return kConfirmPasswordFailed;
          } else if (value == _textPasswordOldController.text) {
            return kNewPassSameOldPass;
          }
          return null;
        },
      ),
    );
  }
}
