part of 'forget_password_bloc.dart';

@immutable
sealed class ForgetPasswordEvent {}

class SupmitEmailEvent extends ForgetPasswordEvent{
  final String email;
   SupmitEmailEvent(this.email);

}