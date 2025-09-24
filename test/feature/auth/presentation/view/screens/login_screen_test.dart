// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:provider/provider.dart';
// import 'package:tracking_app/config/di/di.dart';
// import 'package:tracking_app/core/l10n/translations/app_localizations.dart';
// import 'package:tracking_app/core/routes/app_route.dart';
// import 'package:tracking_app/core/routes/routes.dart';
// import 'package:tracking_app/core/theme/app_theme.dart';
// import 'package:tracking_app/feature/auth/presentation/view/screens/login_screen.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:tracking_app/feature/auth/presentation/view_model/login_view_model/login_bloc.dart';
//
// import 'login_screen_test.mocks.dart';
// @GenerateMocks([LoginBloc])
// void main() {
//   late MockLoginBloc mockLoginBloc;
//   setUp((){
//     mockLoginBloc=MockLoginBloc();
//
//   });
//   setUpAll((){
//     getIt.registerFactory<LoginBloc>(()=>mockLoginBloc);
//   });
//
//
//   prepareWidget(){
//     return MaterialApp(
//       localizationsDelegates: AppLocalizations.localizationsDelegates,
//       supportedLocales: AppLocalizations.supportedLocales,
// home: BlocProvider(create: (context)=>mockLoginBloc,
//   child: LoginScreen(),
//
// ),
//     );}
//  testWidgets("Verfiy Structure of login Screen", (WidgetTester tester)async{
// await tester.pumpWidget(prepareWidget());
//    expect(find.byType(AppBar), findsOneWidget);
//  });
// }