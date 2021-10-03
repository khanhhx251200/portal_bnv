import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/pages/frequently_asked_questions/components/asks_appbar.dart';
import 'package:app_mobile/pages/frequently_asked_questions/components/asks_widget.dart';
import 'package:app_mobile/pages/frequently_asked_questions/components/header_widget.dart';
import 'package:flutter/material.dart';

class FrequentlyAskedQuestionScreen extends StatefulWidget {
  const FrequentlyAskedQuestionScreen({Key key}) : super(key: key);

  @override
  _FrequentlyAskedQuestionScreenState createState() =>
      _FrequentlyAskedQuestionScreenState();
}

class _FrequentlyAskedQuestionScreenState
    extends State<FrequentlyAskedQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: asksAppBar(context),
      body: SafeArea(
        child: Container(
          color: kPrimaryColors,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWidget(),
              Expanded(
                child: AsksWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}



