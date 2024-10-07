import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocaleStorage {
  static late final FlutterSecureStorage _storage;
  static void init() {
    _storage = const FlutterSecureStorage();
  }

  static Future<String?> get(String key) async {
    return await _storage.read(key: key);
  }

  static Future<void> set(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  static Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  static Future<bool> has(String key) async {
    return await _storage.containsKey(key: key);
  }

  static Future<void> clear() async {
    await _storage.deleteAll();
  }
}
