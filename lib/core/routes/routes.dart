import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/config/di/di.dart';
import 'package:tracking_app/core/extensions/app_localization_extenstion.dart';
import 'package:tracking_app/core/routes/app_route.dart';
import 'package:tracking_app/feature/auth/presentation/view/screens/forget_password_screen.dart';
import 'package:tracking_app/feature/auth/presentation/view/screens/verify_reset_code_screen.dart';
import 'package:tracking_app/feature/auth/presentation/view_model/forget_password_view_model/forget_password_bloc.dart';


abstract class Routes {
  static Route onGenerate(RouteSettings settings) {
    final url = Uri.parse(settings.name ?? "/");

    switch (url.path) {
      case AppRoute.forgetPasswordScreen:
       return MaterialPageRoute(builder: (context) => ForgetPasswordScreen());

      case AppRoute.verifyCodeScreen:
        final email = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => VerifyResetCodeScreen(email: email),
        );



      default:
        return MaterialPageRoute(
          builder: (context) {

            return Scaffold(body: Center(child: Text(context.loc.noRouteFound)));
          },
        );
    }
  }
}
