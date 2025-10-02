part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}
final class GetDriverInfoEvent extends ProfileEvent{
  DriverInfoEntity driverInfo;
  GetDriverInfoEvent({required this.driverInfo});
}
final class GetDriverContactInfoEvent extends ProfileEvent{
  DriverContactInfoEntity driverContactInfo;
  GetDriverContactInfoEvent({required this.driverContactInfo});
}
final class GetVehicleInfoEvent extends ProfileEvent{
  VehicleInfoEntity vehicleInfo;
  GetVehicleInfoEvent({required this.vehicleInfo});
}
