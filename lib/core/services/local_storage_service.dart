import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  final SharedPreferences prefs;

  LocalStorageService(this.prefs);

  Future<bool> saveAny(String key, dynamic data) async {
    try {
      if (data.runtimeType == bool) {
        prefs.setBool(key, data);
      }

      if (data.runtimeType == double) {
        prefs.setDouble(key, data);
      }

      if (data.runtimeType == int) {
        prefs.setInt(key, data);
      }

      if (data.runtimeType == String) {
        prefs.setString(key, data);
      }

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<dynamic> getAny(String key) async {
    return prefs.get(key);
  }

  Future<bool> saveList(String key, List data) async {
    final encodedListToJsonString = jsonEncode(data);

    return prefs.setString(key, encodedListToJsonString);
  }

  Future<List> getList(String key) async {
    final decodedJsonToList = jsonDecode(prefs.getString('')!);
    return decodedJsonToList;
  }

  Future<bool> deleteKey(String key) async {
    return prefs.remove(key);
  }

  Future<bool> flushAll() async {
    return prefs.clear();
  }
}
