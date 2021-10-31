import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newyeartimer2022/data/SingleTon.dart';

class ColorProvider with ChangeNotifier {
  bool iseveSecondsOfYear = false;
  ColorProvider(int colorNumber) {
    this._selectedColor = numberToColor(colorNumber);
  }

  late Color _selectedColor;

  Color numberToColor(int colorNumber) {
    if (colorNumber == 0)
      return Colors.black;
    else if (colorNumber == 1)
      return Colors.red[800] as Color;
    else if (colorNumber == 2)
      return Colors.blue[800] as Color;
    else if (colorNumber == 3)
      return Colors.pink[800] as Color;
    else if (colorNumber == 4)
      return Colors.green[800] as Color;
    else if (colorNumber == 5)
      return Colors.yellow[800] as Color;
    else if (colorNumber == 6) return Colors.orange[800] as Color;
    return Colors.black;
  }

  Color get getColor {
    return _selectedColor;
  }

  set setColor(Color color) {
    _selectedColor = color;
    notifyListeners();
    print("Coming here");
    for (int i = 0; i < 7; ++i) {
      if (numberToColor(i) == color) {
        SingleTon().setColor(i);
        print("Coming here 2");
        break;
      }
      print("Coming here 3");
    }
  }

  eveSecondsOfYear() {
    iseveSecondsOfYear = true;
    notifyListeners();
  }

  isNewYear() {
    SingleTon().value.setBool("2022", true);
  }
}
