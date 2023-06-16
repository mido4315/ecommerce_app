import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  SharedPrefs();

   late  SharedPreferences _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> setData({required String key, required value}) async {
    switch (value.runtimeType) {
      case String:
        await _sharedPreferences.setString(key, value);
        return true;
        break;
      case bool:
        await _sharedPreferences.setBool(key, value);
        return true;
        break;
      case int:
        await _sharedPreferences.setInt(key, value);
        return true;
        break;
      case double:
        await _sharedPreferences.setDouble(key, value);
        return true;
        break;
      case const (List<String>):
        await _sharedPreferences.setStringList(key, value);
        return true;
        break;
    }
    return false;
  }

  dynamic getData({required String key}) {
    return _sharedPreferences.get(key);
  }

  void deleteData({required String key}) {
    _sharedPreferences.remove(key);
  }

  void clearData() {
    _sharedPreferences.clear();
  }
}