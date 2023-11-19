import 'package:flutter/material.dart';

class CalculateSize {
  static double calcuWidth(BuildContext context, {required double value}) {
    return value / 756.0 * MediaQuery.of(context).size.width;
  }

  static double calcuHeigth(BuildContext context, {required double value}) {
    return value / 360.0 * MediaQuery.of(context).size.height;
  }
}
