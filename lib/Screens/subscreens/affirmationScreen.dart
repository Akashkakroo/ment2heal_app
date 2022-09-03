import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dialogflow_grpc/generated/google/type/date.pb.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ment2heal/provider/user_provider.dart';
import 'package:ment2heal/utils/hexcolor.dart';
import 'package:provider/provider.dart';
import '../../widgets/text_knowledge_aff.dart';
import 'package:intl/intl.dart';

class AffirmationPage extends StatefulWidget {
  const AffirmationPage({Key? key}) : super(key: key);

  @override
  State<AffirmationPage> createState() => _AffirmationPageState();
}

class _AffirmationPageState extends State<AffirmationPage> {
  bool isLoading = false;
  final TextEditingController _affirmationController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  bool isTrue = false;

  void postAffirmation(
    // ignore: no_leading_underscores_for_local_identifiers
    String _affirmationController,
  ) async {
    var now = DateTime.now();
    var formatter = DateFormat('dd-MM-yyyy');
    String formatted = formatter.format(now);
    final uid = await auth.currentUser!.uid;
    FirebaseFirestore.instance.collection('Affirmaitions').add({
      'affirmation': _affirmationController,
      'id': uid,
      'time': formatted,
    });
    print(formatted);
  }

  checkHasData() async {
    var ds = await FirebaseFirestore.instance
        .collection("Affirmaitions")
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
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    return Material(
      child: Scaffold(
        backgroundColor: HexColor("#D5E8FE"),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Material(
                      color: HexColor("#D5E8FE"),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Image.asset(
                                'assets/good.png',
                                scale: 3,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 350,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    bottomRight: Radius.circular(40),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 12,
                                      offset: Offset(0, 6),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Even when I mess up, I shouldn’t be too hard on myself. Instead, I will learn from it.",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.quicksand(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ),
                                      const SizedBox(height: 35),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: HexColor("#f4dbd9"),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // ignore: prefer_const_literals_to_create_immutables
                                          // boxShadow: [
                                          //   const BoxShadow(
                                          //     color: Colors.black,
                                          //     blurRadius: 12,
                                          //     offset: Offset(0, 6),
                                          //   ),
                                          // ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 5, 0),
                                          child: TextFormField(
                                            controller: _affirmationController,
                                            decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText:
                                                    "Even when I mess up, I shouldn’t ...."),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          postAffirmation(
                                              _affirmationController.text);
                                          setState(() {});
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 200,
                                          decoration: BoxDecoration(
                                            color: HexColor("#05F2DB"),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Center(
                                            child: const Text(
                                                "Submit your affirmation"),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ));
                });
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //OR Colors.red or whatever you want
          ),
          centerTitle: true,
          title: Text(
            "Ment 2 Heal",
            style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 22),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          // ignore: prefer_const_literals_to_create_immutables
          actions: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Icon(Icons.info_sharp),
            ),
          ],
        ),
        body: isTrue == false
            ? Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textAffirmationheading("What are Positive Affirmations?"),
                      const SizedBox(
                        height: 5,
                      ),
                      textAffirmationsubheading(
                          "Positive affirmations are words or phrases that encourage you to be more optimistic and hopeful. They help change your mindset and thinking patterns so that you can better cope with stress and difficult situations."),
                      const SizedBox(
                        height: 20,
                      ),
                      textAffirmationheading(
                          "8 Proven Benefits of Positive Affirmations :-"),
                      const SizedBox(
                        height: 5,
                      ),
                      textAffirmationsubheading(
                          '1. Decrease health-deteriorating stress.'),
                      const SizedBox(
                        height: 3,
                      ),
                      textAffirmationsubheading('3. Reduce anxiety.'),
                      const SizedBox(
                        height: 3,
                      ),
                      textAffirmationsubheading('4. Improve mood.'),
                      const SizedBox(
                        height: 3,
                      ),
                      textAffirmationsubheading('5. Promote positive coping.'),
                      const SizedBox(
                        height: 3,
                      ),
                      textAffirmationsubheading('6. Enhance self-esteem'),
                      const SizedBox(
                        height: 3,
                      ),
                      textAffirmationsubheading(
                          '7. Improve problem-solving under stress.'),
                      const SizedBox(
                        height: 3,
                      ),
                      textAffirmationsubheading('8. Can help you find love.'),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Click on the plus icon below to write your first affirmation',
                        style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              )
            : FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('Affirmaitions')
                    .where('id',
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: (snapshot.data! as dynamic).docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot snap =
                            (snapshot.data! as dynamic).docs[index];

                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: HexColor("#D5E8FE"),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 15,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snap['time'],
                                      style: GoogleFonts.quicksand(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontSize: 15),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Affirmation: ${snap['affirmation']}",
                                      style: GoogleFonts.quicksand(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 19),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                }),
      ),
    );
  }
}
