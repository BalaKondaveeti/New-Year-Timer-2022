import 'package:shared_preferences/shared_preferences.dart';

class SingleTon {
  late SharedPreferences value;
  bool loadedSharedPreferences = false;

  factory SingleTon() {
    return sharedPreferences;
  }

  static SingleTon sharedPreferences = SingleTon._();

  SingleTon._() {
    // initalize();
  }

  Future<void> initalize() async {
    value = await SharedPreferences.getInstance();
    if (DateTime.now().isAfter(DateTime(2022))) value.setBool("2022", true);
    loadedSharedPreferences = true;
  }

  setLastNumber(int number) {
    value.setInt("last", number);
  }

  int getLastNumber() {
    return value.getInt("last") ?? 0;
  }

  int getColor() {
    return value.getInt("color") ?? 0;
  }

  setColor(int number) {
    value.setInt("color", number);
  }
}
