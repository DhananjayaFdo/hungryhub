import 'package:flutter/material.dart';

double MAX_MOBILE_WIDTH = 480;
double MAX_TABLET_WIDTH = 767;
double MAX_TABLET_PORTRAIT_WIDTH = 1024;
double MAX_DESKTOPS_WIDTH = 1280;

double widthUsingMQ(BuildContext context, double width) {
  return (MediaQuery.of(context).size.width * width);
}

double heightUsingMQ(BuildContext context, double height) {
  return (MediaQuery.of(context).size.height * height);
}

double mediaQueryWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double mediaQueryHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

SizedBox spacerHor(double width) {
  return SizedBox(width: width);
}

SizedBox spacerVar(double height) {
  return SizedBox(height: height);
}

double dBRadius = 10;

class AppConstants {
  static const Size designScreenSize = Size(414, 896);
  static const double defaultPadding = 10;
  static const double defaultHeight = 896;
  static const double defaultWidth = 414;
}

double getScreenHeight(context, double heightvalue) {
  return heightvalue * ((MediaQuery.of(context).size.height) / AppConstants.defaultHeight);
}

double getScreenWidth(context, double widthvalue) {
  return ((MediaQuery.of(context).size.width) / AppConstants.defaultWidth) * widthvalue;
}

class CusDimensions {
  static const double defaultPaddingSize = 20;
  static const EdgeInsetsGeometry defaultPadding = EdgeInsets.only(left: defaultPaddingSize, right: defaultPaddingSize);
}
