import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  final storage = const FlutterSecureStorage();

  Future<void> writeData(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<String?>? readData(String key) async {
    return await storage.read(key: key);
  }

  Future<void> deleteData(String key) async {
    await storage.delete(key: key);
  }

  Future<void> deleteAllData() async {
    await storage.deleteAll();
  }
}
