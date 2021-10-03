import 'package:app_mobile/pages/frequently_asked_questions/detail_questions_and_answer/components/body.dart';
import 'package:app_mobile/pages/frequently_asked_questions/detail_questions_and_answer/components/detail_answer.dart';
import 'package:flutter/material.dart';

class DetailQuestionScreen extends StatelessWidget {
  const DetailQuestionScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: detailAnswerAppBar(context),
      body: SafeArea(child: Body()),
    );
  }
}

