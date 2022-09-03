import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/hexcolor.dart';

class AllHabits extends StatefulWidget {
  const AllHabits({Key? key}) : super(key: key);

  @override
  State<AllHabits> createState() => _AllHabitsState();
}

class _AllHabitsState extends State<AllHabits> {
  bool isTrue = false;

  checkHasData() async {
    var ds = await FirebaseFirestore.instance
        .collection("HabitTracker")
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    this.setState(() {
      int size = ds.size;
      if (size > 0) {
        isTrue = true;
      } else {
        isTrue = false;
      }
    });
    print(isTrue);
  }

  @override
  void initState() {
    checkHasData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "All Habits",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                ),
                const Icon(
                  Icons.bar_chart,
                  size: 35,
                  semanticLabel: 'Stats',
                ),
              ],
            ),
            FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('HabitTracker')
                    .where('id',
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .where('isCompleted', isEqualTo: 1)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return isTrue == true
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: (snapshot.data! as dynamic).docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot snap =
                                (snapshot.data! as dynamic).docs[index];

                            return Container(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    // ignore: sort_child_properties_last
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // ignore: deprecated_member_use
                                          Container(
                                            // ignore: sort_child_properties_last
                                            child: Image.asset(
                                              snap['image'],
                                              scale: 11,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              border: Border.all(
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              snap['isCompleted'] == 0
                                                  ? Text(
                                                      snap['line2'],
                                                      style:
                                                          GoogleFonts.quicksand(
                                                        textStyle:
                                                            const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15),
                                                      ),
                                                    )
                                                  : Text(
                                                      snap['line2'],
                                                      style:
                                                          GoogleFonts.quicksand(
                                                        textStyle: const TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.black,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                              snap['isCompleted'] == 0
                                                  ? Text(
                                                      snap['line1'],
                                                      style:
                                                          GoogleFonts.quicksand(
                                                        textStyle:
                                                            const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15),
                                                      ),
                                                    )
                                                  : Text(
                                                      snap['line1'],
                                                      style:
                                                          GoogleFonts.quicksand(
                                                        textStyle: const TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.black,
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                              snap['isCompleted'] == 0
                                                  ? const Text("Not completed")
                                                  : const Text("Completed"),
                                            ],
                                          ),

                                          const SizedBox(width: 10),

                                          GestureDetector(
                                              onTap: () {
                                                FirebaseFirestore.instance
                                                    .collection("HabitTracker")
                                                    .doc(snap.id)
                                                    .update({
                                                  'isCompleted': 1,
                                                });
                                                setState(() {});
                                              },
                                              child: snap['isCompleted'] == 0
                                                  ? Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                      ),
                                                    )
                                                  : Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                      ),
                                                    )),
                                        ],
                                      ),
                                    ),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: HexColor(snap['lableColor']),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          })
                      : Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 50,
                              ),
                              Image.asset(
                                "assets/lifestyles.png",
                                scale: 4,
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Text(
                                "Create new habit",
                                style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: Colors.grey,
                                      fontSize: 18),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Your current habits will come here, create one by tapping on plus button below",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        );
                }),
          ],
        ),
      ),
    );
  }
}
