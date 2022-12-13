import 'package:flutter/material.dart';

import '../utilities/app_colors.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatelessWidget {
   const CustomTextfield({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final controller ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: kwhite,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: kwhite)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:const BorderSide(color:Colors.red),
          ),
        ),
      ),
    );
  }
}