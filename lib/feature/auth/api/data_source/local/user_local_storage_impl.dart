import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/constants/constants.dart';
import 'package:tracking_app/feature/auth/api/data_source/local/user_local_storage.dart';

 class UserLocalStorageImpl {
   static final FlutterSecureStorage storage = const FlutterSecureStorage();

   static Future<void>saveToken(String token)async{
    await storage.write(key: Constants.token, value: token);
  }

 static Future<String?>getToken()async{
 return  await storage.read(key: Constants.token);
}

 static Future<void>deleteToken()async{
    await storage.delete(key: Constants.token);
  }
  static Future<bool>  isLoggedIn()async{
     return await storage.containsKey(key: Constants.token);
  }
}