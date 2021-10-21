import 'dart:io';

import 'package:app_mobile/components/notification_not_logged_in.dart';
import 'package:app_mobile/core/api/address_api.dart';
import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/component_constant.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/core/models/response/address_response.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:toast/toast.dart';
import 'package:regexpattern/regexpattern.dart';

class SubmitAHelpRequestScreen extends StatefulWidget {
  const SubmitAHelpRequestScreen({Key key, @required this.isLogin})
      : super(key: key);

  final bool isLogin;

  @override
  _SubmitAHelpRequestScreenState createState() =>
      _SubmitAHelpRequestScreenState();
}

class _SubmitAHelpRequestScreenState extends State<SubmitAHelpRequestScreen> {
  final _formKey = GlobalKey<FormState>();

  final _inputNameCitizenController = TextEditingController();
  final _inputNameEnterpriseController = TextEditingController();
  final _inputPhoneController = TextEditingController();
  final _inputEmailCitizenController = TextEditingController();
  final _inputTitleProblemController = TextEditingController();
  final _inputContentController = TextEditingController();
  final _inputCityController = TextEditingController();
  final _inputDistrictController = TextEditingController();
  final _inputWardController = TextEditingController();

  int _isCitizen = 0;

  List<File> listFileSelected;

  List<AddressResponse> citys = [];
  List<AddressResponse> disctricts = [];
  List<AddressResponse> wards = [];

  AddressResponse citySelected;
  AddressResponse disctrictSelected;
  AddressResponse wardSelected;

  chooseFile() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.any, allowMultiple: true);

    if (result != null) {
      setState(() {
        listFileSelected = result.paths.map((path) => File(path)).toList();
      });
    } else {
      // User canceled the picker
    }
  }

  showLoginRequired() {
    Toast.show(
        "Vui lòng đăng nhập để gửi PAKN của ${_isCitizen == 0 ? kCitizen : kEnterprise}",
        context,
        backgroundColor: kWarningColor,
        textColor: kWhiteColors,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.CENTER);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColors,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: kWhiteColors,
            ),
            onPressed: () => Navigator.pop(context)),
        title: Text(kSubmitAHelpRequest,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: veryHighSize,
                color: kWhiteColors)),
      ),
      body: SafeArea(child: body(size)),
    );
  }

  Container body(Size size) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            widget.isLogin ? SizedBox() : NotificationLoggedIn(),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(mediumSize),
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(kYouNeedMoreHelp,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: bigSize)),
                    SizedBox(height: mediumSize),
                    Text(kEnterTheInformationForSupport,
                        style: TextStyle(color: kBlackColors)),
                    chooseSendType(), // Checkbox
                    SizedBox(height: mediumSize),
                    _isCitizen == 0
                        ? inputNameCitizen()
                        : inputNameEnterprise(), // Tên
                    SizedBox(height: mediumSize),
                    inputPhone(), // Số điện thoại
                    SizedBox(height: mediumSize),
                    inputEmail(), // Email
                    SizedBox(height: mediumSize),
                    inputAddress(),
                    SizedBox(height: mediumSize),
                    inputTitleProblem(), // Tiêu đề
                    SizedBox(height: mediumSize),
                    inputContentRequest(), // Nội dung
                    SizedBox(height: mediumSize),
                    Text(kAttachFiles,
                        style: TextStyle(
                            color: kBlackColors, fontWeight: FontWeight.bold)),
                    SizedBox(height: mediumSize),
                    btnFileAttach(), // Chọn file đính kèm
                    Column(
                      children: [
                        listFileSelected != null ? listSelected() : SizedBox(),
                        SizedBox(width: defaultPadding),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Divider(
              color: kGreyColors,
            ),
            Container(
              margin: EdgeInsets.all(defaultPadding),
              child: MaterialButton(
                padding: EdgeInsets.symmetric(vertical: smallSize),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(xSmallSize)),
                ),
                color: kPrimaryColors,
                onPressed: widget.isLogin
                    ? () {
                        if (_formKey.currentState.validate()) {
                          print("Validated");
                          // getFormSignUp();
                          // widget.toLogin();
                        } else {
                          print("Not Validated");
                        }
                      }
                    : null,
                disabledColor: kGreyColors.withOpacity(0.2),
                child: Center(
                  child: Text(
                    kSubmitAHelpRequest,
                    style: TextStyle(color: kWhiteColors),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row chooseSendType() {
    return Row(
      children: [
        Expanded(
          child: RadioListTile(
            title: Text(
              kCitizen,
              style: TextStyle(fontSize: mediumSize),
            ),
            onChanged: (value) {
              setState(() {
                print('value: $value');
                _isCitizen = value;
              });
              if (!widget.isLogin) {
                showLoginRequired();
              }
            },
            value: 0,
            groupValue: _isCitizen,
          ),
        ),
        Expanded(
          child: RadioListTile(
            title: Text(kEnterprise, style: TextStyle(fontSize: mediumSize)),
            onChanged: (value) {
              setState(() {
                print('value: $value');
                _isCitizen = value;
              });
              if (!widget.isLogin) {
                showLoginRequired();
              }
            },
            value: 1,
            groupValue: _isCitizen,
          ),
        ),
      ],
    );
  }

  Widget btnFileAttach() {
    return Container(
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              chooseFile();
            },
            child: Row(
              children: [
                Icon(
                  Icons.attach_file,
                  color: kWhiteColors,
                ),
                Text(
                  kAddFile,
                  style: TextStyle(color: kWhiteColors),
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget listSelected() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: listFileSelected.length,
        itemBuilder: (context, index) {
          final type = listFileSelected[index].path.split(".").last;
          final name = listFileSelected[index].path.split("/").last;
          final file = listFileSelected[index];
          return ListTile(
            leading: documentIcon(type, bigSize),
            title: Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(getFileSize(file.path, 2)),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: kErrorColor),
              onPressed: () {
                setState(() {
                  listFileSelected.remove(file);
                });
              },
            ),
          );
        });
  }

  // Nội dung
  Widget inputContentRequest() {
    final maxLines = 3;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText(kContent),
        SizedBox(height: defaultPadding),
        Container(
          child: TextFormField(
            minLines: maxLines,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            controller: _inputContentController,
            onChanged: (value) {},
            validator: (value) {
              if (value.trim().isEmpty) {
                return kRequired;
              }
              return null;
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: "Nhập $kContent",
              hintStyle: TextStyle(color: kGreyColors),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(defaultPadding)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Họ tên Công dân
  Widget inputNameCitizen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText(kCitizen),
        SizedBox(height: defaultPadding),
        Container(
          child: TextFormField(
            controller: _inputNameCitizenController,
            onChanged: (value) {
              setState(() {});
            },
            validator: (value) {
              if (value.trim().isEmpty) {
                return kRequired;
              } else if (patternOnlyText.hasMatch(value)) {
                return kNotCharacterAndNumber;
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: smallSize, vertical: 4),
              hintText: "Nhập tên $kCitizen",
              hintStyle: TextStyle(color: kGreyColors),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(defaultPadding)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Tên doanh nghiệp
  Widget inputNameEnterprise() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText(kEnterprise),
        SizedBox(height: defaultPadding),
        Container(
          child: TextFormField(
            controller: _inputNameEnterpriseController,
            onChanged: (value) {
              setState(() {});
            },
            validator: (value) {
              if (value.trim().isEmpty) {
                return kRequired;
              } else if (patternOnlyText.hasMatch(value)) {
                return kNotCharacterAndNumber;
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: smallSize, vertical: 4),
              hintText: "Nhập tên $kEnterprise",
              hintStyle: TextStyle(color: kGreyColors),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(defaultPadding)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Số điện thoại
  Widget inputPhone() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText(kNumberPhone),
        SizedBox(height: defaultPadding),
        Container(
          child: TextFormField(
            controller: _inputPhoneController,
            keyboardType: TextInputType.phone,
            onChanged: (value) {
              setState(() {});
            },
            validator: (value) {
              if (value.trim().isEmpty) {
                return kRequired;
              } else if (value.length != 10) {
                return kLengthPhone;
              } else if (!value.isPhone()) {
                return kNotPhone;
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: smallSize, vertical: 4),
              hintText: "Nhập $kNumberPhone",
              hintStyle: TextStyle(color: kGreyColors),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(defaultPadding)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Email
  Widget inputEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText(kEmail),
        SizedBox(height: defaultPadding),
        Container(
          child: TextFormField(
            controller: _inputEmailCitizenController,
            keyboardType: TextInputType.phone,
            onChanged: (value) {
              setState(() {});
            },
            validator: (value) {
              if (value.trim().isEmpty) {
                return kRequired;
              } else if (!value.isEmail()) {
                return kNotEmail;
              }
              return null;
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: smallSize, vertical: 4),
              hintText: "Nhập $kEmail",
              hintStyle: TextStyle(color: kGreyColors),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(defaultPadding)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Tiêu đề
  Widget inputTitleProblem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText(kProblemTitle),
        SizedBox(height: defaultPadding),
        Container(
          child: TextFormField(
            controller: _inputTitleProblemController,
            keyboardType: TextInputType.phone,
            onChanged: (value) {
              setState(() {});
            },
            validator: (value) {
              if (value.trim().isEmpty) {
                return kRequired;
              } else if (!value.isEmail()) {
                return kNotEmail;
              }
              return null;
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: smallSize, vertical: 4),
              hintText: "Nhập $kProblemTitle",
              hintStyle: TextStyle(color: kGreyColors),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(defaultPadding)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Địa chỉ
  Widget inputAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText(kAddress),
        SizedBox(height: defaultPadding),
        inputCity(),
        SizedBox(height: defaultPadding),
        inputDistrict(),
        SizedBox(height: defaultPadding),
        inputWard(),
        SizedBox(height: defaultPadding),
        inputDetailAddress()
      ],
    );
  }

  // Địa chỉ chi tiết
  Widget inputDetailAddress() {
    return Container(
      child: TextFormField(
        controller: _inputTitleProblemController,
        keyboardType: TextInputType.phone,
        onChanged: (value) {
          setState(() {});
        },
        validator: (value) {
          if (value.trim().isEmpty) {
            return kRequired;
          }
          return null;
        },
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: smallSize, vertical: 4),
          hintText: "Nhập $kDetailAddress",
          hintStyle: TextStyle(color: kGreyColors),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(defaultPadding)),
          ),
        ),
      ),
    );
  }

  // Phường/Xã
  TypeAheadFormField<AddressResponse> inputWard() {
    return TypeAheadFormField<AddressResponse>(
      textFieldConfiguration: TextFieldConfiguration(
        controller: _inputWardController,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: smallSize, vertical: 4),
          hintText: kWard,
          hintStyle: TextStyle(color: kGreyColors),
          suffixIcon: Icon(Icons.arrow_drop_down_sharp),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(defaultPadding)),
          ),
        ),
      ),
      suggestionsCallback: (pattern) =>
          (citySelected == null && disctrictSelected == null) ||
                  disctrictSelected == null
              ? null
              : AddressApi.getWard(disctrictSelected.code, pattern),
      itemBuilder: (context, AddressResponse itemData) {
        final address = itemData;
        return ListTile(
          title: Text(address.name),
        );
      },
      onSuggestionSelected: (suggestion) {
        wardSelected = suggestion;
        _inputWardController.text = suggestion.name;
      },
    );
  }

  // Quận/Huyện
  TypeAheadFormField<AddressResponse> inputDistrict() {
    return TypeAheadFormField<AddressResponse>(
      textFieldConfiguration: TextFieldConfiguration(
        controller: _inputDistrictController,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: smallSize, vertical: 4),
          hintText: kDisctrict,
          hintStyle: TextStyle(color: kGreyColors),
          suffixIcon: Icon(Icons.arrow_drop_down_sharp),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(defaultPadding)),
          ),
        ),
      ),
      suggestionsCallback: (pattern) => citySelected == null
          ? null
          : AddressApi.getDistrict(citySelected.code, pattern),
      itemBuilder: (context, AddressResponse itemData) {
        final address = itemData;
        return ListTile(
          title: Text(address.name),
        );
      },
      onSuggestionSelected: (suggestion) {
        disctrictSelected = suggestion;
        _inputDistrictController.text = suggestion.name;
      },
    );
  }

  // Tỉnh/Thành Phố
  TypeAheadFormField<AddressResponse> inputCity() {
    return TypeAheadFormField<AddressResponse>(
      debounceDuration: Duration(milliseconds: 300),
      validator: (value) {
        if (value.isEmpty) {
          return kRequired;
        }
        return null;
      },
      textFieldConfiguration: TextFieldConfiguration(
        controller: _inputCityController,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: smallSize, vertical: 4),
          hintText: kCity,
          hintStyle: TextStyle(color: kGreyColors),
          suffixIcon: Icon(Icons.arrow_drop_down_sharp),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(defaultPadding)),
          ),
        ),
      ),
      suggestionsCallback: (pattern) => AddressApi.getCitys(pattern),
      itemBuilder: (context, AddressResponse itemData) {
        final address = itemData;
        return ListTile(
          title: Text(address.name),
        );
      },
      onSuggestionSelected: (suggestion) {
        citySelected = suggestion;
        _inputCityController.text = suggestion.name;
      },
      hideSuggestionsOnKeyboardHide: false,
      noItemsFoundBuilder: (context) => Container(
        height: 100,
        child: Center(
          child: Text(
            'Không tìm thấy thành phố.',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }

  // Label
  RichText labelText(String label) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: label,
          style: TextStyle(
              fontSize: mediumSize,
              color: kGreyColors,
              fontWeight: FontWeight.bold)),
      TextSpan(
          text: ' *',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: highSize,
              color: kErrorColor)),
    ]));
  }
}
