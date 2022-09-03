// ignore_for_file: prefer_final_fields, no_leading_underscores_for_local_identifiers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ment2heal/Screens/gratitude_journal.dart';

import '../../utils/hexcolor.dart';

class BadMood extends StatefulWidget {
  const BadMood({Key? key, required this.moodText, required this.quote})
      : super(key: key);
  final String moodText;
  final String quote;

  @override
  State<BadMood> createState() => _BadMoodState();
}

class _BadMoodState extends State<BadMood> {
  // ignore: prefer_final_fields, unused_field
  TextEditingController _gratitude1Controller = TextEditingController();
  TextEditingController _blessed1Controller = TextEditingController();
  TextEditingController _gratitude2Controller = TextEditingController();
  TextEditingController _gratitude3Controller = TextEditingController();
  TextEditingController _blessed2Controller = TextEditingController();
  TextEditingController _blessed3Controller = TextEditingController();
  TextEditingController _nameyourdayController = TextEditingController();
  TextEditingController _notBlessed3Controller = TextEditingController();
  TextEditingController _notBlessed1Controller = TextEditingController();
  TextEditingController _notBlessed2Controller = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  void sendData(
    // ignore: no_leading_underscores_for_local_identifiers
    String _gratitude1Controller,
    String _gratitude2Controller,
    String _gratitude3Controller,
    String _blessed1Controller,
    String _blessed2Controller,
    String _blessed3Controller,
    String _notBlessed3Controller,
    String _notBlessed2Controller,
    String _notBlessed1Controller,
    String _nameyourdayController,
  ) async {
    final uid = await auth.currentUser!.uid;
    FirebaseFirestore.instance.collection('MoodTracker').add({
      'gratitudeline1': _gratitude1Controller,
      'gratitudeline2': _gratitude2Controller,
      'gratitudeline3': _gratitude3Controller,
      'blessedline1': _blessed1Controller,
      'blessedline2': _blessed2Controller,
      'blessedline3': _blessed3Controller,
      'notblessedline1': _notBlessed1Controller,
      'notblessedline2': _notBlessed2Controller,
      'notblessedline3': _notBlessed3Controller,
      'dayname': _nameyourdayController,
      'id': uid,
    });
  }

  @override
  void dispose() {
    _gratitude1Controller.dispose();
    _gratitude2Controller.dispose();
    _gratitude3Controller.dispose();
    _blessed1Controller.dispose();
    _blessed2Controller.dispose();
    _blessed3Controller.dispose();
    _notBlessed1Controller.dispose();
    _notBlessed2Controller.dispose();
    _notBlessed3Controller.dispose();
    _nameyourdayController.dispose();
    super.dispose();
  }

  bool hasData = false;
  checkHasData() async {
    var ds = await FirebaseFirestore.instance
        .collection("MoodTracker")
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    this.setState(() {
      int size = ds.size;
      if (size > 0) {
        hasData = true;
      } else {
        hasData = false;
      }
    });
    print(hasData);
  }

  @override
  void initState() {
    checkHasData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => GratitudeJournal(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        backgroundColor: HexColor("#D5E8FE"),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Text(
            "Hi, Akash",
            style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  fontSize: 22),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.info_outline,
                color: Colors.black,
              ),
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('MoodTracker')
              .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return hasData
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: (snapshot.data! as dynamic).docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot snap =
                          (snapshot.data! as dynamic).docs[index];
                      return Container(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                width: double.infinity,
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("12,Aug 2022"),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(snap['dayname']),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(snap['gratitudeline1']),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(snap['gratitudeline2']),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(snap['gratitudeline3']),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(snap['blessedline1']),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(snap['blessedline2']),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(snap['blessedline3']),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    })
                : Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            "Hey Akash, Sorry to here that you are having a bad day.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Image.asset(
                            "assets/sad.png",
                            scale: 5,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "We have got something, to make your day a lil bit better",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Click on the plus icon below",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
