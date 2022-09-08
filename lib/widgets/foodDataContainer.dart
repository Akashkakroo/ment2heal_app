import 'package:flutter/material.dart';

Widget fooddDataContainer(
    String calories, String protein, String fats, String carbs, String fiber) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          Text(
            calories,
            style: const TextStyle(
                fontWeight: FontWeight.w800, color: Colors.black, fontSize: 16),
          ),
          Text(
            "Calories",
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16),
          ),
        ],
      ),
      Column(
        children: [
          Text(
            protein,
            style: const TextStyle(
                fontWeight: FontWeight.w800, color: Colors.black, fontSize: 16),
          ),
          Text(
            "Protein",
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16),
          ),
        ],
      ),
      Column(
        children: [
          Text(
            fats,
            style: const TextStyle(
                fontWeight: FontWeight.w800, color: Colors.black, fontSize: 16),
          ),
          Text(
            "Fats",
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16),
          ),
        ],
      ),
      Column(
        children: [
          Text(
            carbs,
            style: const TextStyle(
                fontWeight: FontWeight.w800, color: Colors.black, fontSize: 16),
          ),
          Text(
            "Carbs",
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16),
          ),
        ],
      ),
      Column(
        children: [
          Text(
            fiber,
            style: const TextStyle(
                fontWeight: FontWeight.w800, color: Colors.black, fontSize: 16),
          ),
          Text(
            "Fiber",
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16),
          ),
        ],
      ),
    ],
  );
}
