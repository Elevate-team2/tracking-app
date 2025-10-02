import 'package:flutter/material.dart';
import 'package:tracking_app/core/extensions/app_localization_extenstion.dart';
import 'package:tracking_app/core/routes/app_route.dart';
import 'package:tracking_app/feature/auth/presentation/view/screens/login_screen.dart';
import 'package:tracking_app/feature/auth/presentation/view/screens/forget_password_screen.dart';
import 'package:tracking_app/feature/auth/presentation/view/screens/reset_password_screen.dart';
import 'package:tracking_app/feature/auth/presentation/view/screens/verify_reset_code_screen.dart';
import 'package:tracking_app/feature/auth/presentation/view/screens/approve_screen.dart';
import 'package:tracking_app/feature/home/presentaion/view/page/app_section.dart';
import 'package:tracking_app/feature/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:tracking_app/feature/auth/presentation/view/screens/register_screen.dart';
import 'package:tracking_app/feature/profile/domain/entity/logged_in_user_entity.dart';
import 'package:tracking_app/feature/profile/presentation/views/screens/edit_profile_screen.dart';


abstract class Routes {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Route onGenerate(RouteSettings settings) {
    final url = Uri.parse(settings.name ??   '/');

    switch (url.path) {

      case AppRoute.home:
        return MaterialPageRoute(
          builder: (context) {

            return const  AppSection();
          },
        );


      case (AppRoute.loginRoute):
        return MaterialPageRoute(builder: (context)=>
        const   LoginScreen());

      case (AppRoute.onBoarding):
        return MaterialPageRoute(builder: (context)=>
        const    OnBoarddingScreen());


      case AppRoute.forgetPasswordScreen:
        return MaterialPageRoute(builder: (context) => const ForgetPasswordScreen());

      case AppRoute.verifyCodeScreen:
        final email = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => VerifyResetCodeScreen(email: email),
        );

      case AppRoute.resetPasswordScreen:
        final email = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => ResetPasswordScreen(email: email),
        );

      case AppRoute.approveScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const  ApproveScreen();
          },
        );

      case (AppRoute.applyScreen):
        return MaterialPageRoute(
          builder: (context) {

            return const ApplyScreen();
          },
        );

      case AppRoute.editProfileScreen:
        return MaterialPageRoute(builder: (context) {
          // final user = settings.arguments as LoggedInUserEntity;
          return const EditProfileScreen(user:
          LoggedInUserEntity(
            id: "1",
            firstName: "Rana",
            lastName: "Gebril",
            email: "ranagebril5@gmail.com",
            phone: "01147124052",
            photo: "",
            role: "driver",
            country: "Egypt",
            vehicleType: "Car",
            vehicleNumber: "152004",
            vehicleLicense: "",
            nid: "12345678912345",
            nidImg: "",
            gender: "female",
            createdAt: "DateTime.now()",
          )
            ,);
        },);

      default:
        return MaterialPageRoute(
          builder: (context) {

            return Scaffold(body: Center(child: Text(context.loc.noRouteFound)));
          },
        );
    }
  }
}
