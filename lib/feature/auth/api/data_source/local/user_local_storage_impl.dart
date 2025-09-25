import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tracking_app/core/constants/constants.dart';

class UserLocalStorageImpl {
  final FlutterSecureStorage storage;

  UserLocalStorageImpl({FlutterSecureStorage? storage})
      : storage = storage ?? const FlutterSecureStorage();

  Future<void> saveToken(String token) async {
    try {
      await storage.write(key: Constants.token, value: token);
    } catch (e) {
      throw Exception('Failed to save token: $e');
    }
  }

  Future<String?> getToken() async {
    try {
      return await storage.read(key: Constants.token);
    } catch (e) {
      throw Exception('Failed to get token: $e');
    }
  }

  Future<void> deleteToken() async {
    try {
      await storage.delete(key: Constants.token);
    } catch (e) {
      throw Exception('Failed to delete token: $e');
    }
  }

  Future<bool> isLoggedIn() async {
    try {
      return await storage.containsKey(key: Constants.token);
    } catch (e) {
      throw Exception('Failed to check login status: $e');
    }
  }
}