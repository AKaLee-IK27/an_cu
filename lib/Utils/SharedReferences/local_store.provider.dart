import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:shared_preferences/shared_preferences.dart";

import "references_repository.dart";

const String appName = "AnCuConnect";

/// Provides implementation of [PreferencesRepository] using Shared Preferences
class LocalStorage implements PreferencesRepository {
  /// Singleton instance of [LocalStorage]
  factory LocalStorage() => _localStorage;

  LocalStorage._internal();
  static final LocalStorage _localStorage = LocalStorage._internal();

  Future<SharedPreferences> _getSharedPreference() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<bool?> getBool(String key) async {
    final SharedPreferences sharedPreferences = await _getSharedPreference();
    return sharedPreferences.getBool(key + appName);
  }

  @override
  Future<bool> setBool(String key, bool value) async {
    final SharedPreferences sharedPreferences = await _getSharedPreference();
    return await sharedPreferences.setBool(key + appName, value);
  }

  @override
  Future<bool> setString(String key, String value) async {
    final SharedPreferences sharedPreferences = await _getSharedPreference();
    return await sharedPreferences.setString(key + appName, value);
  }

  @override
  Future<String?> getString(String key) async {
    final SharedPreferences sharedPreferences = await _getSharedPreference();
    return sharedPreferences.getString(key + appName);
  }

  @override
  Future<void> resetAll() async {
    final SharedPreferences sharedPreferences = await _getSharedPreference();
    await sharedPreferences.clear();
  }

  @override
  Future<Map<String, String>> readAll() async {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteKey(String key) async {
    final SharedPreferences sharedPreferences = await _getSharedPreference();
    await sharedPreferences.remove(key + appName);
  }
}

/// Provides implementation of [PreferencesRepository] using Shared Preferences
final Provider<LocalStorage> localStoreProvider =
    Provider<LocalStorage>((Ref<LocalStorage> ref) {
  return LocalStorage();
});
