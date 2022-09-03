import 'package:flutter/material.dart';
import 'package:ment2heal/Screens/subscreens/bookTherapy.dart';

import '../utils/hexcolor.dart';

class TherapyScreen extends StatelessWidget {
  const TherapyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none_outlined,
                color: Colors.black,
              ),
            ),
          ],
          title: const Text(
            "Ment 2 Heal",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      width: 120,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/doctor.jpg'),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Shradha Bhair",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            // ignore: prefer_const_constructors
                            Icon(
                              Icons.book_outlined,
                              size: 15,
                              color: Color.fromARGB(255, 88, 212, 92),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text('M.A,B.A'),
                            const SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.work,
                              size: 15,
                              color: Color.fromARGB(255, 88, 212, 92),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text('2+ years exp')
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.comment,
                              size: 15,
                              color: Color.fromARGB(255, 88, 212, 92),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text("Speaks English,Hindi,Bengali"),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.bookmark,
                              size: 15,
                              color: Color.fromARGB(255, 88, 212, 92),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text("Virtual"),
                            const SizedBox(
                              width: 5,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.money,
                              size: 15,
                              color: Color.fromARGB(255, 88, 212, 92),
                            ),
                            const Text("500 for 30 mins"),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              child: Center(
                                  child: Text(
                                "VIEW PROFILE",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                              height: 40,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push<void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        const BookTherapy(),
                                  ),
                                );
                              },
                              child: Container(
                                child: Center(
                                    child: Text(
                                  "BOOK NOW",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                                height: 40,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      width: 120,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/doctor.jpg'),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Shradha Bhair",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            // ignore: prefer_const_constructors
                            Icon(
                              Icons.book_outlined,
                              size: 15,
                              color: Color.fromARGB(255, 88, 212, 92),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text('M.A,B.A'),
                            const SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.work,
                              size: 15,
                              color: Color.fromARGB(255, 88, 212, 92),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text('2+ years exp')
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.comment,
                              size: 15,
                              color: Color.fromARGB(255, 88, 212, 92),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text("Speaks English,Hindi,Bengali"),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.bookmark,
                              size: 15,
                              color: Color.fromARGB(255, 88, 212, 92),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text("Virtual"),
                            const SizedBox(
                              width: 5,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.money,
                              size: 15,
                              color: Color.fromARGB(255, 88, 212, 92),
                            ),
                            const Text("500 for 30 mins"),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              child: Center(
                                  child: Text(
                                "VIEW PROFILE",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                              height: 40,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Center(
                                  child: Text(
                                "BOOK NOW",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                              height: 40,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
