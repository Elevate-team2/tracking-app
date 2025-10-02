import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/config/di/di.dart';
import 'package:tracking_app/core/l10n/translations/app_localizations.dart';
import 'package:tracking_app/core/request_state/request_state.dart';
import 'package:tracking_app/core/responsive/size_provider.dart';
import 'package:tracking_app/core/routes/app_route.dart';
import 'package:tracking_app/feature/auth/domain/entity/vehicles_entity.dart';
import 'package:tracking_app/feature/auth/presentation/view/widgets/custom_btn.dart';
import 'package:tracking_app/feature/auth/presentation/view/widgets/custom_txt_field.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/apply_view_model/apply_bloc.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/apply_view_model/apply_states.dart';
import 'package:tracking_app/feature/profile/presentation/view_model/edit_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:tracking_app/feature/profile/presentation/views/screens/edit_vehicle_info.dart';
import 'package:tracking_app/feature/profile/presentation/views/widgets/load_image.dart';
import 'edit_vehicle_info_test.mocks.dart';

@GenerateMocks([
  EditProfileBloc,
  ApplyBloc,
  ImagePicker,
  Directory,
  ImageProvider,
])
void main() {
  late MockEditProfileBloc mockEditProfileBloc;
  late MockApplyBloc mockApplyBloc;
  setUp(() {
    mockEditProfileBloc = MockEditProfileBloc();
    mockApplyBloc = MockApplyBloc();

    // Setup mock states
    when(mockEditProfileBloc.state).thenReturn(
      const EditProfileState(editProfileRequestState: RequestState.loading),
    );

    when(
      mockEditProfileBloc.stream,
    ).thenAnswer((_) => Stream.fromIterable([const EditProfileState()]));

    when(mockApplyBloc.state).thenReturn(
      const ApplyStates(
        applyState: RequestState.success,
        vehicle: [
          VehicleEntity(
            speed: 8,
            createdAt: "2024-12-25T01:46:23.416Z",
            updatedAt: "2025-09-29T21:43:03.031Z",
            id: '1',
            type: 'Sedan',
            image: 'https://example.com/sedan.png',
          ),
        ],
      ),
    );

    when(
      mockApplyBloc.stream,
    ).thenAnswer((_) => Stream.fromIterable([const ApplyStates()]));

    // Register factories in GetIt - only once per test
    getIt.registerFactory<ApplyBloc>(() => mockApplyBloc);
    getIt.registerFactory<EditProfileBloc>(() => mockEditProfileBloc);
  });

  tearDown(() {
    // Clean up GetIt after each test
    if (getIt.isRegistered<ApplyBloc>()) {
      getIt.unregister<ApplyBloc>();
    }
    if (getIt.isRegistered<EditProfileBloc>()) {
      getIt.unregister<EditProfileBloc>();
    }

    mockApplyBloc.close();
    mockEditProfileBloc.close();
  });
  Widget prepareWidget() {
    return SizeProvider(
      baseSize: const Size(375, 812),
      height: 812,
      width: 375,
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        onGenerateRoute: (settings) {
          if (settings.name == AppRoute.editVehicleScreen) {
            return MaterialPageRoute(builder: (_) => const Scaffold());
          }
          return null;
        },
        home: BlocProvider(
          create: (context) => mockEditProfileBloc,
          child: Builder(
            builder: (context) {
              return const EditVehicleInfo();
            },
          ),
        ),
      ),
    );
  }

  testWidgets("Verfiy Structure", (WidgetTester tester) async {
    final l10n = await AppLocalizations.delegate.load(const Locale('en'));
    await tester.pumpWidget(prepareWidget());
    expect(find.byIcon(Icons.arrow_back_ios_new_outlined), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.bell), findsOneWidget);
    expect(find.text("3"), findsOneWidget);
    expect(find.byType(CustomBtn), findsOneWidget);
    expect(find.text(l10n.update), findsOneWidget);
    expect(find.byType(LoadImage), findsOneWidget);
  });
  testWidgets("select vehicle type from drop down", (
    WidgetTester tester,
  ) async {
    final l10n = await AppLocalizations.delegate.load(const Locale('en'));
    await tester.pumpWidget(prepareWidget());
    await tester.tap(find.text(l10n.vehicleType));
    await tester.pumpAndSettle();
    expect(find.text('Sedan'), findsWidgets);
    await tester.tap(find.text('Sedan').first);
    await tester.pumpAndSettle();
  });
  testWidgets('enters vehicle number in CustomTxtField', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(prepareWidget());

    await tester.enterText(find.byType(CustomTxtField), 'ABC123');
    await tester.pump();

    expect(find.text('ABC123'), findsOneWidget);
  });
  // testWidgets("picks image and updates LoadImage widget", (tester) async {
  //   // Arrange
  //   final mockXFile = XFile("test_resources/fake_image.jpg");
  //
  //   // mock pickImage
  //   when(() => mockImagePicker.pickImage(
  //     source: ImageSource.camera,
  //     imageQuality: 85,
  //   )).thenAnswer((_) async => mockXFile);
  //
  //   await tester.pumpWidget(prepareWidget());
  //
  //   // Act → اضغط على LoadImage
  //   await tester.tap(find.byType(GestureDetector)); // حسب اللي لافف LoadImage
  //   await tester.pumpAndSettle();
  //
  //   // Assert
  //   final state = tester.state(find.byType(EditVehicleInfo)) as dynamic;
  //   expect(state.vehicleLicense, isA<File>());
  //   expect(state.vehicleLicense!.path, contains("jpg"));
  // });
  testWidgets('should show success snackbar when update is successful', (
    WidgetTester tester,
  ) async {
    final l10n = await AppLocalizations.delegate.load(const Locale('en'));

    // Arrange
    when(mockEditProfileBloc.state).thenReturn(
      const EditProfileState(editProfileRequestState: RequestState.success),
    );
    when(mockEditProfileBloc.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const EditProfileState(editProfileRequestState: RequestState.success),
      ]),
    );

    // Act
    await tester.pumpWidget(prepareWidget());
    await tester.pumpAndSettle();

    // Assert
    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text(l10n.updateVehicleInformation), findsOneWidget);
  });
  testWidgets("Show Snack Error ", (WidgetTester tester) async {
    when(mockEditProfileBloc.state).thenReturn(
      const EditProfileState(
        editProfileRequestState: RequestState.error,
        editProfileErrorMessage: "failed to update vehicle info",
      ),
    );
    when(mockEditProfileBloc.stream).thenAnswer(
      (_) => Stream.fromIterable([
        const EditProfileState(
          editProfileRequestState: RequestState.error,
          editProfileErrorMessage: "failed to update vehicle info",
        ),
      ]),
    );
    await tester.pumpWidget(prepareWidget());
    await tester.pumpAndSettle();
    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text("failed to update vehicle info"), findsWidgets);
  });
}
