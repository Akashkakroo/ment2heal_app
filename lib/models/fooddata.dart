import 'package:flutter/material.dart';

class Data {
  final String? title;
  final int? calories;
  final int? protein;
  final int? carbs;
  final int? fiber;
  final int? fats;
  final int? quantity;
  final String? icon;
  final String? image;

  Data({
    this.title,
    this.calories,
    this.carbs,
    this.fiber,
    this.protein,
    this.fats,
    this.quantity,
    this.icon,
    this.image,
  });
}

List<Data> foodData() {
  var fi = <Data>[
    Data(
      title: 'Roti',
      calories: 100,
      protein: 10,
      carbs: 5,
      fiber: 1,
      fats: 2,
      quantity: 1,
      icon: "assets/fruit.png",
      image: "assets/paratha.jpg",
    ),
    Data(
      title: 'Paratha',
      calories: 200,
      protein: 20,
      carbs: 10,
      fiber: 2,
      fats: 6,
      quantity: 1,
      icon: "assets/breakfast.png",
      image: "assets/anxiety.png",
    ),
    Data(
      title: 'Dal',
      calories: 250,
      protein: 15,
      carbs: 25,
      fiber: 9,
      fats: 20,
      quantity: 0,
      icon: "assets/eating.png",
      image: "assets/footprint.png",
    )
  ];
  return fi;
}
