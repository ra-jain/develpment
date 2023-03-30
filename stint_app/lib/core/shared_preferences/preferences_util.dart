import 'package:shared_preferences/shared_preferences.dart';

// Is a class that contains all the methods to access local storage by keys
class Preferences {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static void dispose() {
    _prefs = null;
  }

  static bool containsKey(String key) {
    return _prefs!.containsKey(key);
  }

  static int getInt(String key, int value) {
    return _prefs!.getInt(key) ?? value;
  }

  static Future<bool> setInt(String key, int value) async {
    bool success = await _prefs!.setInt(key, value);
    return success;
  }

  static String getString(String key, String? value) {
    return _prefs!.getString(key) ?? value ?? "";
  }

  static Future<bool> setString(String key, String value) async {
    bool success = await _prefs!.setString(key, value);
    return success;
  }

  static List<String> getStringList(String key, List<String>? value) {
    return _prefs!.getStringList(key) ?? value ?? [];
  }

  static Future<bool> setStringList(String key, List<String>? value) {
    return _prefs!.setStringList(key, value!);
  }

  static bool getBool(String key, bool value) {
    return _prefs!.getBool(key) ?? value;
  }

  static Future<bool> setBool(String key, bool value) {
    return _prefs!.setBool(key, value);
  }

  static double getDouble(String key, double value) {
    return _prefs!.getDouble(key) ?? value;
  }

  static Future<bool> setDouble(String key, double value) {
    return _prefs!.setDouble(key, value);
  }

  static Future<bool> remove(String key) async {
    return _prefs!.remove(key);
  }

  static Future<bool> clear() {
    return _prefs!.clear();
  }
}
