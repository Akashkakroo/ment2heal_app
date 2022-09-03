import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmileScreen extends StatefulWidget {
  const SmileScreen({Key? key}) : super(key: key);

  @override
  State<SmileScreen> createState() => _SmileScreenState();
}

class _SmileScreenState extends State<SmileScreen> {
  CountDownController _controller = CountDownController();
  bool _isPause = false;
  @override
  Widget build(BuildContext context) {
    bool isTimerShown = true;
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Smile for 30 seconds",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 25),
              ),
            ),
            Center(
              child: CircularCountDownTimer(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
                duration: 30,
                fillColor: Colors.amber,
                ringColor: Colors.red,
                controller: _controller,
                backgroundColor: Colors.white54,
                strokeWidth: 10.0,
                strokeCap: StrokeCap.round,
                isTimerTextShown: true,
                isReverse: false,
                onComplete: () {},
                textStyle: TextStyle(fontSize: 50.0, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            if (_isPause) {
              _isPause = false;
              _controller.resume();
            } else {
              _isPause = true;
              _controller.pause();
            }
          });
        },
        icon: Icon(_isPause ? Icons.play_arrow : Icons.pause),
        label: Text(_isPause ? 'Resume' : 'Pause'),
      ),
    );
  }
}
