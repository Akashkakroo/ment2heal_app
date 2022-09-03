import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/hexcolor.dart';

Widget affirmationContainer(String heading, String image, String color) {
  return Container(
    height: 250,
    width: 180,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: HexColor(color),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            heading,
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            image,
            scale: 4.5,
          )
        ],
      ),
    ),
  );
}
