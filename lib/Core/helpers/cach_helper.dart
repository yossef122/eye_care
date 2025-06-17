// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class CachHelper {
//   static SharedPreferences? _sharedPreferences;
//   static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

//   /// Initialize both SharedPreferences and secure storage
//   static Future<void> init() async {
//     try {
//       _sharedPreferences = await SharedPreferences.getInstance();
//       debugPrint('CachHelper: SharedPreferences initialized successfully');
//     } catch (e) {
//       debugPrint('CachHelper: Error initializing SharedPreferences: $e');
//       rethrow;
//     }
//   }

//   /// Save data to SharedPreferences with type safety
//   static Future<bool> saveData({
//     required String key,
//     required dynamic value,
//   }) async {
//     try {
//       await _ensureInitialized();

//       if (value is String) {
//         return await _sharedPreferences!.setString(key, value);
//       } else if (value is int) {
//         return await _sharedPreferences!.setInt(key, value);
//       } else if (value is bool) {
//         return await _sharedPreferences!.setBool(key, value);
//       } else if (value is double) {
//         return await _sharedPreferences!.setDouble(key, value);
//       } else if (value == null) {
//         return await _sharedPreferences!.remove(key);
//       } else {
//         throw ArgumentError('Unsupported data type: ${value.runtimeType}');
//       }
//     } catch (e) {
//       debugPrint('CachHelper: Error saving data for key $key: $e');
//       rethrow;
//     }
//   }

//   /// Get data from SharedPreferences
//   static dynamic getData({required String key}) {
//     try {
//       _ensureInitialized();
//       return _sharedPreferences!.get(key);
//     } catch (e) {
//       debugPrint('CachHelper: Error getting data for key $key: $e');
//       return null;
//     }
//   }

//   /// Remove data from SharedPreferences
//   static Future<bool> removeData({required String key}) async {
//     try {
//       await _ensureInitialized();
//       return await _sharedPreferences!.remove(key);
//     } catch (e) {
//       debugPrint('CachHelper: Error removing data for key $key: $e');
//       return false;
//     }
//   }

//   /// Clear all data from SharedPreferences
//   static Future<bool> clearAll() async {
//     try {
//       await _ensureInitialized();
//       return await _sharedPreferences!.clear();
//     } catch (e) {
//       debugPrint('CachHelper: Error clearing all data: $e');
//       return false;
//     }
//   }

//   /// Secure Storage Methods
//   static Future<void> setSecuredString({
//     required String key,
//     required String value,
//   }) async {
//     try {
//       debugPrint('SecureStorage: Saving key: $key');
//       await _secureStorage.write(key: key, value: value);
//     } catch (e) {
//       debugPrint('SecureStorage: Error saving key $key: $e');
//       rethrow;
//     }
//   }

//   static Future<String?> getSecuredString(String userToken, {required String key}) async {
//     try {
//       debugPrint('SecureStorage: Reading key: $key');
//       return await _secureStorage.read(key: key);
//     } catch (e) {
//       debugPrint('SecureStorage: Error reading key $key: $e');
//       return null;
//     }
//   }

//   static Future<void> clearAllSecuredData() async {
//     try {
//       debugPrint('SecureStorage: Clearing all data');
//       await _secureStorage.deleteAll();
//     } catch (e) {
//       debugPrint('SecureStorage: Error clearing all data: $e');
//       rethrow;
//     }
//   }

//   /// Helper method to ensure initialization
//   static Future<void> _ensureInitialized() async {
//     if (_sharedPreferences == null) {
//       await init();
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  static SharedPreferences? _sharedPreferences;
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  /// Initialize both SharedPreferences and secure storage
  static Future<void> init() async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      debugPrint('CachHelper: SharedPreferences initialized successfully');
    } catch (e) {
      debugPrint('CachHelper: Error initializing SharedPreferences: $e');
      rethrow;
    }
  }

  /// Save data to SharedPreferences with type safety
  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    try {
      await _ensureInitialized();

      if (value is String) {
        return await _sharedPreferences!.setString(key, value);
      } else if (value is int) {
        return await _sharedPreferences!.setInt(key, value);
      } else if (value is bool) {
        return await _sharedPreferences!.setBool(key, value);
      } else if (value is double) {
        return await _sharedPreferences!.setDouble(key, value);
      } else if (value == null) {
        return await _sharedPreferences!.remove(key);
      } else {
        throw ArgumentError('Unsupported data type: ${value.runtimeType}');
      }
    } catch (e) {
      debugPrint('CachHelper: Error saving data for key $key: $e');
      rethrow;
    }
  }

  /// Get data from SharedPreferences
  static dynamic getData({required String key}) {
    try {
      _ensureInitialized();
      return _sharedPreferences!.get(key);
    } catch (e) {
      debugPrint('CachHelper: Error getting data for key $key: $e');
      return null;
    }
  }

  /// Remove data from SharedPreferences
  static Future<bool> removeData({required String key}) async {
    try {
      await _ensureInitialized();
      return await _sharedPreferences!.remove(key);
    } catch (e) {
      debugPrint('CachHelper: Error removing data for key $key: $e');
      return false;
    }
  }

  /// Clear all data from SharedPreferences
  static Future<bool> clearAll() async {
    try {
      await _ensureInitialized();
      return await _sharedPreferences!.clear();
    } catch (e) {
      debugPrint('CachHelper: Error clearing all data: $e');
      return false;
    }
  }

  /// Secure Storage Methods
  static Future<void> setSecuredString({
    required String key,
    required String value,
  }) async {
    try {
      debugPrint('SecureStorage: Saving key: $key');
      await _secureStorage.write(key: key, value: value);
    } catch (e) {
      debugPrint('SecureStorage: Error saving key $key: $e');
      rethrow;
    }
  }

  static Future<String?> getSecuredString({required String key}) async {
    try {
      debugPrint('SecureStorage: Reading key: $key');
      return await _secureStorage.read(key: key);
    } catch (e) {
      debugPrint('SecureStorage: Error reading key $key: $e');
      return null;
    }
  }

  static Future<void> clearAllSecuredData() async {
    try {
      debugPrint('SecureStorage: Clearing all data');
      await _secureStorage.deleteAll();
    } catch (e) {
      debugPrint('SecureStorage: Error clearing all data: $e');
      rethrow;
    }
  }

  /// Helper method to ensure initialization
  static Future<void> _ensureInitialized() async {
    if (_sharedPreferences == null) {
      await init();
    }
  }
}
