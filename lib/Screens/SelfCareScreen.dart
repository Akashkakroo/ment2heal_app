import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/hexcolor.dart';

class SelfCare extends StatefulWidget {
  const SelfCare({Key? key}) : super(key: key);

  @override
  State<SelfCare> createState() => _SelfCareState();
}

class _SelfCareState extends State<SelfCare> {
  bool isTrue = false;
  checkHasData() async {
    var ds = await FirebaseFirestore.instance
        .collection("Affirmaitions")
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    this.setState(() {
      if (ds.size > 1) {
        isTrue = true;
      }
    });
    print(ds.size);
  }

  @override
  void initState() {
    checkHasData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('Affirmaitions')
              .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return isTrue
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: (snapshot.data! as dynamic).docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot snap =
                          (snapshot.data! as dynamic).docs[index];

                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      color: Colors.black,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    })
                : Container(
                    child: Column(
                      children: [],
                    ),
                  );
          }),
    );
  }
}
