import 'package:equatable/equatable.dart';
import 'package:tracking_app/core/utils/request_state/request_state.dart';
import 'package:tracking_app/feature/auth/domain/entity/country_entity.dart';
import 'package:tracking_app/feature/auth/domain/entity/vehicles_entity.dart';

class ApplyStates extends Equatable{
  final RequestState countriesState;
  final List<CountryEntity>countries;
  final String? countryErrorMessage;
  final RequestState vehiclesState;
  final List<VehicleEntity>vehicle;
  final String? vehicleErrorMessage;
 const ApplyStates({
    this.countriesState=RequestState.loading,
   this.countries=const [],
   this.countryErrorMessage,
   this.vehiclesState=RequestState.loading,
   this.vehicle=const [],
   this.vehicleErrorMessage,
});
  ApplyStates copyWith({
     RequestState? countriesState,
     List<CountryEntity>?countries,
     String? countryErrorMessage,
     RequestState? vehiclesState,
     List<VehicleEntity>?vehicle,
     String? vehicleErrorMessage
}){
    return  ApplyStates(
      countryErrorMessage:
      countryErrorMessage??this.countryErrorMessage,
      countries: countries??this.countries,
      countriesState: countriesState??this.countriesState,
      vehiclesState: vehiclesState??this.vehiclesState,
      vehicle: vehicle??this.vehicle,
      vehicleErrorMessage: vehicleErrorMessage??this.vehicleErrorMessage
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    countriesState,countries,countryErrorMessage
  ];

}