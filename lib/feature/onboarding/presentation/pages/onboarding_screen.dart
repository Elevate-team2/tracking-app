import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tracking_app/core/constants/constants.dart';
import 'package:tracking_app/core/extensions/app_localization_extenstion.dart';
import 'package:tracking_app/core/l10n/translations/app_localizations.dart';
import 'package:tracking_app/core/responsive/size_helper_extension.dart';
import 'package:tracking_app/core/routes/app_route.dart';
import 'package:tracking_app/core/theme/font_manger.dart';
import 'package:tracking_app/core/theme/font_style_manger.dart';
import '../../../../core/theme/app_colors.dart';

class OnBoarddingScreen extends StatefulWidget{
  const OnBoarddingScreen({super.key});

  @override
  State<OnBoarddingScreen> createState() => _OnBoarddingScreenState();
}
class _OnBoarddingScreenState extends State<OnBoarddingScreen> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: '0.0.0',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
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
          padding:  EdgeInsets.all(context.setWidth(20)),
          child: SingleChildScrollView(
            child: Column(
            
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(key: const Key("image1"),
                    Constants.onboardingphoto, fit: BoxFit.fill,height:context.setHight(350),width: context.setWidth(349)),
                 SizedBox(
                     height: context.setHight(20)),
                 Text(
                  "Welcome to\n Flowery rider app",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: context.setSp(20),
                      fontWeight: FontWeight.w500,
                      color: AppColors.black
                  ),
                ),
                SizedBox(
                      height: context.setHight(50),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoute.loginRoute);
                          }, child: Text(
                          context.loc.login,
                          style: getMediumStyle(
                            color: AppColors.white,
                            fontSize: context.setSp(FontSize.s20),
                          ),
                          )
                        ),
                      ),
                      
                 SizedBox(
                     height:context.setHight(10)),

                SizedBox(
                  height:  context.setHight(50),
                  child: OutlinedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, AppRoute.approveScreen);
                    },
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.black),
                        padding:  EdgeInsets.symmetric(vertical:context.setHight(20)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(context.setMinSize(20))
                        )
                    ), child:
                  Center(
                  
                    child:  Text(
                      AppLocalizations.of(context)!.apply,
                      style: TextStyle(
                          fontSize: context.setSp(16),
                          fontWeight: FontWeight.w500,
                          color: AppColors.black
                      ),
                    ),
                  ),
                              
                  ),
                ),
                 SizedBox(
                     height:context.setHight(120)),
                Center(
                  child: Text(
                    _packageInfo.version,
                    textAlign: TextAlign.center,
                    style:  TextStyle(
                        fontSize: context.setSp(14),
                        fontWeight: FontWeight.w400,
                        color: AppColors.black
                    ),
                  ),
                ),
            
              ],
            ),
          ),
        )
    );
  }
  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }
}