import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/pages/frequently_asked_questions/components/item_question.dart';
import 'package:flutter/material.dart';

class AsksWidget extends StatefulWidget {
  const AsksWidget({
    Key key,
  }) : super(key: key);

  @override
  _AsksWidgetState createState() => _AsksWidgetState();
}

class _AsksWidgetState extends State<AsksWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: bigSize, vertical: mediumSize),
      decoration: BoxDecoration(
          color: kWhiteColors,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(bigSize),
              topRight: Radius.circular(bigSize))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: mediumSize),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: highSize),
            child: Text(kCommonProblems,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: veryHighSize)),
          ),
          SizedBox(height: mediumSize),
          Expanded(
              child: ListView.builder(
            itemCount: 12,
            itemBuilder: (context, index) {
              return ItemQuestion();
            },
          ))
        ],
      ),
    );
  }
}
