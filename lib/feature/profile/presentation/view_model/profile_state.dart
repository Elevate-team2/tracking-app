part of 'profile_bloc.dart';

@immutable
sealed class ProfileState  extends Equatable{}

final class GetDriverInfo extends ProfileState {
  final String?errormsg;
 final bool? isLoading;
  final DriverInfoEntity? driverInfo;


  GetDriverInfo({this.errormsg,
    this.isLoading = false,
    this.driverInfo,

  });

  GetDriverInfo copywith({
    String?errormsg,
    bool? isLoading,
    DriverInfoEntity? driverInfo,

  }) {
    return GetDriverInfo(errormsg: errormsg,
        isLoading: isLoading,
        driverInfo: driverInfo,

    );
  }



  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
final class GetaDriverContactInfo extends ProfileState {
 final String?errormsg;
  final bool? isLoading;

    final DriverContactInfoEntity? driverContactInfo;


  GetaDriverContactInfo({this.errormsg,
    this.isLoading = false,
    this.driverContactInfo,

  }) ;

  GetaDriverContactInfo copywith({
    String?errormsg,
    bool? isLoading,

    DriverContactInfoEntity? driverContactInfo,

  }) {
    return GetaDriverContactInfo(errormsg: errormsg,
      isLoading: isLoading,
     driverContactInfo: driverContactInfo
      // driverContactInfo: driverContactInfo,
      //vehicleInfo: vehicleInfo
    );
  }



  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
final class GetVehicleInfo extends ProfileState {
   final String?errormsg;
 final bool? isLoading;
   final VehicleInfoEntity ? vehicleInfo;

 GetVehicleInfo({this.errormsg,
  this.isLoading = false,
  this.vehicleInfo
});

GetVehicleInfo copywith({
  String?errormsg,
  bool? isLoading,
  VehicleInfoEntity? vehicleInfo,
}) {
  return GetVehicleInfo(errormsg: errormsg,
    isLoading: isLoading,
   vehicleInfo: vehicleInfo
  );
}



@override
// TODO: implement props
List<Object?> get props => throw UnimplementedError();

}





