import 'package:flutter/material.dart';

import '../utils/hexcolor.dart';

Widget guessContainer(String text, String color) {
  return Container(
    // ignore: sort_child_properties_last
    child: Center(
      child: Text(
        text,
      ),
    ),
    height: 40,
    width: 110,
    decoration: BoxDecoration(
      color: HexColor(color),
      borderRadius: BorderRadius.circular(15),
    ),
  );
}
