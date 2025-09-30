import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tracking_app/core/constants/constants.dart';
import 'package:tracking_app/core/extensions/app_localization_extenstion.dart';
import 'package:tracking_app/core/responsive/size_helper_extension.dart';
import 'package:tracking_app/core/routes/app_route.dart';
import 'package:tracking_app/core/theme/font_manger.dart';
import 'package:tracking_app/core/theme/font_style_manger.dart';
import '../../../../core/theme/app_colors.dart';

class OnBoarddingScreen extends StatefulWidget {
  const OnBoarddingScreen({super.key});

  @override
  State<OnBoarddingScreen> createState() => _OnBoarddingScreenState();
}

class _OnBoarddingScreenState extends State<OnBoarddingScreen> {
  PackageInfo _packageInfo = PackageInfo(
    appName: Constants.unknown,
    packageName: Constants.unknown,
    version: Constants.zeroVersion,
    buildNumber: Constants.unknown,
    buildSignature: Constants.unknown,
    installerStore: Constants.unknown,
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(context.setWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                key: const Key(Constants.imageKey1),
                Constants.onboardingphoto,
                fit: BoxFit.fill,
                height: context.setHight(350),
                width: context.setWidth(349),
              ),
              SizedBox(height: context.setHight(20)),
              Text(
              context.loc.welcomText,
                textAlign: TextAlign.start,
                style: getBoldStyle(
                  color: AppColors.black,
                  fontSize: context.setSp(FontSize.s22),
                ),
              ),
              SizedBox(height: context.setHight(30)),

                ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    padding:const EdgeInsets.symmetric(
                      vertical: 16
                    ),
                    
                    textStyle: getMediumStyle(
                      color: AppColors.white,
                      fontSize: context.setSp(FontSize.s20),
                    ),
                    
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.loginRoute);
                  },

                  child: Text(context.loc.login, style: getMediumStyle(
                        color: AppColors.white,
                        fontSize: context.setSp(FontSize.s16),
                      ),),
                ),

              SizedBox(height: context.setHight(20)),


                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.changePassword);
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.black),
                    padding: EdgeInsets.symmetric(
                      vertical: context.setHight(12),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        context.setMinSize(30),
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                     context.loc.apply,
                      style: getMediumStyle(
                        color: AppColors.black,
                        fontSize: context.setSp(FontSize.s16),
                      ),
                    ),
                  ),
                ),

              SizedBox(height: context.setHight(120)),
              Center(
                child: Text(
                  _packageInfo.version,
                  textAlign: TextAlign.center,
                  style: getMediumStyle(
                    color: AppColors.black,
                    fontSize: context.setSp(FontSize.s16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }
}
