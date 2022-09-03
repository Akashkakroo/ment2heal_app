import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/hexcolor.dart';

Widget trackerContainer(String text, String image, String color) {
  return Stack(
    children: [
      Positioned(
        child: Container(
          height: 150,
          width: double.infinity,
          color: Colors.transparent,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Positioned(
          top: 10,
          child: Container(
            // ignore: sort_child_properties_last
            // ignore: prefer_const_constructors
            // ignore: sort_child_properties_last
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20),
                ),
              ),
            ),
            height: 120,
            width: 350,
            decoration: BoxDecoration(
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                const BoxShadow(
                  color: Colors.black,
                  blurRadius: 15,
                  offset: Offset(1, 6),
                ),
                const BoxShadow(
                  color: Colors.white,
                  blurRadius: 15,
                  offset: Offset(1, -6),
                ),
              ],
              color: HexColor(color),
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
      ),
      Positioned(
        top: 0,
        right: 10,
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
            ),
          ),
        ),
      )
    ],
  );
}
