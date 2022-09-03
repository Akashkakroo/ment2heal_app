import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ment2heal/utils/hexcolor.dart';

Widget textFieldGratitude(
    String sno, TextEditingController controller, String hinttext) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        // ignore: sort_child_properties_last
        child: Center(
          child: Text(
            sno,
            style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
          ),
        ),

        height: 48,
        width: 50,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 146, 186, 255),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(),
        ),
      ),
      Expanded(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            hintText: hinttext,
            fillColor: HexColor("#E2BEF1"),
            filled: true,
          ),
        ),
      ),
    ],
  );
}
