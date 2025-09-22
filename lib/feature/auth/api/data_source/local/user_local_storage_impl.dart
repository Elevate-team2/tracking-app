import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/constants/constants.dart';
import 'package:tracking_app/feature/auth/api/data_source/local/user_local_storage.dart';
@Injectable(as: UserLocalStorage)
class UserLocalStorageImpl implements  UserLocalStorage{
  FlutterSecureStorage? storage;
  @override
  Future<void> init() async{

     storage = FlutterSecureStorage();
  }
  Future<void>saveToken(String token)async{
    await storage!.write(key: Constants.token, value: token);
  }
Future<String?>getToken()async{
 return  await storage!.read(key: Constants.token);
}
 Future<void>deleteToken()async{
    await storage!.delete(key: Constants.token);
  }
}