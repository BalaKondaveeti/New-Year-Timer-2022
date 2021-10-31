import 'package:flutter/material.dart';
import 'package:newyeartimer2022/data/SingleTon.dart';
import 'package:newyeartimer2022/data/colorprovider.dart';
import 'package:newyeartimer2022/newyearpage.dart';
import 'package:provider/provider.dart';

import 'CountDownWidget.dart';
import 'QuotationWidget.dart';
import 'ThemePage.dart';

void main(List<String> args) {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SingleTon().initalize(),
      builder: (context, snapShot) => (snapShot.connectionState ==
              ConnectionState.waiting)
          ? Center(
              child: CircularProgressIndicator(
              color: Colors.black,
            ))
          : ChangeNotifierProvider<ColorProvider>(
              create: (_) => ColorProvider(SingleTon().getColor()),
              child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                      appBarTheme:
                          AppBarTheme(color: Colors.transparent, elevation: 0)),
                  home: (SingleTon().value.getBool("2022") ?? false)
                      ? NewYearPage()
                      : HomeScreen()),
            ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var localProviderValue = Provider.of<ColorProvider>(context);
    return Scaffold(
      backgroundColor: localProviderValue.getColor,
      body: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuotationWidget(),
            Expanded(child: CountDownWidget()),
          ],
        ),
        Positioned(
          top: 5,
          right: 5,
          child: SafeArea(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ThemeSelector()));
              },
              icon: Icon(Icons.format_paint),
              color: Colors.white,
            ),
          ),
        ),
      ]),
    );
  }
}
