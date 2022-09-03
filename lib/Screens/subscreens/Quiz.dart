import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ment2heal/models/questions.dart';
import 'package:ment2heal/widgets/optionCard.dart';
import 'package:ment2heal/widgets/questions.dart';
import 'package:ment2heal/widgets/result.dart';

import '../../utils/hexcolor.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // ignore: prefer_final_fields
  List<Questions> _questions = [
    Questions(
        id: '10',
        title: 'How well have you been able to focus on your daily tasks?',
        options: {
          'Very well': 4,
          'Moderately well': 3,
          'Not at all': 2,
          'I feel overwhelmed': 1,
        }),
    Questions(
        id: '11',
        title:
            'If you have been worried lately, have you experienced disturbed sleep because of it?',
        options: {
          'I feel well-rested': 4,
          'I sleep the desired amount my body needs': 3,
          'I sleep less than usual': 2,
          'I do not sleep well': 1,
        }),
    Questions(
        id: '12',
        title:
            'In your everyday activities/tasks, have you felt like you are playing a useful role?',
        options: {
          'Yes, I feel satisfied': 4,
          'Mostly yes': 3,
          'Sometimes I doubt if I am being useful': 2,
          'I feel like I am not adding any value to anything': 1,
        }),
    Questions(
        id: '13',
        title: 'Have you ever felt like you were making capable decisions?',
        options: {
          'Yes, almost every time': 4,
          'Yes, sometimes': 3,
          'Not too many times': 2,
          'I rely on others to make my decisions as I feel incapable of taking any decisions':
              1,
        }),
  ];

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> MentalHealthScore(int score) async {
    final uid = await auth.currentUser!.uid;
    FirebaseFirestore.instance.collection('MentalHealthScore').add({
      'mentalhealthscore': score.toString(),
      'id': uid,
    });
  }

  int index = 0;
  int score = 0;
  bool isPressed = false;
  bool isAlreadySeclected = false;
  void nextQuestion() {
    if (index == _questions.length - 1) {
      MentalHealthScore(score);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ResultQuiz(
            score: score,
          ),
        ),
      );
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySeclected = false;
        });
      } else {
        // ignore: prefer_const_constructors
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text("Please Select Your Answer"),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.symmetric(vertical: 20.0)));
      }
    }
  }

  void CheckAnswerandUpdate(int value) {
    if (isAlreadySeclected) {
      return;
    } else {
      if (value == 1) {
        score += 1;
      } else if (value == 2) {
        score += 2;
      } else if (value == 3) {
        score += 3;
      } else if (value == 4) {
        score += 4;
      }

      setState(() {
        isPressed = true;
        isAlreadySeclected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#D5E8FE"),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 50, 10, 0),
            child: Column(
              children: [
                QuestionWidget(
                  question: _questions[index].title,
                  indexAction: index,
                  totalQuestions: _questions.length,
                ),
                // Divider(color: Colors.grey[800]),
                const SizedBox(
                  height: 20,
                ),
                for (int i = 0; i < _questions[index].options.length; i++)
                  GestureDetector(
                    onTap: () => CheckAnswerandUpdate(
                        _questions[index].options.values.toList()[i]),
                    child: OptionCard(
                      option: _questions[index].options.keys.toList()[i],
                      // color: isPressed
                      //     ? _questions[index].options.values.toList()[i] == 1
                      //         ? Colors.green
                      //         : Colors.red
                      //     : Colors.white,
                    ),
                  ),
                const SizedBox(
                  height: 50,
                ),
                // Text(
                //   "Score: ${score}",
                //   style: const TextStyle(color: Colors.black),
                // ),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: nextQuestion,
                  child: Container(
                    // ignore: sort_child_properties_last
                    child: Center(
                      child: const Text(
                        "Next Question",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    width: 150,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
