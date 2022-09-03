import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/hexcolor.dart';

Widget container52Weeks(
  String day,
  String heading,
  bool isTrue,
  String color,
  String image,
) {
  return Container(
    // ignore: sort_child_properties_last
    child: Column(
      children: [
        Text(
          day,
          style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.black, fontSize: 17),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          heading,
          textAlign: TextAlign.center,
          style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(height: 10),
        isTrue
            ? Icon(
                Icons.lock_open,
                color: Colors.grey[800],
              )
            : Icon(
                Icons.lock,
                color: Colors.grey[800],
              ),
        const SizedBox(height: 10),
        Image.asset(
          image,
          scale: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Get Started",
              textAlign: TextAlign.center,
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 15),
              ),
            ),
            Icon(
              Icons.arrow_right_sharp,
              size: 30,
              color: Colors.grey[800],
            ),
          ],
        )
      ],
    ),
    height: 212,
    width: 170,
    decoration: BoxDecoration(
      color: HexColor(color),
      borderRadius: BorderRadius.circular(12),
    ),
    padding: const EdgeInsets.all(16),
  );
}
