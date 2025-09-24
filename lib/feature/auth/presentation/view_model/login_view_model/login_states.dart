import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:tracking_app/core/utils/request_state/request_state.dart';
import 'package:tracking_app/feature/auth/api/models/login/response/login_response.dart';
@immutable
class LoginStates extends Equatable{
final RequestState requestState;
final LoginResponse? loginResponse;
final String? errorMessageLogin;
final bool rememberMe;

const LoginStates({
   this.requestState=RequestState.loading,
   this.loginResponse,
  this.errorMessageLogin,
  this.rememberMe=false
});
LoginStates copyWith({
   RequestState? requestState,
   LoginResponse? loginResponse,
   String? errorMessageLogin,
   bool? rememberMe
}){
  return LoginStates
  (requestState: requestState??this.requestState,
      loginResponse: loginResponse??this.loginResponse,
  errorMessageLogin: errorMessageLogin??this.errorMessageLogin,
    rememberMe:rememberMe??this.rememberMe
  );
}
  @override
  // TODO: implement props
  List<Object?> get props => [
    requestState,rememberMe,errorMessageLogin,loginResponse
  ];

}