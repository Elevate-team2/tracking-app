import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:tracking_app/feature/auth/api/models/request/apply_request.dart';

 abstract class ApplyEvent extends Equatable{


  @override
  List<Object?> get props => throw UnimplementedError();
}
class GetAllCountriesEvent extends ApplyEvent{}
class GetAllVehiclesEvent extends ApplyEvent{}
class GetApplyEvent extends ApplyEvent{
  final ApplyRequest request;
  final File nid;
final  File vehiclesLicense;
  GetApplyEvent(this.request,this.nid,this.vehiclesLicense);
  @override
  List<Object?> get props => [request,nid,vehiclesLicense];
}