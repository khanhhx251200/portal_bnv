import 'dart:io';

import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/constant.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/pages/update_account/components/text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:loader_overlay/loader_overlay.dart';

class UpdateAccountScreen extends StatefulWidget {
  const UpdateAccountScreen({Key key}) : super(key: key);

  @override
  _UpdateAccountScreenState createState() => _UpdateAccountScreenState();
}

class _UpdateAccountScreenState extends State<UpdateAccountScreen> {
  final _formKey = GlobalKey<FormState>();

  final _passportController = TextEditingController();
  final _codeEnterpriseController = TextEditingController();
  final _nameEnterpriseController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _dateCreateController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  bool isCitizen = true;

  @override
  void initState() {
    super.initState();
    setValueToForm();
  }

  @override
  void deactivate() {
    EasyLoading.dismiss();
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
    _disposeController();
  }

  _disposeController() {
    _passportController.dispose();
    _fullNameController.dispose();
    _codeEnterpriseController.dispose();
    _nameEnterpriseController.dispose();
    _dateCreateController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
  }

  setValueToForm() {
    _passportController.text = '0123456789';
    _codeEnterpriseController.text = 'MA2512';
    _nameEnterpriseController.text = 'GIGABYTE';
    _fullNameController.text = 'Hoàng Xuân Khánh';
    _dateCreateController.text = '18/05/2016';
    _emailController.text = 'khanhhx251200@gmail.com';
    _phoneController.text = '0328962512';
  }

  updateAccount(BuildContext context) {
    print('passport: '+_passportController.text);
    print('fullName: '+_fullNameController.text.trim());
    print('nameEnterprise: '+_nameEnterpriseController.text.trim());
    print('codeEnterprise: '+_codeEnterpriseController.text.trim());
    print('dateCreate: '+_dateCreateController.text);
    print('email: '+_emailController.text.trim());
    print('phone: '+_phoneController.text);
    String newName = _fullNameController.text;
    EasyLoading.show(status: 'Đang tải...');



  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Scaffold(
        appBar: buildAppBar(),
        resizeToAvoidBottomInset: true,
        body: SafeArea(
            child: Form(
          key: _formKey,
          child: Container(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                isCitizen
                    ? TextInput(
                        controller: _passportController,
                        labelAndHint: kPassport,
                        formKey: _formKey,
                      )
                    : TextInput(
                        controller: _codeEnterpriseController,
                        labelAndHint: kCodeEnterprise,
                        formKey: _formKey,
                      ),
                SizedBox(height: defaultPadding),
                Container(
                    color: kWhiteColors,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: bigSize, top: defaultPadding),
                      child: Text(
                        '(*) là $kRequired',
                        style: TextStyle(color: kErrorColor),
                      ),
                    )),
                isCitizen
                    ? TextInput(
                        controller: _fullNameController,
                        labelAndHint: kFullName,
                        formKey: _formKey,
                      )
                    : TextInput(
                        controller: _nameEnterpriseController,
                        labelAndHint: kNameEnterprise,
                        formKey: _formKey,
                      ),
                TextInput(
                  controller: _dateCreateController,
                  labelAndHint: kDateCreatePassport,
                  formKey: _formKey,
                ),
                TextInput(
                  controller: _emailController,
                  labelAndHint: kEmail,
                  formKey: _formKey,
                ),
                TextInput(
                  controller: _phoneController,
                  labelAndHint: kNumberPhone,
                  formKey: _formKey,
                ),
                Center(
                  child: MaterialButton(
                    onPressed: () {
                      Platform.isAndroid
                          ? _showConfirmDialog()
                          : _showCupertinoDialog();
                    },
                    child: Text(
                      kExit,
                      style: TextStyle(color: kPrimaryColors),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        kAccountInformation,
        style: TextStyle(fontSize: highSize),
      ),
      centerTitle: true,
      actions: [
        GestureDetector(
            onTap: () {
              if (_formKey.currentState.validate()) {
                print('Validated');
                updateAccount(context);
              } else {
                print('not validate');
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(right: defaultPadding),
              child: Center(
                child: Text(
                  kUpdate,
                  style: TextStyle(
                      fontSize: highSize,
                      color: kPrimaryColors,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ))
      ],
    );
  }

  void _showConfirmDialog() async {
    final res = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(child: Text(kExit)),
            content: Text(
              kAreYouSureExit,
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: Text(kStillStay)),
              TextButton(
                onPressed: () {
                  _dismissDialog(status: Constant.UPDATE_ACCOUNT);
                },
                child: Text(
                  kExit,
                  style: TextStyle(color: kErrorColor),
                ),
              )
            ],
          );
        });
  }

  void _showCupertinoDialog() async {
    final res = await showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(kExit),
            content: Text(kAreYouSureExit),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: Text(kClose)),
              TextButton(
                onPressed: () {
                  _dismissDialog(status: Constant.LOADING);
                },
                child: Text(
                  kExit,
                  style: TextStyle(color: kErrorColor),
                ),
              )
            ],
          );
        });
  }

  _dismissDialog({status}) {
    Navigator.pop(context, status);
  }
}
