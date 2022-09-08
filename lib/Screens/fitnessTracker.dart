import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StepsTracker extends StatefulWidget {
  const StepsTracker({Key? key}) : super(key: key);

  @override
  State<StepsTracker> createState() => _StepsTrackerState();
}

class _StepsTrackerState extends State<StepsTracker> {
  // num newsteps = 0;
  num sum1 = 0;
  num sum2 = 0;
  num sum3 = 0;
  num sum4 = 0;
  @override
  void initState() {
    final now = DateTime.now();
    final formatter = DateFormat('dd-MM-yyyy');
    final formatted = formatter.format(now);
    FirebaseFirestore.instance
        .collection('StepsTracker/Qek2VqiN5CeKRsq45kfwFNTCKGP2/data')
        .where('Time', isEqualTo: formatted)
        .get()
        .then(
      (querySnapshot) {
        querySnapshot.docs.forEach((result) {
          sum1 = sum1 + result.data()['Steps'];
        });
        setState(() {
          steps = sum1.toInt();
        });
      },
    );
    FirebaseFirestore.instance
        .collection('StepsTracker/Qek2VqiN5CeKRsq45kfwFNTCKGP2/data')
        .where('Time', isEqualTo: formatted)
        .get()
        .then(
      (querySnapshot) {
        querySnapshot.docs.forEach((result) {
          sum2 = sum2 + result.data()['Calories'];
        });
        setState(() {
          calories = sum2.toDouble();
          print(formatted);
        });
      },
    );
    super.initState();
  }

  getTotalCalories() async {}

  DateTime date = DateTime.now();
  final dateFormate = DateFormat('dd-MM-yyyy');
  final FirebaseAuth auth = FirebaseAuth.instance;
  void sendData(int steps, int calories, int duration, int distance) async {
    final now = DateTime.now();
    final formatter = DateFormat('dd-MM-yyyy');
    final formatted = await formatter.format(now);
    final uid = await auth.currentUser!.uid;
    FirebaseFirestore.instance.collection('StepsTracker/$uid/data').add({
      'id': uid,
      'Steps': steps,
      'Calories': calories,
      'Duration': duration,
      'Distance': distance,
      'Time': formatted,
    });
  }

  bool isPressed = false;
  int targetSteps = 4000;
  double x = 0.0;
  double y = 0.0;
  double z = 0.0;
  double miles = 0.0;
  double duration = 0.0;
  double calories = 0.0;
  double addValue = 0.025;
  int steps = 0;
  double previousDistacne = 0.0;
  double distance = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // ignore: prefer_const_constructors
        title: Text(
          "My Steps",
          style: const TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert_sharp),
          ),
        ],
      ),
      body: StreamBuilder<AccelerometerEvent>(
        stream: SensorsPlatform.instance.accelerometerEvents,
        builder: (context, snapShort) {
          if (snapShort.hasData && isPressed == true) {
            x = snapShort.data!.x;
            y = snapShort.data!.y;
            z = snapShort.data!.z;
            distance = getValue(x, y, z);
            if (distance > 6) {
              steps++;
            }
            calories = calculateCalories(steps);
            duration = calculateDuration(steps);
            miles = calculateMiles(steps);
          }
          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      height: 140,
                      width: 140,
                      // ignore: prefer_const_constructors
                      child: CircularProgressIndicator(
                        strokeWidth: 15,
                        backgroundColor: Colors.redAccent,
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.amber),
                        value: steps == 0
                            ? 0
                            : (steps > 0 && steps < 500)
                                ? 0.05
                                : (steps > 500 && steps < 1000)
                                    ? 0.1
                                    : (steps > 1000 && steps < 1500)
                                        ? 0.2
                                        : (steps > 1500 && steps < 1700)
                                            ? 0.3
                                            : (steps > 1700 && steps < 1900)
                                                ? 0.4
                                                : (steps > 1900 && steps < 2100)
                                                    ? 0.5
                                                    : (steps > 2100 &&
                                                            steps < 2500)
                                                        ? 0.6
                                                        : (steps > 2500 &&
                                                                steps < 2900)
                                                            ? 0.7
                                                            : (steps > 2900 &&
                                                                    steps <
                                                                        3500)
                                                                ? 0.8
                                                                : (steps > 3500 &&
                                                                        steps <
                                                                            3700)
                                                                    ? 0.9
                                                                    : (steps > 3700 &&
                                                                            steps <
                                                                                3900)
                                                                        ? 0.95
                                                                        : 1,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      // ignore: sort_child_properties_last
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: isPressed == false
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isPressed = true;
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const Icon(Icons.play_arrow),
                                      // ignore: prefer_const_constructors

                                      // ignore: prefer_const_constructors
                                      Text(
                                        "Play",
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                        // ignore: prefer_const_constructors
                                      )
                                      // ignore: prefer_const_constructors
                                    ],
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isPressed = false;
                                      sendData(
                                          (steps.toInt() - sum1.toInt()),
                                          (calories.toInt() - sum2.toInt()),
                                          duration.toInt(),
                                          distance.toInt());
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const Icon(Icons.pause),
                                      // ignore: prefer_const_constructors

                                      // ignore: prefer_const_constructors
                                      Text(
                                        "Pause",
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                        // ignore: prefer_const_constructors
                                      )
                                      // ignore: prefer_const_constructors
                                    ],
                                  ),
                                )),

                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.white,
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
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      // ignore: sort_child_properties_last
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                // ignore: prefer_const_constructors
                                Text(
                                  "Steps",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  steps.toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                // ignore: prefer_const_constructors
                                Text(
                                  "Goal",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  targetSteps.toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                // ignore: prefer_const_constructors
                                Text(
                                  "Miles",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${miles.toStringAsFixed(3)} km",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      width: double.infinity,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.white,
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
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // ignore: sort_child_properties_last
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              // ignore: prefer_const_constructors
                              Text(
                                "Level",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400),
                              ),
                              // ignore: prefer_const_constructors
                              Text(
                                "2",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.white,
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
                          ),
                        ),
                        Container(
                          // ignore: sort_child_properties_last
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // ignore: prefer_const_constructors
                              Text(
                                "Calories",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                calories.toStringAsFixed(2),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.white,
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
                          ),
                        ),
                        Container(
                          // ignore: sort_child_properties_last
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // ignore: prefer_const_constructors
                              Text(
                                "Time",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                duration.toStringAsFixed(3),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.white,
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
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  double getValue(double x, double y, double z) {
    double magnitude = sqrt(x * x + y * y + z * z);
    getPreviousValue();
    double modDistance = magnitude - previousDistacne;
    setPreviousValue(magnitude);
    return modDistance;
  }

  void setPreviousValue(double distance) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setDouble("preValue", distance);
  }

  void getPreviousValue() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setState(() {
      previousDistacne = _pref.getDouble("preValue") ?? 0.0;
    });
  }

  // void calculate data
  double calculateMiles(int steps) {
    double milesValue = (2.5 * steps) / 3280;
    return milesValue;
  }

  double calculateDuration(int steps) {
    double durationValue = (steps * 1 / 1000);
    return durationValue;
  }

  double calculateCalories(int steps) {
    double caloriesValue = (steps * 0.0566);
    return caloriesValue;
  }
}
