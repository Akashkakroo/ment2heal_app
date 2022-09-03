import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ment2heal/Screens/subscreens/affirmationScreen.dart';
import 'package:ment2heal/Screens/subscreens/audioChallenge.dart';
import 'package:ment2heal/Screens/subscreens/mentalhealth_score.dart';
import 'package:ment2heal/Screens/subscreens/mood.dart';
import 'package:ment2heal/Screens/subscreens/smile.dart';
import 'package:ment2heal/utils/hexcolor.dart';
import 'package:confetti/confetti.dart';
import '../test.dart';
import '../widgets/52weekcontainer.dart';
import '../widgets/affirmationcontainer.dart';
import '../widgets/tests.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool secondContainer = false;
  bool thirdContainer = false;
  bool fourthContainer = false;

  checkHasData() async {
    var ds = await FirebaseFirestore.instance
        .collection("ContainerData")
        .where('containerNo', isEqualTo: 1)
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    this.setState(() {
      int size = ds.size;
      print(size);
      if (size > 0) {
        secondContainer = true;
      } else {
        secondContainer = false;
      }
    });
    print("secondContainer ${secondContainer}");
  }

  checkHasData1() async {
    var ds = await FirebaseFirestore.instance
        .collection("ContainerData")
        .where('containerNo', isEqualTo: 2)
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    this.setState(() {
      int size = ds.size;
      print(size);
      if (size > 0) {
        thirdContainer = true;
      } else {
        thirdContainer = false;
      }
    });
    print("thirdContainer ${thirdContainer}");
  }

  @override
  void initState() {
    checkHasData();
    checkHasData1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        Text(
                          "Hi, Akash!",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),

                        Text(
                          DateTime.now().month.toString(),
                          style: TextStyle(color: Colors.grey[800]),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      // ignore: sort_child_properties_last
                      child: const Icon(Icons.notifications),
                      decoration: BoxDecoration(
                        color: HexColor("#CCE1F2"),
                        borderRadius: BorderRadius.circular(10),
                        // ignore: prefer_const_literals_to_create_immutables
                        boxShadow: [
                          const BoxShadow(
                            color: Colors.white,
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // ['mentalhealthscore'] == null
              //     ? Container(
              //         height: 100,
              //         decoration: BoxDecoration(
              //           image: const DecorationImage(
              //             image: AssetImage('assets/container.png'),
              //             fit: BoxFit.fitWidth,
              //           ),
              //           // color: HexColor("#CCE1F2"),
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //       )
              //     : Padding(
              //         padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              //         child: FutureBuilder(
              //           future: FirebaseFirestore.instance
              //               .collection('MentalHealthScore')
              //               .where('id',
              //                   isEqualTo:
              //                       FirebaseAuth.instance.currentUser!.uid)
              //               .get(),
              //           builder: (context, snapshot) {
              //             if (snapshot.connectionState ==
              //                 ConnectionState.waiting) {
              //               return const Center(
              //                 child: CircularProgressIndicator(),
              //               );
              //             }

              //             return ListView.builder(
              //               shrinkWrap: true,
              //               itemCount: (snapshot.data! as dynamic).docs.length,
              //               itemBuilder: (context, index) {
              //                 DocumentSnapshot snap =
              //                     (snapshot.data! as dynamic).docs[index];

              //                 return Container(
              //                   // ignore: sort_child_properties_last
              //                   child: Padding(
              //                     padding: const EdgeInsets.all(12.0),
              //                     child: Column(
              //                       crossAxisAlignment:
              //                           CrossAxisAlignment.start,
              //                       children: [
              //                         Text(
              //                           "Mental Health Score : ${snap['mentalhealthscore']}",
              //                           style: GoogleFonts.quicksand(
              //                             textStyle: const TextStyle(
              //                                 fontWeight: FontWeight.w600,
              //                                 color: Colors.black,
              //                                 fontSize: 18),
              //                           ),
              //                         ),
              //                         Text(
              //                           "Average Mood : Happy",
              //                           style: GoogleFonts.quicksand(
              //                             textStyle: const TextStyle(
              //                                 fontWeight: FontWeight.w600,
              //                                 color: Colors.black,
              //                                 fontSize: 18),
              //                           ),
              //                         ),
              //                         Text(
              //                           "Personality Type : Extraversion ",
              //                           style: GoogleFonts.quicksand(
              //                             textStyle: const TextStyle(
              //                                 fontWeight: FontWeight.w600,
              //                                 color: Colors.black,
              //                                 fontSize: 18),
              //                           ),
              //                         ),
              //                         Text(
              //                           "Mental Health Coins : 360",
              //                           style: GoogleFonts.quicksand(
              //                             textStyle: const TextStyle(
              //                                 fontWeight: FontWeight.w600,
              //                                 color: Colors.black,
              //                                 fontSize: 18),
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                   height: 120,
              //                   decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(24),

              //                     // gradient: LinearGradient(
              //                     //   colors: [
              //                     //
              //                     //     // HexColor("#b4ffeb"),
              //                     //     // Color.fromARGB(255, 102, 207, 255),
              //                     //     // Colors.lightBlue
              //                     //   ],
              //                     //   begin: Alignment.topLeft,
              //                     //   end: Alignment.bottomRight,
              //                     // ),

              //                     // ignore: prefer_const_literals_to_create_immutables
              //                     color: HexColor("#F2C849"),
              //                     boxShadow: [
              //                       const BoxShadow(
              //                         color: Colors.white,
              //                         blurRadius: 1,
              //                         offset: Offset(5, 6),
              //                       ),
              //                     ],
              //                   ),
              //                 );
              //               },
              //             );
              //           },
              //         ),
              //       ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "How do you feel?",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(Icons.more_horiz)
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BadMood(
                              moodText:
                                  'Sorry to hear that, you are having\n a bad day ☹️',
                              quote: 'This is Quote',
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Colors.blue,
                                  Colors.white,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              // ignore: prefer_const_literals_to_create_immutables
                              boxShadow: [
                                BoxShadow(
                                  color: HexColor("#CCE1F2"),
                                  blurRadius: 12,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                              // color: HexColor("#CCE1F2"),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: const Center(
                              child: Text(
                                "☹️",
                                style: TextStyle(fontSize: 28),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Bad",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 15),
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Colors.blue,
                                Colors.white,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            // ignore: prefer_const_literals_to_create_immutables
                            boxShadow: [
                              BoxShadow(
                                color: HexColor("#CCE1F2"),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                            // color: HexColor("#CCE1F2"),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: const Center(
                            child: Text(
                              "😩",
                              style: TextStyle(fontSize: 28),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Fine",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 15),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Colors.blue,
                                Colors.white,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            // ignore: prefer_const_literals_to_create_immutables
                            boxShadow: [
                              BoxShadow(
                                color: HexColor("#CCE1F2"),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                            // color: HexColor("#CCE1F2"),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: const Center(
                            child: Text(
                              "🙂",
                              style: TextStyle(fontSize: 28),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Well",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 15),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Colors.blue,
                                Colors.white,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            // ignore: prefer_const_literals_to_create_immutables
                            boxShadow: [
                              BoxShadow(
                                color: HexColor("#CCE1F2"),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                            // color: HexColor("#CCE1F2"),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: const Center(
                            child: Text(
                              "😀",
                              style: TextStyle(fontSize: 28),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Excellent",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      color: Colors.transparent,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MentalHealthScore(),
                          ),
                        );
                      },
                      child: Positioned(
                        top: 10,
                        child: Container(
                          // ignore: sort_child_properties_last
                          // ignore: prefer_const_constructors
                          // ignore: sort_child_properties_last
                          child: Center(
                            child: Text(
                              "Check Your\n Mental Health Score!",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                          height: 120,
                          width: 350,
                          decoration: BoxDecoration(
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
                            color: HexColor("#E1E6E9"),
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 10,
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/mental.png'),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "Meditations for you",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(Icons.more_horiz)
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 0.0, 0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: <Widget>[
                          GestureDetector(
                            child: container52Weeks('Day 1', 'Work Balance',
                                true, "#F2BF22", 'assets/balanced.png'),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => AudioChallenge(
                                    audio: "audio1.mp3",
                                    img: "assets/radar.png",
                                    txt: "Work-Life balance",
                                    id: 1,
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          secondContainer == true
                              ? GestureDetector(
                                  child: container52Weeks(
                                      'Day 2',
                                      'Life-Balance',
                                      secondContainer,
                                      "#FF7171",
                                      'assets/life.png'),
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => AudioChallenge(
                                          audio: "audio1.mp3",
                                          img: "assets/life.png",
                                          txt: "Work-Life balance",
                                          id: 2,
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : container52Weeks(
                                  'Day 2',
                                  'Life-Balance',
                                  secondContainer,
                                  "#FF7171",
                                  'assets/life.png'),
                          const SizedBox(
                            width: 10.0,
                          ),
                          thirdContainer == true
                              ? GestureDetector(
                                  child: container52Weeks(
                                      'Day 3',
                                      'Career Balance',
                                      thirdContainer,
                                      "#8BD1D9",
                                      'assets/career.png'),
                                  onTap: () {})
                              : container52Weeks(
                                  'Day 3',
                                  'Career Balance',
                                  thirdContainer,
                                  "#8BD1D9",
                                  'assets/career.png'),
                          const SizedBox(
                            width: 10.0,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      color: Colors.transparent,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SmileScreen(),
                          ),
                        );
                      },
                      child: Positioned(
                        top: 10,
                        child: Container(
                          // ignore: sort_child_properties_last
                          // ignore: prefer_const_constructors
                          // ignore: sort_child_properties_last
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  "Chick here to Smile!",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 22),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Forcing a fake smile can legitimately reduce stress and lower your heart rate.",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                ),
                              )
                            ],
                          ),
                          height: 120,
                          width: 350,
                          decoration: BoxDecoration(
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
                            color: HexColor("#FCCD8A"),
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 10,
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/smile.png'),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 0.0, 0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                                child: affirmationContainer(
                                    "Daily Affirmations for Self-Love",
                                    'assets/hug.png',
                                    '#FF7171'),
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const AffirmationPage(),
                                    ),
                                  );
                                }),
                            const SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                              child: affirmationContainer(
                                  "Daily Affirmations for Success",
                                  'assets/target.png',
                                  '#D5E8FE'),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                              child: affirmationContainer(
                                  "Daily Affirmations for Women",
                                  'assets/woman.png',
                                  '#FFC839'),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                              child: affirmationContainer(
                                  "Daily Affirmations for Men",
                                  'assets/man.png',
                                  '#F2786D'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "Psychometric Tests",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                    const Icon(Icons.more_horiz),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 0.0, 0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              child: testCard(
                                  'Myers-Briggs Type Indicator (MBTI)',
                                  'assets/puzzle.png',
                                  '#FEC0DD'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              child: testCard('Depression',
                                  'assets/depression.png', '#FFD168'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              child: testCard(
                                  'Anxiety', 'assets/anxiety.png', '#F2D1A5'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              child: testCard(
                                  'Self-Esteem', 'assets/self.png', '#B0D3F0'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
