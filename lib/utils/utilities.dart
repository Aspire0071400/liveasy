import 'package:flutter/material.dart';

class Utility {
  widthAuto(value, BuildContext context) {
    return MediaQuery.sizeOf(context).width * value;
  }

  heightAuto(value, BuildContext context) {
    return MediaQuery.sizeOf(context).height * value;
  }
}
