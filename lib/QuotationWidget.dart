import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newyeartimer2022/data/colorprovider.dart';
import 'package:provider/provider.dart';

import 'data/Quotations.dart';
import 'data/SingleTon.dart';

class QuotationWidget extends StatefulWidget {
  const QuotationWidget({Key? key}) : super(key: key);

  @override
  _QuotationWidgetState createState() => _QuotationWidgetState();
}

class _QuotationWidgetState extends State<QuotationWidget> {
  int index = SingleTon().getLastNumber();
  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 20), (timer) {
      index++;
      if (index == 37+4) index = 0;
      SingleTon().setLastNumber(index);
      if (mounted) setState(() {});
    });
    super.initState();
  }

  List lastIndex = [0, 1];

  @override
  void dispose() {
    this.timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(Provider.of<ColorProvider>(context).iseveSecondsOfYear) return Container();
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      alignment: Alignment.center,
      width: double.infinity,
      padding: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                Quotations.quotations[index],
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    letterSpacing: 0.8,
                    fontFamily: "Satisfy"),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(8),
            child: Text(
              (Quotations.quotationauthor[index] ?? "Anonymous").toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1),
            ),
          ),
        ],
      ),
    );
  }
}
