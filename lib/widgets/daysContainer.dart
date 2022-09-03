import 'package:flutter/material.dart';

import '../utils/hexcolor.dart';

Widget DayContainer(String text) {
  return Container(
    child: Center(
      child: Text(text),
    ),
    height: 40,
    width: 90,
    decoration: BoxDecoration(
      color: HexColor("#E1E6E9"),
      borderRadius: BorderRadius.circular(15),
    ),
  );
}
