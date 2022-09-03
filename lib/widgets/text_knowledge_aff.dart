import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textAffirmationheading(String text) {
  return Text(
    text,
    style: GoogleFonts.quicksand(
      textStyle: const TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 19),
    ),
  );
}

Widget textAffirmationsubheading(String text) {
  return Text(
    text,
    style: GoogleFonts.quicksand(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16),
    ),
  );
}
