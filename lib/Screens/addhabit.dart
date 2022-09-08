import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ment2heal/Screens/habittrackercommon.dart';
import 'package:ment2heal/Screens/todalHabit.dart';
import 'package:ment2heal/utils/hexcolor.dart';
import '../widgets/colorContainer.dart';
import '../widgets/daysContainer.dart';
import '../widgets/guesstext.dart';

class AddHabit extends StatefulWidget {
  const AddHabit({Key? key}) : super(key: key);

  @override
  State<AddHabit> createState() => _AddHabitState();
}

class _AddHabitState extends State<AddHabit> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController _afterController = TextEditingController();
  TextEditingController _willController = TextEditingController();
  String color = '';
  String day = '';
  String image = '';

  addHabit(
      String color, String day, String after, String will, String image) async {
    final uid = await auth.currentUser!.uid;
    FirebaseFirestore.instance.collection('HabitTracker').add({
      'line1': after,
      'line2': will,
      'lableColor': color,
      'day': day,
      'id': uid,
      'image': image,
      'isCompleted': 0,
    });
    print(uid);
    print(after);
    print(will);
    print(color);
    print(day);
  }

  @override
  void dispose() {
    _afterController.dispose();
    _willController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "New Habit",
            style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 15, 10, 0),
              child: Text(
                'Cancel',
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                      fontSize: 18),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "After I,",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        fontSize: 18),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    // color: HexColor("#D5E8FE"),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                    child: TextFormField(
                      controller: _afterController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'brush my teeth',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        // ignore: sort_child_properties_last
                        child: const Center(
                          child: Text(
                            "brush my teeth",
                          ),
                        ),
                        height: 40,
                        width: 110,
                        decoration: BoxDecoration(
                            color: HexColor("#E1E6E9"),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              style: BorderStyle.solid,
                            )),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        // ignore: sort_child_properties_last
                        child: const Center(
                          child: Text(
                            "had my dinner",
                          ),
                        ),
                        height: 40,
                        width: 110,
                        decoration: BoxDecoration(
                          color: HexColor("#E1E6E9"),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        // ignore: sort_child_properties_last
                        child: const Center(
                          child: Text(
                            "finish my gym",
                          ),
                        ),
                        height: 40,
                        width: 110,
                        decoration: BoxDecoration(
                          color: HexColor("#E1E6E9"),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        // ignore: sort_child_properties_last
                        child: const Center(
                          child: Text(
                            "brush my teeth",
                          ),
                        ),
                        height: 40,
                        width: 110,
                        decoration: BoxDecoration(
                          color: HexColor("#E1E6E9"),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "I will,",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        fontSize: 18),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    // color: HexColor("#D5E8FE"),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                    child: TextFormField(
                      controller: _willController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'go for a walk',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      guessContainer("meditate", "#E1E6E9"),
                      const SizedBox(
                        width: 5,
                      ),
                      guessContainer("go for a walk", "#E1E6E9"),
                      const SizedBox(
                        width: 5,
                      ),
                      guessContainer("read a book", "#E1E6E9"),
                      const SizedBox(
                        width: 5,
                      ),
                      guessContainer("brush my teeth", "#E1E6E9"),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Click on days to remind",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        fontSize: 18),
                  ),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          day = "All days";
                        },
                        child: DayContainer("All days"),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          day = "Only today";
                        },
                        child: DayContainer("Only today"),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Select label color",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          color = "#8BD1D9";
                          image = "assets/blueface.png";
                        },
                        child: ColorContainer("#8BD1D9")),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        color = "#FF7171";
                        image = "assets/redsmile.png";
                      },
                      child: ColorContainer("#FF7171"),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        color = "#FCCD8A";
                        image = "assets/lightyellowsmile.png";
                      },
                      child: ColorContainer("#FCCD8A"),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        color = "#F2BF22";
                        image = "assets/yellowsmile.png";
                      },
                      child: ColorContainer("#F2BF22"),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    addHabit(color, day, _afterController.text,
                        _willController.text, image);

                    setState(() {});
                  },
                  child: Container(
                    // ignore: sort_child_properties_last
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Create new habit",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
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
