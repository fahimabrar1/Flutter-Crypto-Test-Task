import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:testtask/Others/timer.dart';
import 'package:testtask/Tabs/tab_screen_one.dart';
import 'package:testtask/Tabs/tab_screen_three.dart';
import 'package:testtask/Tabs/tab_screen_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test run',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'test run'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  late int _selectedTabIndex;
  late bool _timerPlayed;
  late int counter;

  /// declare a timer
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _selectedTabIndex = 0;

    counter = 0;
    _timerPlayed = false;
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          controller: _tabController,
          onTap: onItemTapped,
          tabs: const <Widget>[
            Tab(
              text: "Tab A",
            ),
            Tab(
              text: "Tab B",
            ),
            Tab(
              text: "Tab C",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          TabScreenOne(
            timeCounter: counter,
          ),
          const TabScreenTwo(),
          const TabScreenThree(),
        ],
      ),
      floatingActionButton: _selectedTabIndex == 0
          ? (!_timerPlayed)
              ? FloatingActionButton(
                  onPressed: startTimer,
                  child: const Icon(Icons.play_arrow_rounded),
                  backgroundColor: Colors.lightGreen,
                )
              : FloatingActionButton(
                  onPressed: stopTimer,
                  child: const Icon(Icons.stop),
                  backgroundColor: Colors.red,
                )
          : null,
    );
  }

  void startTimer() {
    toggleButton();

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        /// callback will be executed every 1 second, increament a count value
        /// on each callback
        setState(() {
          counter++;
        });
      },
    );
  }

  void stopTimer() {
    timer.cancel();
    setState(() {
      var str = MyTimer().intToTimeLeft(counter).split(":");

      counter = 0;
      log("Minutes: " + str.first + "   Seconds: " + str.last);
    });
    toggleButton();
  }

  void onItemTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  void toggleButton() {
    if (!_timerPlayed) {
      setState(() {
        _timerPlayed = true;
      });
    } else {
      setState(() {
        _timerPlayed = false;
      });
    }
  }
}
