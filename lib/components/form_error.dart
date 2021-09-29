import 'package:app_mobile/core/constants/size_config.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class FormError extends StatelessWidget {
  const FormError({
    Key key,
    @required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index])),
    );
  }

  Container formErrorText({String error}) {
    return Container(
      margin: EdgeInsets.only(top: 6, bottom: 16),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/icons/error.svg",
            height: getProportionateScreenWidth(mediumSize),
            width: getProportionateScreenWidth(mediumSize),
          ),
          SizedBox(
            width: getProportionateScreenWidth(xSmallSize),
          ),
          Text(error),
        ],
      ),
    );
  }
}
