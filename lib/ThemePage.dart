import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/colorprovider.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color selectedColor = Provider.of<ColorProvider>(context).getColor;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: selectedColor),
          title: Text(
            "Select Theme Color",
            style: TextStyle(
              color: selectedColor,
            ),
          ),
        ),
        body: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: [
            Colors.black,
            Colors.red[800],
            Colors.blue[800],
            Colors.pink[800],
            Colors.green[800],
            Colors.yellow[800]
          ].map((color) {
            return InkWell(
              onTap: () {
                Provider.of<ColorProvider>(context, listen: false).setColor =
                    color as Color;
              },
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(30),
                height: 100,
                width: 100,
                color: color,
                child: (selectedColor == color)
                    ? FittedBox(
                        child: Icon(Icons.done, color: Colors.white, size: 50))
                    : Container(),
              ),
            );
          }).toList(),
        ));
  }
}
