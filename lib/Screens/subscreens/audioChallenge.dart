// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/hexcolor.dart';

// ignore: must_be_immutable
class AudioChallenge extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var txt;
  String img;
  int id;
  // ignore: prefer_typing_uninitialized_variables
  var audio;
  AudioChallenge(
      {Key? key,
      required this.txt,
      required this.audio,
      required this.img,
      required this.id})
      : super(key: key);

  @override
  State<AudioChallenge> createState() => _AudioChallengeState();
}

class _AudioChallengeState extends State<AudioChallenge> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> addConatinerId(int number) async {
    final uid = await auth.currentUser!.uid;
    FirebaseFirestore.instance.collection('ContainerData').add({
      'containerNo': number,
      'id': uid,
    });
    print("container ${number} clicked");
  }

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    setAudio();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        // ignore: unrelated_type_equality_checks
        isPlaying = state == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio() async {
    // ignore: non_constant_identifier_names
    final Player = AudioCache(prefix: 'assets/');
    final url = await Player.load(widget.audio);
    audioPlayer.setSourceUrl(url.path);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Color.fromARGB(185, 0, 0, 0), //change your color here
          ),
          centerTitle: true,
          title: Text(
            "Ment 2 Heal",
            style: GoogleFonts.lilitaOne(
                textStyle: const TextStyle(
                    fontSize: 20, color: Color.fromARGB(185, 0, 0, 0))),
          ),
          backgroundColor: HexColor("#E2BEF1"),
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.cloud_download,
                color: Color.fromARGB(185, 0, 0, 0),
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          color: HexColor("#E2BEF1"),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: 350.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(widget.img)),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  widget.txt,
                  style: GoogleFonts.lilitaOne(
                      textStyle: const TextStyle(fontSize: 23)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Slider(
                    min: 0,
                    max: duration.inSeconds.toDouble(),
                    value: position.inSeconds.toDouble(),
                    activeColor: Colors.redAccent,
                    inactiveColor: Colors.black,
                    onChanged: (value) async {
                      final position = Duration(seconds: value.toInt());
                      await audioPlayer.seek(position);
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formatTime(position),
                        style: const TextStyle(fontWeight: FontWeight.w400),
                      ),
                      Text(formatTime(duration - position)),
                    ],
                  ),
                ),
                CircleAvatar(
                  backgroundColor: HexColor("#C6F8E5"),
                  radius: 25,
                  child: IconButton(
                    splashColor: Colors.yellow,
                    color: Colors.black,
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    iconSize: 35,
                    onPressed: () async {
                      if (isPlaying) {
                        await audioPlayer.pause();
                      } else {
                        await audioPlayer.resume();
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Container(
                  height: 35,
                  width: 160,
                  // ignore: sort_child_properties_last
                  child: Center(
                      child: Text(
                    "Tap here to know more",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )),
                  decoration: BoxDecoration(
                    color: HexColor("#E2BEF1"),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5), //color of shadow
                        spreadRadius: 1, //spread radius
                        blurRadius: 5, // blur radius
                        offset:
                            const Offset(1, 1), // changes position of shadow
                        //first paramerter of offset is left-right
                        //second parameter is top to down
                      ),
                      //you can set more BoxShadow() here
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    addConatinerId(widget.id);
                    print(position.abs());
                  },
                  child: Text("Mark as done"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String formatTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes);
  final seconds = twoDigits(duration.inSeconds);

  return [
    if (duration.inHours > 0) hours,
    minutes,
    seconds,
  ].join(":");
}
