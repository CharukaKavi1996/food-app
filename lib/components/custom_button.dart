import 'package:flutter/material.dart';
import 'package:food_app/utilities/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final Function() onTap;
  final String text;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child:  Center(
          child: Text(text,
            style: GoogleFonts.poppins(
              fontSize: 17,
              color: Color(0xff373737),
              fontWeight: FontWeight.w600,
            ),
            ),
        )
      ),
    );
  }
}
