import 'package:flutter/material.dart';

class MyMediaQuery {
  static late double devicePixelRatio;
  static late TextScaler textScaler;
  static late Size size;
  getMediaQuery(BuildContext context) {
    devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    textScaler = MediaQuery.of(context).textScaler;
    size = MediaQuery.sizeOf(context);
  }
}
