import 'package:flutter/material.dart';

class SDP{
  static late double width;
  static late BuildContext context;

  static void init(BuildContext c){
    context = c;
    width = MediaQuery.of(context).size.width;
  }

  static double sdp(double dp) {
    return (dp / 300) * width;
  }
}