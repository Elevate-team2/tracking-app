import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class ShareprefrenceModel {
  
@preResolve
  Future<SharedPreferences> getSharedPresfrence() async {
    return await SharedPreferences.getInstance();
  }
}
