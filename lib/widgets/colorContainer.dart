import 'package:flutter/material.dart';

import '../utils/hexcolor.dart';

Widget ColorContainer(String color) {
  return Container(
    height: 40,
    width: 40,
    decoration: BoxDecoration(
      color: HexColor(color),
      borderRadius: BorderRadius.circular(60),
    ),
  );
}
