// import 'package:shared_preferences/shared_preferences.dart';

// class CachHelper {
//   static late SharedPreferences sharedPreferences;

//   static init() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//   }

//   static Future<bool> saveData({
//     required dynamic value,
//     required String key,
//   }) async {
//     if (value is String) {
//       return await sharedPreferences.setString(key, value);
//     }
//     if (value is int) {
//       return await sharedPreferences.setInt(key, value);
//     }
//     if (value is bool) {
//       return await sharedPreferences.setBool(key, value);
//     }
//     return await sharedPreferences.setDouble(key, value);
//   }

//   static dynamic getData({
//     required String key,
//   }) {
//     return sharedPreferences.get(key);
//   }

//   static dynamic removeData({
//     required String key,
//   }) {
//     return sharedPreferences.remove(key);
//   }
// }
import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({
    required dynamic value,
    required String key,
  }) async {
    bool result;
    if (value is String) {
      result = await sharedPreferences.setString(key, value);
    } else if (value is int) {
      result = await sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      result = await sharedPreferences.setBool(key, value);
    } else if (value is double) {
      result = await sharedPreferences.setDouble(key, value);
    } else {
      throw Exception("Unsupported data type");
    }

    print('Data set: Key = $key, Value = $value');
    return result;
  }

  static dynamic getData({
    required String key,
  }) {
    final value = sharedPreferences.get(key);
    print('Data retrieved: Key = $key, Value = $value');
    return value;
  }

  static Future<bool> removeData({
    required String key,
  }) async {
    final result = await sharedPreferences.remove(key);
    print('Data removed: Key = $key');
    return result;
  }
}
