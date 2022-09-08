import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ment2heal/Screens/fitnessTracker.dart';
import 'package:ment2heal/Screens/habittrackercommon.dart';

import 'package:ment2heal/widgets/track_main_container.dart';

import '../utils/hexcolor.dart';
import 'caloriesTracker.dart';

class Tracker extends StatelessWidget {
  const Tracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => StepsTracker(),
                ),
              );
            },
            child: trackerContainer(
                "Track your fitness level", "assets/footprint.png", '#A6D4FD'),
          ),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CalorieTracker(),
                ),
              );
            },
            child: trackerContainer(
                "Track your eating habits", "assets/eating.png", '#FFC855'),
          ),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HabitTracker(),
                ),
              );
            },
            child: trackerContainer(
                "Track your daily habits", "assets/sleep.png", '#05E39C'),
          ),
        ],
      ),
    );
  }
}
