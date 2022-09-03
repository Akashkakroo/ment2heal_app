import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  OptionCard({
    Key? key,
    required this.option,
    // required this.color,
  }) : super(key: key);
  final String option;
  // final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          // border: Border.all(),
        ),
        child: ListTile(
          title: Text(
            option,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
