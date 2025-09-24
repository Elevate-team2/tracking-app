import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tracking_app/core/constants/constants.dart';

 class UserLocalStorageImpl {
   static  FlutterSecureStorage storage = const FlutterSecureStorage();

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