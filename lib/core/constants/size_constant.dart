
import 'package:app_mobile/core/constants/size_config.dart';

const defaultDuration = Duration(milliseconds: 300);

const defaultPadding = 8.0;
const xSmallSize = 10.0;
const smallSize = 12.0;
const mediumSize = 14.0;
const highSize = 16.0;
const veryHighSize = 18.0;
const bigSize = 20.0;
const radiusInputSize = 12.0;

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate width as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}