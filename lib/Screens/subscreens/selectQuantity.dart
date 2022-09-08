import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class SelectQuantity extends StatefulWidget {
  SelectQuantity(
      {Key? key,
      required this.title,
      required this.calories,
      required this.carbs,
      required this.fats,
      required this.fiber,
      required this.protein,
      required this.quantity,
      required this.meal,
      required this.icon,
      required this.image})
      : super(key: key);

  String title;
  int quantity;
  int calories;
  int carbs;
  int protein;
  int fats;
  int fiber;
  int meal;
  String icon;
  String image;
  @override
  State<SelectQuantity> createState() => _SelectQuantityState();
}

class _SelectQuantityState extends State<SelectQuantity> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  void sendData(String title, int calories, int carbs, int fats, int fiber,
      int protein, String icon, String img) async {
    final now = DateTime.now();
    final formatter = DateFormat('dd-MM-yyyy');
    final formatted = await formatter.format(now);
    final uid = await auth.currentUser!.uid;
    widget.meal == 1
        ? FirebaseFirestore.instance
            .collection('FoodDaily/$uid/breakfast')
            .add({
            'id': uid,
            'foodname': title,
            'calories': calories,
            'carbs': carbs,
            'fats': fats,
            'fiber': fiber,
            'date': formatted,
            'protein': protein,
            'icon': icon,
            'image': img,
          })
        : widget.meal == 2
            ? FirebaseFirestore.instance
                .collection('FoodDaily/$uid/snack1')
                .add({
                'id': uid,
                'foodname': title,
                'calories': calories,
                'carbs': carbs,
                'fats': fats,
                'fiber': fiber,
                'date': formatted,
                'protein': protein,
                'icon': icon,
                'image': img,
              })
            : widget.meal == 3
                ? FirebaseFirestore.instance
                    .collection('FoodDaily/$uid/lunch')
                    .add({
                    'id': uid,
                    'foodname': title,
                    'calories': calories,
                    'carbs': carbs,
                    'fats': fats,
                    'fiber': fiber,
                    'date': formatted,
                    'protein': protein,
                    'icon': icon,
                    'image': img,
                  })
                : widget.meal == 4
                    ? FirebaseFirestore.instance
                        .collection('FoodDaily/$uid/snack2')
                        .add({
                        'id': uid,
                        'foodname': title,
                        'calories': calories,
                        'carbs': carbs,
                        'fats': fats,
                        'fiber': fiber,
                        'date': formatted,
                        'protein': protein,
                        'icon': icon,
                        'image': img,
                      })
                    : FirebaseFirestore.instance
                        .collection('FoodDaily/$uid/dinner')
                        .add({
                        'id': uid,
                        'foodname': title,
                        'calories': calories,
                        'carbs': carbs,
                        'fats': fats,
                        'fiber': fiber,
                        'date': formatted,
                        'protein': protein,
                        'icon': icon,
                        'image': img,
                      });
  }

  int total = 0;
  int? newQuantity;
  int? newCalories;
  int? newCarbs;
  int? newProtein;
  int? newFats;
  int? newFiber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            widget.image,
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Text(
              '${widget.title}',
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Select Quantity",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              widget.quantity == 1
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Text(
                            "-",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 30),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              total--;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          total.toString(),
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                                fontSize: 25),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              total++;
                            });
                          },
                          child: Text(
                            "+",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 30),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Text("-"),
                          onTap: () {
                            setState(() {
                              total -= 50;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(total.toString()),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              total += 50;
                            });
                          },
                          child: Text("+"),
                        ),
                      ],
                    ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          widget.quantity == 0
              ? Text("Calories: ${total / 50 * widget.calories}")
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "${total * widget.calories}",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 18),
                            ),
                          ),
                          Text(
                            "Calories",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "${total * widget.protein}",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 18),
                            ),
                          ),
                          Text(
                            "Protein",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "${total * widget.fats}",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 18),
                            ),
                          ),
                          Text(
                            "Fats",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "${total * widget.carbs}",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 18),
                            ),
                          ),
                          Text(
                            "Carbs",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "${total * widget.fiber}",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 18),
                            ),
                          ),
                          Text(
                            "Fiber",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
          const SizedBox(
            height: 20,
          ),
          widget.quantity == 1
              ? Center(
                  child: ElevatedButton(
                    onPressed: () => sendData(
                      widget.title.toString(),
                      total * widget.calories.toInt(),
                      total * widget.carbs.toInt(),
                      total * widget.fats.toInt(),
                      total * widget.fiber.toInt(),
                      total * widget.protein.toInt(),
                      widget.icon,
                      widget.image,
                    ),
                    child: const Text("Submit"),
                  ),
                )
              : Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // progressIndicator()
                      sendData(
                        widget.title.toString(),
                        (total ~/ 50) * widget.calories.toInt(),
                        (total ~/ 50) * widget.carbs.toInt(),
                        (total ~/ 50) * widget.fats.toInt(),
                        (total ~/ 50) * widget.fiber.toInt(),
                        (total ~/ 50) * widget.protein.toInt(),
                        widget.icon,
                        widget.image,
                      );
                    },
                    child: const Text("Submit"),
                  ),
                ),
        ],
      ),
    );
  }
}
