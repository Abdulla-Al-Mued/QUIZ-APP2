
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{
  static Future<void> saveIntData(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value??0);
  }

  static Future<int?> getIntData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? value = prefs.getInt(key);
    return value;
  }

}