import 'package:flutter/material.dart';
import 'package:tracking_app/core/extensions/app_localization_extenstion.dart';
import 'package:tracking_app/core/theme/app_colors.dart';
import 'package:tracking_app/core/theme/font_manger.dart';
import 'package:tracking_app/core/theme/font_style_manger.dart';
import 'package:tracking_app/core/responsive/size_helper_extension.dart';

class ApproveScreen extends StatelessWidget {
  const ApproveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        key: const Key("stack1"),
        children: [
          Align(
             key: const Key("align1"),
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              "assets/images/wave.png",
              width: double.infinity,
             
              fit: BoxFit.cover,
            ),
          ),
          Center(
            key: const Key("center1"),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.setWidth(20),
                vertical: context.setHight(30)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.check_circle_outline_rounded,
                    size: context.setWidth(140),
                    color: AppColors.pink,
                  ),
                  SizedBox(height: context.setHight(10)),
                  SizedBox(
                    width: context.setWidth(200),
                    child: Text(
                      context.loc.submitted,
                      textAlign: TextAlign.center,
                      style: getBoldStyle(
                        color: AppColors.black,
                        fontSize: context.setSp(FontSize.s20),
                      ),
                    ),
                  ),
                  SizedBox(height: context.setHight(20)),
                  SizedBox(
                    width: context.setWidth(280),
                    child: Text(
                      context.loc.thankYou,
                      textAlign: TextAlign.center,
                      style: getRegularStyle(
                        color: AppColors.black,
                        fontSize: context.setSp(FontSize.s14),
                      ),
                    ),
                  ),
                  SizedBox(height: context.setHight(20)),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // navigate to login page
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: context.setHight(12),
                        ),
                      ),
                      child: Text(
                        context.loc.login,
                        style: getRegularStyle(
                          color: AppColors.white,
                          fontSize: context.setSp(FontSize.s16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
