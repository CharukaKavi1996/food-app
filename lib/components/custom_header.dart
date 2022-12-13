import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utilities/constants.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    Key? key,
    required this.size,
    required this.header,
    required this.tagline,
    required this.img,
    
  }) : super(key: key);

  final Size size;
  final String img;
  final String header;
  final String tagline;

  @override
  Widget build(BuildContext context) {
    return Stack(
      
      children: [
        Image.asset(Constants.imageAsset(img),
        width: size.width,
        fit: BoxFit.fitWidth,
        ),
        Center(child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const SizedBox(height: 59,),
              Text(header,
            style: GoogleFonts.poppins(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ), 
            ),
            
              Text(tagline,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: const Color(0xff373737),
              fontWeight: FontWeight.w400,
            ),
            ),
          ],
        ),
        ),
            
      ],
    );
  }
}