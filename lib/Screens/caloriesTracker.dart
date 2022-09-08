import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ment2heal/Screens/subscreens/selectQuantity.dart';
import 'package:ment2heal/models/fooddata.dart';
import 'package:ment2heal/utils/date.dart';
import 'package:ment2heal/utils/hexcolor.dart';

import '../widgets/foodDataContainer.dart';

num total = 0;
// var now = DateTime.now();
// var formatter = DateFormat('dd-MM-yyyy');
// String formatted = formatter.format(now);

class CalorieTracker extends StatefulWidget {
  const CalorieTracker({Key? key}) : super(key: key);

  @override
  State<CalorieTracker> createState() => _CalorieTrackerState();
}

class _CalorieTrackerState extends State<CalorieTracker> {
  deleteDataBreakfast(id) async {
    await FirebaseFirestore.instance
        .collection("FoodDaily/Qek2VqiN5CeKRsq45kfwFNTCKGP2/breakfast")
        .doc(id)
        .delete();
  }

  deleteDataSnack1(id) async {
    await FirebaseFirestore.instance
        .collection("FoodDaily/Qek2VqiN5CeKRsq45kfwFNTCKGP2/snack1")
        .doc(id)
        .delete();
  }

  deleteDataLunch(id) async {
    await FirebaseFirestore.instance
        .collection("FoodDaily/Qek2VqiN5CeKRsq45kfwFNTCKGP2/lunch")
        .doc(id)
        .delete();
  }

  deleteDataSnack2(id) async {
    await FirebaseFirestore.instance
        .collection("FoodDaily/Qek2VqiN5CeKRsq45kfwFNTCKGP2/snack2")
        .doc(id)
        .delete();
  }

  deleteDatadinner(id) async {
    await FirebaseFirestore.instance
        .collection("FoodDaily/Qek2VqiN5CeKRsq45kfwFNTCKGP2/dinner")
        .doc(id)
        .delete();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  var id;
  num protein = 0;
  num calories = 0;
  num carbs = 0;
  num fiber = 0;
  num fats = 0;
  num maxCalories = 2500;
  getTotalProtein() async {
    final uid = await auth.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('FoodDaily/Qek2VqiN5CeKRsq45kfwFNTCKGP2/breakfast')
        .where('date', isEqualTo: dateFormate.format(date))
        .get()
        .then(
      (querySnapshot) {
        // ignore: avoid_function_literals_in_foreach_calls
        querySnapshot.docs.forEach((result) {
          for (var i = 1; i < result.data()['protein'].toString().length; i++) {
            protein = (protein + result.data()['protein']);
          }
        });
        setState(() {});
      },
    );
    FirebaseFirestore.instance
        .collection('FoodDaily/Qek2VqiN5CeKRsq45kfwFNTCKGP2/lunch')
        .where('date', isEqualTo: dateFormate.format(date))
        .get()
        .then(
      (querySnapshot) {
        // ignore: avoid_function_literals_in_foreach_calls
        querySnapshot.docs.forEach((result) {
          for (var i = 1; i < result.data()['protein'].toString().length; i++) {
            print("hii");
            protein = (protein + result.data()['protein']);
            print("Hiii");
          }
        });

        setState(() {});
      },
    );
    FirebaseFirestore.instance
        .collection('FoodDaily/Qek2VqiN5CeKRsq45kfwFNTCKGP2/snacks1')
        .where('date', isEqualTo: dateFormate.format(date))
        .get()
        .then(
      (querySnapshot) {
        // ignore: avoid_function_literals_in_foreach_calls
        querySnapshot.docs.forEach((result) {
          for (var i = 1; i < result.data()['protein'].toString().length; i++) {
            protein = (protein + result.data()['protein']);
          }
        });

        setState(() {});
      },
    );
  }

  getTotalCalories() async {
    final uid = await auth.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('FoodDaily/Qek2VqiN5CeKRsq45kfwFNTCKGP2/breakfast')
        .where('date', isEqualTo: dateFormate.format(date))
        .get()
        .then(
      (querySnapshot) {
        // ignore: avoid_function_literals_in_foreach_calls
        querySnapshot.docs.forEach((result) {
          for (var i = 1;
              i < result.data()['calories'].toString().length;
              i++) {
            calories = (calories + result.data()['calories']);
          }
        });
        setState(() {});
      },
    );
    FirebaseFirestore.instance
        .collection('FoodDaily/Qek2VqiN5CeKRsq45kfwFNTCKGP2/lunch')
        .where('date', isEqualTo: dateFormate.format(date))
        .get()
        .then(
      (querySnapshot) {
        // ignore: avoid_function_literals_in_foreach_calls
        querySnapshot.docs.forEach((result) {
          for (var i = 1;
              i < result.data()['calories'].toString().length;
              i++) {
            calories = (calories + result.data()['calories']);
          }
        });

        setState(() {});
      },
    );
    FirebaseFirestore.instance
        .collection('FoodDaily/Qek2VqiN5CeKRsq45kfwFNTCKGP2/snacks1')
        .where('date', isEqualTo: dateFormate.format(date))
        .get()
        .then(
      (querySnapshot) {
        // ignore: avoid_function_literals_in_foreach_calls
        querySnapshot.docs.forEach((result) {
          for (var i = 1;
              i < result.data()['calories'].toString().length;
              i++) {
            calories = (calories + result.data()['calories']);
          }
        });
        setState(() {});
      },
    );
  }

  getTotalCarbs() async {
    final uid = await auth.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('FoodDaily/Qek2VqiN5CeKRsq45kfwFNTCKGP2/breakfast')
        .where('date', isEqualTo: dateFormate.format(date))
        .get()
        .then(
      (querySnapshot) {
        // ignore: avoid_function_literals_in_foreach_calls
        querySnapshot.docs.forEach((result) {
          for (var i = 1; i < result.data()['carbs'].toString().length; i++) {
            carbs = (carbs + result.data()['carbs']);
          }
        });
        setState(() {});
      },
    );
    FirebaseFirestore.instance
        .collection('FoodDaily/Qek2VqiN5CeKRsq45kfwFNTCKGP2/lunch')
        .where('date', isEqualTo: dateFormate.format(date))
        .get()
        .then(
      (querySnapshot) {
        // ignore: avoid_function_literals_in_foreach_calls
        querySnapshot.docs.forEach((result) {
          for (var i = 1; i < result.data()['carbs'].toString().length; i++) {
            carbs = (carbs + result.data()['carbs']);
          }
        });

        setState(() {});
      },
    );
    FirebaseFirestore.instance
        .collection('FoodDaily/Qek2VqiN5CeKRsq45kfwFNTCKGP2/snacks1')
        .where('date', isEqualTo: dateFormate.format(date))
        .get()
        .then(
      (querySnapshot) {
        // ignore: avoid_function_literals_in_foreach_calls
        querySnapshot.docs.forEach((result) {
          for (var i = 1; i < result.data()['carbs'].toString().length; i++) {
            carbs = (carbs + result.data()['carbs']);
          }
        });
        setState(() {});
      },
    );
  }

  getTotalfats() async {
    final uid = await auth.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('FoodDaily/Qek2VqiN5CeKRsq45kfwFNTCKGP2/breakfast')
        .where('date', isEqualTo: dateFormate.format(date))
        .get()
        .then(
      (querySnapshot) {
        // ignore: avoid_function_literals_in_foreach_calls
        querySnapshot.docs.forEach((result) {
          for (var i = 1; i < result.data()['fats'].toString().length; i++) {
            fats = (fats + result.data()['fats']);
          }
        });
        setState(() {});
      },
    );
    FirebaseFirestore.instance
        .collection('FoodDaily/Qek2VqiN5CeKRsq45kfwFNTCKGP2/lunch')
        .where('date', isEqualTo: dateFormate.format(date))
        .get()
        .then(
      (querySnapshot) {
        // ignore: avoid_function_literals_in_foreach_calls
        querySnapshot.docs.forEach((result) {
          for (var i = 1; i < result.data()['fats'].toString().length; i++) {
            fats = (fats + result.data()['fats']);
          }
        });

        setState(() {});
      },
    );
    FirebaseFirestore.instance
        .collection('FoodDaily/Qek2VqiN5CeKRsq45kfwFNTCKGP2/snacks1')
        .where('date', isEqualTo: dateFormate.format(date))
        .get()
        .then(
      (querySnapshot) {
        // ignore: avoid_function_literals_in_foreach_calls
        querySnapshot.docs.forEach((result) {
          for (var i = 1; i < result.data()['fats'].toString().length; i++) {
            fats = (fats + result.data()['fats']);
          }
        });
        setState(() {});
      },
    );
  }

  getTotalfiber() async {
    final uid = await auth.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('FoodDaily/Qek2VqiN5CeKRsq45kfwFNTCKGP2/breakfast')
        .where('date', isEqualTo: dateFormate.format(date))
        .get()
        .then(
      (querySnapshot) {
        // ignore: avoid_function_literals_in_foreach_calls
        querySnapshot.docs.forEach((result) {
          for (var i = 1; i < result.data()['fiber'].toString().length; i++) {
            fiber = (fiber + result.data()['fiber']);
          }
        });
        setState(() {});
      },
    );
    FirebaseFirestore.instance
        .collection('FoodDaily/Qek2VqiN5CeKRsq45kfwFNTCKGP2/lunch')
        .where('date', isEqualTo: dateFormate.format(date))
        .get()
        .then(
      (querySnapshot) {
        // ignore: avoid_function_literals_in_foreach_calls
        querySnapshot.docs.forEach((result) {
          for (var i = 1; i < result.data()['fiber'].toString().length; i++) {
            fiber = (fiber + result.data()['fiber']);
          }
        });

        setState(() {});
      },
    );
    FirebaseFirestore.instance
        .collection('FoodDaily/Qek2VqiN5CeKRsq45kfwFNTCKGP2/snacks1')
        .where('date', isEqualTo: dateFormate.format(date))
        .get()
        .then(
      (querySnapshot) {
        // ignore: avoid_function_literals_in_foreach_calls
        querySnapshot.docs.forEach((result) {
          for (var i = 1; i < result.data()['fiber'].toString().length; i++) {
            fiber = (fiber + result.data()['fiber']);
          }
        });
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    getTotalProtein();
    getTotalCalories();
    getTotalfiber();
    getTotalfats();
    getTotalCarbs();

    super.initState();
  }

  DateTime date = DateTime.now();
  final dateFormate = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Track Your Calories",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 300,
                // width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
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
                  // ignore: prefer_const_literals_to_create_immutables
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2022),
                                lastDate: DateTime(2050),
                              ).then((value) {
                                setState(() {
                                  date = value!;
                                  protein = 0;
                                  calories = 0;
                                  fats = 0;
                                  fiber = 0;
                                  carbs = 0;
                                  getTotalProtein();
                                  getTotalCalories();
                                  getTotalfiber();
                                  getTotalfats();
                                  getTotalCarbs();
                                });
                              });
                            },
                            icon: Icon(Icons.arrow_left)),
                        Text(
                          dateFormate.format(date),
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 22),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2022),
                                lastDate: DateTime(2050),
                              ).then((value) {
                                setState(() {
                                  date = value!;
                                  protein = 0;
                                  calories = 0;
                                  fats = 0;
                                  fiber = 0;
                                  carbs = 0;
                                  getTotalProtein();
                                  getTotalCalories();
                                  getTotalfiber();
                                  getTotalfats();
                                  getTotalCarbs();
                                });
                              });
                            },
                            icon: Icon(Icons.arrow_right)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                child: CircularProgressIndicator(
                                  strokeWidth: 15,
                                  backgroundColor: Colors.yellow,
                                  valueColor:
                                      AlwaysStoppedAnimation<Color>(Colors.red),
                                  value: calories == 0
                                      ? 0
                                      : (calories > 0 &&
                                              calories < maxCalories / 50)
                                          ? 0.2
                                          : (calories > maxCalories / 50 &&
                                                  calories < maxCalories / 2)
                                              ? 0.4
                                              : (calories > maxCalories / 2 &&
                                                      calories <
                                                          maxCalories / 2 + 500)
                                                  ? 0.8
                                                  : 1,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/calories.png",
                                    scale: 15,
                                  ),
                                  Text(
                                    "${calories} Kcal",
                                    style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 18),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: HexColor("#FFF0AF"),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Image.asset(
                                          'assets/starch.png',
                                          scale: 15,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Carbs",
                                            style: GoogleFonts.quicksand(
                                              textStyle: const TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.black,
                                                  fontSize: 20),
                                            ),
                                          ),
                                          Text(
                                            "${carbs}g",
                                            style: GoogleFonts.quicksand(
                                              textStyle: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                  fontSize: 18),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 103, 204, 255),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Image.asset(
                                          'assets/protein.png',
                                          scale: 20,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Protein",
                                            style: GoogleFonts.quicksand(
                                              textStyle: const TextStyle(
                                                fontWeight: FontWeight.w800,
                                                color: Colors.black,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "${protein}g",
                                            style: GoogleFonts.quicksand(
                                              textStyle: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Image.asset(
                                          'assets/raw-oil.png',
                                          scale: 20,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Fats",
                                            style: GoogleFonts.quicksand(
                                              textStyle: const TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.black,
                                                  fontSize: 20),
                                            ),
                                          ),
                                          Text(
                                            "${fats}g",
                                            style: GoogleFonts.quicksand(
                                              textStyle: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                  fontSize: 18),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 15, 15, 0),
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/pancakes.png',
                          scale: 16,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            "Breakfast",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                        ),
                        Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                showSearch(
                                    context: context,
                                    delegate: DataSearchBreakfast());
                              },
                            )),
                      ],
                    ),
                    FutureBuilder(
                        future: FirebaseFirestore.instance
                            .collection(
                                'FoodDaily/Qek2VqiN5CeKRsq45kfwFNTCKGP2/breakfast')
                            .where('date', isEqualTo: dateFormate.format(date))
                            .where('id',
                                isEqualTo:
                                    FirebaseAuth.instance.currentUser!.uid)
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  (snapshot.data! as dynamic).docs.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot snap =
                                    (snapshot.data! as dynamic).docs[index];

                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.asset(
                                                snap['icon'],
                                                scale: 18,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  snap['foodname'],
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Colors.black,
                                                      fontSize: 18),
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () =>
                                                    deleteDataBreakfast(
                                                        snap.id),
                                                icon: Icon(Icons.delete),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          fooddDataContainer(
                                              snap['calories'].toString(),
                                              snap['protein'].toString(),
                                              snap['fats'].toString(),
                                              snap['carbs'].toString(),
                                              snap['fiber'].toString()),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        })
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0, 15, 0),
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/fruit.png',
                          scale: 16,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            "Snacks",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                        ),
                        Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                showSearch(
                                    context: context,
                                    delegate: DataSearchSnacks1());
                              },
                            )),
                      ],
                    ),
                    FutureBuilder(
                        future: FirebaseFirestore.instance
                            .collection(
                                'FoodDaily/Qek2VqiN5CeKRsq45kfwFNTCKGP2/snack1')
                            .where('date', isEqualTo: dateFormate.format(date))
                            .where('id',
                                isEqualTo:
                                    FirebaseAuth.instance.currentUser!.uid)
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  (snapshot.data! as dynamic).docs.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot snap =
                                    (snapshot.data! as dynamic).docs[index];

                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.asset(
                                                snap['icon'],
                                                scale: 18,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  snap['foodname'],
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Colors.black,
                                                      fontSize: 18),
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () =>
                                                    deleteDataSnack1(snap.id),
                                                icon: Icon(Icons.delete),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          fooddDataContainer(
                                              snap['calories'].toString(),
                                              snap['protein'].toString(),
                                              snap['fats'].toString(),
                                              snap['carbs'].toString(),
                                              snap['fiber'].toString()),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        })
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0, 15, 0),
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/reusable.png',
                          scale: 16,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            "Lunch",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                        ),
                        Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                showSearch(
                                    context: context,
                                    delegate: DataSearchlunch());
                              },
                            )),
                      ],
                    ),
                    FutureBuilder(
                        future: FirebaseFirestore.instance
                            .collection(
                                'FoodDaily/Qek2VqiN5CeKRsq45kfwFNTCKGP2/lunch')
                            .where('date', isEqualTo: dateFormate.format(date))
                            .where('id',
                                isEqualTo:
                                    FirebaseAuth.instance.currentUser!.uid)
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  (snapshot.data! as dynamic).docs.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot snap =
                                    (snapshot.data! as dynamic).docs[index];

                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.asset(
                                                snap['icon'],
                                                scale: 18,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  snap['foodname'],
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Colors.black,
                                                      fontSize: 18),
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () =>
                                                    deleteDataLunch(snap.id),
                                                icon: Icon(Icons.delete),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          fooddDataContainer(
                                              snap['calories'].toString(),
                                              snap['protein'].toString(),
                                              snap['fats'].toString(),
                                              snap['carbs'].toString(),
                                              snap['fiber'].toString()),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        })
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0, 15, 0),
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/coffee-break.png',
                          scale: 16,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            "Snacks",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                        ),
                        Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.add,
                                size: 25,
                              ),
                              onPressed: () {
                                showSearch(
                                    context: context,
                                    delegate: DataSearchsnacks2());
                              },
                            )),
                      ],
                    ),
                    FutureBuilder(
                        future: FirebaseFirestore.instance
                            .collection(
                                'FoodDaily/Qek2VqiN5CeKRsq45kfwFNTCKGP2/snack2')
                            .where('date', isEqualTo: dateFormate.format(date))
                            .where('id',
                                isEqualTo:
                                    FirebaseAuth.instance.currentUser!.uid)
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  (snapshot.data! as dynamic).docs.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot snap =
                                    (snapshot.data! as dynamic).docs[index];

                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.asset(
                                                snap['icon'],
                                                scale: 18,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  snap['foodname'],
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Colors.black,
                                                      fontSize: 18),
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () =>
                                                    deleteDataSnack2(snap.id),
                                                icon: Icon(Icons.delete),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          fooddDataContainer(
                                              snap['calories'].toString(),
                                              snap['protein'].toString(),
                                              snap['fats'].toString(),
                                              snap['carbs'].toString(),
                                              snap['fiber'].toString()),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        })
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0, 15, 0),
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/dining.png',
                          scale: 16,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            "Dinner",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                        ),
                        Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                showSearch(
                                    context: context,
                                    delegate: DataSearchdinner());
                              },
                            )),
                      ],
                    ),
                    FutureBuilder(
                        future: FirebaseFirestore.instance
                            .collection(
                                'FoodDaily/Qek2VqiN5CeKRsq45kfwFNTCKGP2/dinner')
                            .where('date', isEqualTo: dateFormate.format(date))
                            .where('id',
                                isEqualTo:
                                    FirebaseAuth.instance.currentUser!.uid)
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  (snapshot.data! as dynamic).docs.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot snap =
                                    (snapshot.data! as dynamic).docs[index];

                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.asset(
                                                snap['icon'],
                                                scale: 18,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  snap['foodname'],
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Colors.black,
                                                      fontSize: 18),
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () =>
                                                    deleteDatadinner(snap.id),
                                                icon: Icon(Icons.delete),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          fooddDataContainer(
                                              snap['calories'].toString(),
                                              snap['protein'].toString(),
                                              snap['fats'].toString(),
                                              snap['carbs'].toString(),
                                              snap['fiber'].toString()),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        })
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}

class DataSearchBreakfast extends SearchDelegate<Data> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    //Actions for app bar
    return [
      IconButton(
        onPressed: () {
          query = " ";
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    //Leading icon on left of app bar
    return IconButton(
        onPressed: () {},
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Card(
        color: Colors.red,
        child: Center(child: Text(query)),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    final mylist = query.isEmpty
        ? foodData()
        : foodData().where((p) => p.title!.startsWith(query)).toList();
    return mylist.isEmpty
        ? Text("No results found")
        : ListView.builder(
            itemCount: mylist.length,
            itemBuilder: (context, index) {
              final Data listItem = mylist[index];
              return ListTile(
                onTap: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => SelectQuantity(
                        title: listItem.title!,
                        calories: listItem.calories!.toInt(),
                        carbs: listItem.carbs!.toInt(),
                        fats: listItem.fats!.toInt(),
                        fiber: listItem.fiber!.toInt(),
                        protein: listItem.protein!.toInt(),
                        quantity: listItem.quantity!.toInt(),
                        meal: 1,
                        icon: listItem.icon.toString(),
                        image: listItem.image.toString(),
                      ),
                    ),
                  );
                },
                title: Text(listItem.title!),
                subtitle: Text(
                  listItem.calories.toString(),
                ),
              );
            });
  }
}

class DataSearchSnacks1 extends SearchDelegate<Data> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    //Actions for app bar
    return [
      IconButton(
        onPressed: () {
          query = " ";
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    //Leading icon on left of app bar
    return IconButton(
        onPressed: () {},
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Card(
        color: Colors.red,
        child: Center(child: Text(query)),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    final mylist = query.isEmpty
        ? foodData()
        : foodData().where((p) => p.title!.startsWith(query)).toList();
    return mylist.isEmpty
        ? Text("No results found")
        : ListView.builder(
            itemCount: mylist.length,
            itemBuilder: (context, index) {
              final Data listItem = mylist[index];
              return ListTile(
                onTap: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => SelectQuantity(
                        title: listItem.title!,
                        calories: listItem.calories!.toInt(),
                        carbs: listItem.carbs!.toInt(),
                        fats: listItem.fats!.toInt(),
                        fiber: listItem.fiber!.toInt(),
                        protein: listItem.protein!.toInt(),
                        quantity: listItem.quantity!.toInt(),
                        meal: 2,
                        icon: listItem.icon.toString(),
                        image: listItem.image.toString(),
                      ),
                    ),
                  );
                },
                title: Text(listItem.title!),
                subtitle: Text(
                  listItem.calories.toString(),
                ),
              );
            });
  }
}

class DataSearchlunch extends SearchDelegate<Data> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    //Actions for app bar
    return [
      IconButton(
        onPressed: () {
          query = " ";
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    //Leading icon on left of app bar
    return IconButton(
        onPressed: () {},
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Card(
        color: Colors.red,
        child: Center(child: Text(query)),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    final mylist = query.isEmpty
        ? foodData()
        : foodData().where((p) => p.title!.startsWith(query)).toList();
    return mylist.isEmpty
        ? Text("No results found")
        : ListView.builder(
            itemCount: mylist.length,
            itemBuilder: (context, index) {
              final Data listItem = mylist[index];
              return ListTile(
                onTap: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => SelectQuantity(
                        title: listItem.title!,
                        calories: listItem.calories!.toInt(),
                        carbs: listItem.carbs!.toInt(),
                        fats: listItem.fats!.toInt(),
                        fiber: listItem.fiber!.toInt(),
                        protein: listItem.protein!.toInt(),
                        quantity: listItem.quantity!.toInt(),
                        meal: 3,
                        icon: listItem.icon.toString(),
                        image: listItem.image.toString(),
                      ),
                    ),
                  );
                },
                title: Text(listItem.title!),
                subtitle: Text(
                  listItem.calories.toString(),
                ),
              );
            });
  }
}

class DataSearchsnacks2 extends SearchDelegate<Data> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    //Actions for app bar
    return [
      IconButton(
        onPressed: () {
          query = " ";
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    //Leading icon on left of app bar
    return IconButton(
        onPressed: () {},
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Card(
        color: Colors.red,
        child: Center(child: Text(query)),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    final mylist = query.isEmpty
        ? foodData()
        : foodData().where((p) => p.title!.startsWith(query)).toList();
    return mylist.isEmpty
        ? Text("No results found")
        : ListView.builder(
            itemCount: mylist.length,
            itemBuilder: (context, index) {
              final Data listItem = mylist[index];
              return ListTile(
                onTap: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => SelectQuantity(
                        title: listItem.title!,
                        calories: listItem.calories!.toInt(),
                        carbs: listItem.carbs!.toInt(),
                        fats: listItem.fats!.toInt(),
                        fiber: listItem.fiber!.toInt(),
                        protein: listItem.protein!.toInt(),
                        quantity: listItem.quantity!.toInt(),
                        meal: 4,
                        icon: listItem.icon.toString(),
                        image: listItem.image.toString(),
                      ),
                    ),
                  );
                },
                title: Text(listItem.title!),
                subtitle: Text(
                  listItem.calories.toString(),
                ),
              );
            });
  }
}

class DataSearchdinner extends SearchDelegate<Data> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    //Actions for app bar
    return [
      IconButton(
        onPressed: () {
          query = " ";
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    //Leading icon on left of app bar
    return IconButton(
        onPressed: () {},
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Card(
        color: Colors.red,
        child: Center(child: Text(query)),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    final mylist = query.isEmpty
        ? foodData()
        : foodData().where((p) => p.title!.startsWith(query)).toList();
    return mylist.isEmpty
        ? Text("No results found")
        : ListView.builder(
            itemCount: mylist.length,
            itemBuilder: (context, index) {
              final Data listItem = mylist[index];
              return ListTile(
                onTap: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => SelectQuantity(
                        title: listItem.title!,
                        calories: listItem.calories!.toInt(),
                        carbs: listItem.carbs!.toInt(),
                        fats: listItem.fats!.toInt(),
                        fiber: listItem.fiber!.toInt(),
                        protein: listItem.protein!.toInt(),
                        quantity: listItem.quantity!.toInt(),
                        meal: 5,
                        icon: listItem.icon.toString(),
                        image: listItem.image.toString(),
                      ),
                    ),
                  );
                },
                title: Text(listItem.title!),
                subtitle: Text(
                  listItem.calories.toString(),
                ),
              );
            });
  }
}
