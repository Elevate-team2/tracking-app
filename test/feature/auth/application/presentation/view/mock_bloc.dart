import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tracking_app/feature/auth/presentation/bloc/apply_bloc.dart';
import 'package:tracking_app/feature/auth/presentation/bloc/apply_event.dart';
import 'package:tracking_app/feature/auth/presentation/bloc/apply_state.dart';

class MockApplyDriverBloc
    extends MockBloc<ApplyDriverEvent, ApplyDriverState>
    implements ApplyDriverBloc {}

class FakeApplyDriverEvent extends Fake implements ApplyDriverEvent {}

class FakeApplyDriverState extends Fake implements ApplyDriverState {}
