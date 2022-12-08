import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// navigation function
class UtilFunctions{

  static void navigation(Widget widget ,BuildContext context){
      Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  static void go_back(Widget widget ,BuildContext context){
     Navigator.of(context).pop();
   }


}

