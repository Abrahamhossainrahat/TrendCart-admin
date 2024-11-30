import 'package:flutter/widgets.dart';

class AppColor{
  Color colorRed = const Color.fromARGB(255, 247, 5, 5);
  Color colorGreen = const Color.fromARGB(255, 76, 175, 80);
  Color iconColor = const Color.fromARGB(255, 255, 255, 255);
  Color backgroundColor = const Color.fromARGB(255, 248, 246, 242);
  Color colorWhite = const Color.fromARGB(255, 255, 255, 255);

  static const Gradient linerGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 247, 5, 5),
      Color.fromARGB(255, 76, 175, 80),
    ],
    begin: Alignment(0.0,0.0),
    end: Alignment(0.707 , -0.707),
  );
  
}