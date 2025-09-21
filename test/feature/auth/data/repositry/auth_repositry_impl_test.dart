import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/feature/auth/api/data_source/remote/auth_remote_data_source_impl.dart';
import 'package:tracking_app/feature/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:tracking_app/feature/auth/data/repositry/auth_repositry_impl.dart';

import 'auth_repositry_impl_test.mocks.dart';
@GenerateMocks([AuthRemoteDataSource])
void main() {
 late MockAuthRemoteDataSource mockAuthRemoteDataSource;
 late AuthRepositryImpl authRepositoryImp;
 setUp((){
  mockAuthRemoteDataSource=MockAuthRemoteDataSource();
  authRepositoryImp=AuthRepositryImpl();
 });

 group("Auth Repositry",(){});
}

