//TextStyle black
import 'package:flutter/material.dart';

import 'app_cofig.dart';



///Base
const TextStyle kHeaderStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);
const TextStyle kSubHeaderStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: Colors.black,
);
const TextStyle kTitleStyle = TextStyle(
  fontSize: 14,
  color: Colors.black,
);
const TextStyle kSubtitleStyle = TextStyle(
  fontSize: 14,
  color: Colors.black,
);
const TextStyle kNormalStyle = TextStyle(
  fontSize: 14,
  color: Colors.black,
);
const TextStyle kCaptionStyle = TextStyle(
  fontSize: 12,
  color: Colors.grey,
);
const TextStyle kOverLineStyle = TextStyle(
  fontSize: 10,
  color: Colors.white,
);

const TextStyle kAppbarTitle =  TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w600,
  fontFamily: AppConfig.FONT_NAME,
);
//Other
TextStyle oldPriceStyle([
  double size = 14,
]) =>
    TextStyle(
      decoration: TextDecoration.lineThrough,
      color: Colors.grey,
      fontSize: size,
    );
TextStyle oldTourPriceStyle([
  double size = 14,
]) =>
    TextStyle(
      decoration: TextDecoration.lineThrough,
      color: Colors.white,
      fontSize: size,
    );


