import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:app_mobile/pages/frequently_asked_questions/detail_questions_and_answer/detail_questions_and_answer_screen.dart';
import 'package:flutter/material.dart';

class ItemQuestion extends StatelessWidget {
  const ItemQuestion({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => DetailQuestionScreen()));
            },
              title: Text(
                'Tôi quyên góp thành công nhưng không nhận được lượt quay Vong quay tri ân', style: TextStyle(color: kBlackColors),),
              trailing: Icon(Icons.arrow_forward_ios, size: highSize,)),
          Divider(height: 2)
        ],
      ),
    );
  }
}
