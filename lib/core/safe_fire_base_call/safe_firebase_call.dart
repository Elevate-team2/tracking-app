
import 'package:tracking_app/core/api_result/result.dart';
import 'package:tracking_app/core/firebase_error/firebase_error.dart';


Future<Result<T>>safeFirebaseCall<T>(Future<T> Function() request)async{
  try{
    final response=await request();
    return SucessResult(response);
  }on Exception catch(error){
    return FailedResult(FirebaseErrorHandler.handle(error).errorMessage);
  }catch(error){
    return FailedResult(error.toString());
  }
}

