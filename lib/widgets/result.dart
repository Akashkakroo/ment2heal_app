import 'package:flutter/material.dart';

class ResultQuiz extends StatefulWidget {
  ResultQuiz({Key? key, required this.score}) : super(key: key);
  final int score;

  @override
  State<ResultQuiz> createState() => _ResultQuizState();
}

class _ResultQuizState extends State<ResultQuiz> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your mental health score is: ${widget.score}",
            style: const TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontSize: 15),
          ),
          widget.score == 1
              ? const Text(
                  "Your mental health is poor",
                  style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontSize: 15),
                )
              : widget.score == 2
                  ? const Text(
                      "Your mental health is good",
                      style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontSize: 15),
                    )
                  : const Text(
                      "Your mental health is excellent",
                      style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontSize: 15),
                    ),
        ],
      ),
    );
  }
}
