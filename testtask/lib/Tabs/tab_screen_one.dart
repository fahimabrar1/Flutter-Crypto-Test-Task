import 'package:flutter/material.dart';
import 'package:testtask/Others/custom_fontstyle.dart';
import 'package:testtask/Others/timer.dart';

class TabScreenOne extends StatefulWidget {
  final int timeCounter;
  const TabScreenOne({required this.timeCounter, Key? key}) : super(key: key);

  @override
  State<TabScreenOne> createState() => _TabScreenOneState();
}

class _TabScreenOneState extends State<TabScreenOne> {
  MyTimer myTimer = MyTimer();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Timer!!",
                    style: MyCustomFonts.getDmSans(),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    myTimer.intToTimeLeft(widget.timeCounter),
                    style: MyCustomFonts.getDmSans(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
