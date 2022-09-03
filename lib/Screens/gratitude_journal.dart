import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../utils/hexcolor.dart';
import '../widgets/gratitude_Textfield.dart';

class GratitudeJournal extends StatefulWidget {
  const GratitudeJournal({Key? key}) : super(key: key);

  @override
  State<GratitudeJournal> createState() => _GratitudeJournalState();
}

class _GratitudeJournalState extends State<GratitudeJournal> {
  TextEditingController _sno1controller = TextEditingController();
  TextEditingController _sno2controller = TextEditingController();
  TextEditingController _sno3controller = TextEditingController();
  TextEditingController _sno4controller = TextEditingController();
  TextEditingController _sno5controller = TextEditingController();
  TextEditingController _obstacle1controller = TextEditingController();
  TextEditingController _obstacle2controller = TextEditingController();
  TextEditingController _obstacle3controller = TextEditingController();
  TextEditingController _learning1controller = TextEditingController();
  TextEditingController _learning2controller = TextEditingController();
  TextEditingController _learning3controller = TextEditingController();
  TextEditingController _people1controller = TextEditingController();
  TextEditingController _people2controller = TextEditingController();
  TextEditingController _people3controller = TextEditingController();
  TextEditingController _people4controller = TextEditingController();
  TextEditingController _people5controller = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  void postGratitude(
      // ignore: no_leading_underscores_for_local_identifiers

      ) async {
    var now = DateTime.now();
    var formatter = DateFormat('dd-MM-yyyy');
    String formatted = formatter.format(now);
    final uid = await auth.currentUser!.uid;
    FirebaseFirestore.instance.collection('Gratitude').add({
      'date': formatted,
      'id': uid,
      'gratitude1': _sno1controller.text,
      'gratitude2': _sno2controller.text,
      'gratitude3': _sno3controller.text,
      'gratitude4': _sno4controller.text,
      'gratitude5': _sno5controller.text,
      'obstacle1': _obstacle1controller.text,
      'obstacle2': _obstacle2controller.text,
      'obstacle3': _obstacle3controller.text,
      'learning1': _learning1controller.text,
      'learning2': _learning2controller.text,
      'learning3': _learning3controller.text,
      'people1': _people1controller.text,
      'people2': _people2controller.text,
      'people3': _people3controller.text,
      'people4': _people4controller.text,
      'people5': _people5controller.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Gratitude Journal",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                        fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ExpansionTile(
                  leading: Icon(
                    Icons.self_improvement,
                    color: Colors.brown,
                  ),
                  title: Text(
                    "Morning gratitude",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.brown,
                          fontSize: 17),
                    ),
                  ),
                  children: [
                    Text(
                      "Before you begin your day, list 5 things you’re grateful for",
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    textFieldGratitude(
                      "1.",
                      _sno1controller,
                      "Graitude 1",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    textFieldGratitude(
                      "2.",
                      _sno2controller,
                      "Graitude 2",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    textFieldGratitude(
                      "3.",
                      _sno3controller,
                      "Graitude 3",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    textFieldGratitude(
                      "4.",
                      _sno4controller,
                      "Graitude 4",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    textFieldGratitude(
                      "5.",
                      _sno5controller,
                      "Graitude 5",
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Save"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                ExpansionTile(
                  leading: Icon(
                    Icons.self_improvement,
                    color: Colors.brown,
                  ),
                  title: Text(
                    "What I’m learning from my challenges",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.brown,
                          fontSize: 17),
                    ),
                  ),
                  children: [
                    Text(
                      "List three obstacles and what you’re learning from them.",
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    textFieldGratitude(
                      "1.",
                      _obstacle1controller,
                      "Obstacle 1",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "What I'm learning:",
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: _learning1controller,
                      onSubmitted: (s) {},
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: "Learning.....",
                        fillColor: Color.fromARGB(255, 146, 186, 255),
                        filled: true,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    textFieldGratitude(
                      "2.",
                      _obstacle2controller,
                      "Obstacle 2",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "What I'm learning:",
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: _learning2controller,
                      onSubmitted: (s) {},
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: "Learning.....",
                        fillColor: Color.fromARGB(255, 146, 186, 255),
                        filled: true,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    textFieldGratitude(
                      "3.",
                      _obstacle3controller,
                      "Obstacle 3",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "What I'm learning:",
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: _learning3controller,
                      onSubmitted: (s) {},
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: "Learning.....",
                        fillColor: Color.fromARGB(255, 146, 186, 255),
                        filled: true,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Save"),
                    ),
                  ],
                ),
                ExpansionTile(
                  leading: Icon(
                    Icons.self_improvement,
                    color: Colors.brown,
                  ),
                  title: Text(
                    "People I’m grateful for",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.brown,
                          fontSize: 17),
                    ),
                  ),
                  children: [
                    Text(
                      "List 5 people who made your life a little happier today. These could be friends, family or strangers!:",
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    textFieldGratitude(
                      "1.",
                      _people1controller,
                      "Person 1",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    textFieldGratitude(
                      "2.",
                      _people2controller,
                      "Person 2",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    textFieldGratitude(
                      "3.",
                      _people3controller,
                      "Person 3",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    textFieldGratitude(
                      "4.",
                      _people4controller,
                      "Person 4",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    textFieldGratitude(
                      "5.",
                      _people5controller,
                      "Person 5",
                    ),
                    ElevatedButton(
                      onPressed: postGratitude,
                      child: Text("Save"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
