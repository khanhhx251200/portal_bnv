import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/component_constant.dart';
import 'package:app_mobile/core/constants/constant.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:flutter/material.dart';

class SearchAllInApp extends StatefulWidget {
  const SearchAllInApp({Key key}) : super(key: key);

  @override
  _SearchAllInAppState createState() => _SearchAllInAppState();
}

class _SearchAllInAppState extends State<SearchAllInApp> {
  bool isSelectedType = false;
  String nameTypeSelected = '';

  searchByTypeSelect(String name) {
    setState(() {
      setStatusSelectType();
      nameTypeSelected = name;
    });
  }

  setStatusSelectType() {
    isSelectedType = !isSelectedType;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                isSelectedType
                    ? typeSelected()
                    : Container(
                        height: iconBottomSize,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: Constant.fileTypeList.length,
                          itemBuilder: (BuildContext context, int index) {
                            final element = Constant.fileTypeList[index];
                            return buildButtonFileType(
                                element, Constant.fileNameList[index]);
                          },
                        ),
                      ),
              ],
            ),
          ),
        ));
  }

  Widget buildButtonFileType(String type, String fileName) {
    return GestureDetector(
      onTap: () {
        searchByTypeSelect(fileName);
      },
      child: Container(
        margin: EdgeInsets.only(right: defaultPadding),
        padding: EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding / 2),
        decoration: BoxDecoration(
            borderRadius: new BorderRadius.all(new Radius.circular(6)),
            border: Border.all(color: kGreyColors)),
        child: Row(
          children: [
            documentIcon(type, bigSize),
            SizedBox(width: defaultPadding),
            Text(fileName,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: kBlackColors.withOpacity(0.6),
                    fontSize: smallSize)),
          ],
        ),
      ),
    );
  }

  Widget typeSelected() {
    return Container(
      margin: EdgeInsets.only(right: defaultPadding),
      padding: EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding / 2),
      decoration: BoxDecoration(
          borderRadius: new BorderRadius.all(new Radius.circular(6)),
          border: Border.all(color: kGreyColors),
          color: Colors.lightBlueAccent.withOpacity(0.2)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check,
            color: Colors.blue,
            size: bigSize,
          ),
          SizedBox(width: defaultPadding),
          Text(nameTypeSelected,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: smallSize)),
          SizedBox(width: defaultPadding),
          GestureDetector(
            onTap: () {
              setState(() {
                setStatusSelectType();
                nameTypeSelected = '';
              });
            },
            child: Icon(
              Icons.close,
              size: bigSize,
            ),
          )
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp),
          onPressed: () => Navigator.pop(context)),
      title: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: kSearch
        ),
      ),
    );
  }
}
