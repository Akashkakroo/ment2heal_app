import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ment2heal/Screens/subscreens/Quiz.dart';
import 'package:ment2heal/utils/hexcolor.dart';

class MentalHealthScore extends StatefulWidget {
  const MentalHealthScore({Key? key}) : super(key: key);

  @override
  State<MentalHealthScore> createState() => _MentalHealthScoreState();
}

class _MentalHealthScoreState extends State<MentalHealthScore> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#D5E8FE"),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                "CHECK YOUR MENTAL HEALTH SCORE !",
                textAlign: TextAlign.center,
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 24),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "The results of this questionnaire will help you in understanding where you belong on the mental health spectrum.* ",
                textAlign: TextAlign.center,
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Quiz(),
                    ),
                  );
                },
                child: Container(
                  // ignore: sort_child_properties_last
                  child: Center(
                    child: const Text(
                      "Let's Go",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    color: HexColor("#D5E8FE"),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "* Please note: While the results of this questionnaire should not be considered as a mental health diagnosis but it's designed by experts & professionals to provide a basic understanding & sensitize users on their mental health basis the responses they provide.",
                textAlign: TextAlign.center,
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w200,
                      color: Colors.black,
                      fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
