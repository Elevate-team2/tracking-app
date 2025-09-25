import 'package:equatable/equatable.dart';

 abstract class ApplyEvent extends Equatable{


  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class GetAllCountriesEvent extends ApplyEvent{}
class GetAllVehiclesEvent extends ApplyEvent{}