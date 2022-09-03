import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ment2heal/utils/hexcolor.dart';

Widget testCard(String heading, String image, String color) {
  return Container(
    height: 120,
    width: 200,
    decoration: BoxDecoration(
      color: HexColor(color),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          scale: 9,
        ),
        Center(
          child: Text(
            heading,
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18),
            ),
          ),
        ),
      ],
    ),
  );
}
