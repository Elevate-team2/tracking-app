import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:tracking_app/feature/auth/api/client/auth_api_services.dart';
import 'package:tracking_app/feature/auth/api/data_source/remote/auth_remote_data_source_impl.dart';

import 'auth_remote_data_source_impl_test.mocks.dart';
@GenerateMocks([AuthApiServices])
void main() {
late MockAuthApiServices mockAuthApiServices;
late AuthRemoteDataSourceImpl authRemoteDataSourceImpl;
setUp((){
  mockAuthApiServices=MockAuthApiServices();
  authRemoteDataSourceImpl=AuthRemoteDataSourceImpl();
});
group("Auth RemoteDataSource", (){});
}