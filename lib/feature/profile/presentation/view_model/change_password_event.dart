// lib/feature/profile/presentation/bloc/change_password_event.dart
import 'package:equatable/equatable.dart';
import 'package:tracking_app/feature/profile/api/models/change_password_request.dart';

abstract class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();

  @override
  List<Object?> get props => [];
}

class SubmitChangePasswordEvent extends ChangePasswordEvent {
  final ChangePasswordRequest request;

  const SubmitChangePasswordEvent(this.request);

  @override
  List<Object?> get props => [request];
}
