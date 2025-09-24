import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:tracking_app/config/di/di.dart';
import 'package:tracking_app/core/l10n/translations/app_localizations.dart';
import 'package:tracking_app/core/routes/app_route.dart';
import 'package:tracking_app/core/routes/routes.dart';
import 'package:tracking_app/core/theme/app_theme.dart';
import 'package:tracking_app/core/utils/request_state/request_state.dart';
import 'package:tracking_app/feature/auth/api/models/login/request/login_request.dart';
import 'package:tracking_app/feature/auth/presentation/view/screens/login_screen.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/feature/auth/presentation/view/widgets/custom_txt_field.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/login_view_model/login_bloc.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/login_view_model/login_event.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/login_view_model/login_states.dart';

import 'login_screen_test.mocks.dart';

@GenerateMocks([LoginBloc])
void main() {
  late MockLoginBloc mockLoginBloc;

  setUp(() async {
    mockLoginBloc = MockLoginBloc();
    when(mockLoginBloc.state).thenReturn(LoginStates());
    when(
      mockLoginBloc.stream,
    ).thenAnswer((_) => Stream.fromIterable([LoginStates()]));
    getIt.registerFactory<LoginBloc>(() => mockLoginBloc);
  });

  tearDown(() {
    getIt.reset();
    mockLoginBloc.close();
  });

  Widget prepareWidget() {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: AppRoute.loginRoute,
      routes: {
        AppRoute.loginRoute: (context) => BlocProvider(
          create: (context) => mockLoginBloc,
          child: LoginScreen(),
        ),
      },
    );
  }

  testWidgets("Verify Structure of login Screen", (WidgetTester tester) async {
    await tester.pumpWidget(prepareWidget());
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.bySemanticsLabel("E-mail"), findsOneWidget);
    expect(find.bySemanticsLabel("Password"), findsOneWidget);
    expect(find.text("Enter your E-mail"), findsOneWidget);
    expect(find.text("Enter your Password"), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.byType(Checkbox), findsOneWidget);
    expect(find.text("Remember Me"), findsOneWidget);
    expect(find.text('Forget Password'), findsOneWidget);
  });
  testWidgets("validation fails with invalid inputs", (WidgetTester tester)
  async{
    await tester.pumpWidget(prepareWidget());
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(CustomTxtField).first, "invalid_email");
    await tester.enterText(find.byType(CustomTxtField).last, "invvalid");
    await tester.tap(find.byType(ElevatedButton));
verifyNever(mockLoginBloc..add(any));
  });
  testWidgets("validation fails with valid inputs", (WidgetTester tester)async{
    await tester.pumpWidget(prepareWidget());
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(CustomTxtField).first, "mariam@gmail.com");
    await tester.enterText(find.byType(CustomTxtField).last, "Mariam257@");
await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
verify(mockLoginBloc..add(GetLoginEvent(LoginRequest(
  email:  "mariam@gmail.com",
  password: "Mariam257@"
))));
  });

  testWidgets("Verfiy Loading State ", (WidgetTester tester) async {
    await tester.pumpWidget(prepareWidget());


  });
}
