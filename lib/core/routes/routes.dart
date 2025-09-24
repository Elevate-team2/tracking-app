import 'package:flutter/material.dart';
import 'package:tracking_app/core/extensions/app_localization_extenstion.dart';
import 'package:tracking_app/core/routes/app_route.dart';
import 'package:tracking_app/feature/auth/presentation/view/screens/login_screen.dart';
import 'package:tracking_app/feature/auth/presentation/view/screens/test_screen.dart';


abstract class Routes {
  static Route onGenerate(RouteSettings settings) {
    final url = Uri.parse(settings.name ?? "/");

    switch (url.path) {

case (AppRoute.loginRoute):
  return MaterialPageRoute(builder: (context)=>
  const   LoginScreen());
      case (AppRoute.testRoute):
        return MaterialPageRoute(builder: (context)=>
        const    TestScreen());
      default:
        return MaterialPageRoute(
          builder: (context) {

            return Scaffold(body: Center(child: Text(context.loc.noRouteFound)));
          },
        );
    }
  }
}
