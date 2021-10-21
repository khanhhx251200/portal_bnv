import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/string_constants.dart';
import 'package:app_mobile/pages/frequently_asked_questions/components/asks_appbar.dart';
import 'package:app_mobile/pages/frequently_asked_questions/components/asks_widget.dart';
import 'package:app_mobile/pages/frequently_asked_questions/components/header_widget.dart';
import 'package:app_mobile/pages/frequently_asked_questions/submit_a_help_request/submit_a_help_request_screen.dart';
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
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SubmitAHelpRequestScreen(isLogin: true,)));
                },
                child: Center(
                  child: Text(
                    kSubmitAHelpRequest,
                    style: TextStyle(color: kWhiteColors),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
