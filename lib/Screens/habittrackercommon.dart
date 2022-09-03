import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ment2heal/Screens/todalHabit.dart';
import 'package:ment2heal/Screens/tracker.dart';
import 'SelfCareScreen.dart';
import 'addhabit.dart';
import 'allhabits.dart';
import 'chatbot.dart';

class HabitTracker extends StatefulWidget {
  const HabitTracker({Key? key}) : super(key: key);

  @override
  State<HabitTracker> createState() => _HabitTrackerState();
}

class _HabitTrackerState extends State<HabitTracker> {
  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    AddHabit(),
    AllHabits(),
    TodayHabit(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = TodayHabit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        // ignore: sort_child_properties_last
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
        focusColor: Colors.green,
        backgroundColor: Colors.blue,
        elevation: 10,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddHabit(),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    width: 20,
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            TodayHabit(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color:
                              currentTab == 0 ? Colors.grey[800] : Colors.grey,
                        ),
                        Text(
                          'Today',
                          style: TextStyle(
                            color: currentTab == 0
                                ? Colors.grey[800]
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            AllHabits(); // if user taps on this dashboard tab will be active
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.dashboard,
                          color:
                              currentTab == 3 ? Colors.grey[800] : Colors.grey,
                        ),
                        Text(
                          'All Habits',
                          style: TextStyle(
                            color: currentTab == 3
                                ? Colors.grey[800]
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
