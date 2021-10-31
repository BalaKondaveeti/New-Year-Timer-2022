import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newyeartimer2022/data/colorprovider.dart';
import 'package:newyeartimer2022/newyearpage.dart';
import 'package:provider/provider.dart';

class CountDownWidget extends StatefulWidget {
  const CountDownWidget({Key? key}) : super(key: key);

  @override
  _CountDownWidgetState createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  int daysUntil2022 = DateTime.now().difference(DateTime(2022)).inDays;
  int hoursUntil2022 = DateTime.now().hour - 23;
  int minutesUntil2022 = DateTime.now().minute - 59;
  int secondsUntil2022 = DateTime.now().second - 59;
  late Timer timer;
  @override
  void initState() {
    timer = Timer.periodic(Duration(milliseconds: 20), (timer) {
      var difference = DateTime.now().difference(DateTime(2022));
      daysUntil2022 = difference.inDays;
      hoursUntil2022 = DateTime.now().hour - 23;
      minutesUntil2022 = DateTime.now().minute - 59;
      secondsUntil2022 = DateTime.now().second - 59;
      if (daysUntil2022 == 0 &&
          hoursUntil2022 == 0 &&
          minutesUntil2022 == 0 &&
          secondsUntil2022 != 0)
        Provider.of<ColorProvider>(context,listen: false).eveSecondsOfYear();
      if (daysUntil2022 == 0 &&
          hoursUntil2022 == 0 &&
          minutesUntil2022 == 0 &&
          secondsUntil2022 == 0) {
        Provider.of<ColorProvider>(context,listen: false).isNewYear();
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => NewYearPage()));
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    this.timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Row(
        children: [
          Expanded(
              child: FittedBox(
            child: (daysUntil2022 != 0)
                ? NameTimeWidget("Days", daysUntil2022)
                : (hoursUntil2022 != 0)
                    ? NameTimeWidget("Hours", hoursUntil2022)
                    : (minutesUntil2022 != 0)
                        ? NameTimeWidget("Minutes", minutesUntil2022)
                        : NameTimeWidget(
                            "Seconds",
                            secondsUntil2022,
                          ),
          )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (daysUntil2022 != 0) NameTimeWidget("Hours", hoursUntil2022),
              if (daysUntil2022 != 0 && hoursUntil2022 != 0)
                NameTimeWidget("Minute", minutesUntil2022),
              if (minutesUntil2022 != 0)
                NameTimeWidget("Seconds", secondsUntil2022),
            ],
          ),
        ],
      ),
    );
  }
}

class NameTimeWidget extends StatelessWidget {
  final String name;
  final int number;
  const NameTimeWidget(this.name, this.number, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Provider.of<ColorProvider>(context).getColor;
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            number.abs().toString(),
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 50, color: color),
          ),
          SizedBox(
            width: 10,
          ),
          FittedBox(
            child: Text(
              name,
              style: TextStyle(fontSize: 20, color: color),
            ),
          ),
        ],
      ),
    );
  }
}
