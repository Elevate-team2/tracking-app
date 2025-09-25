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
      body: Padding(
        padding: EdgeInsets.all(context.setWidth(25)), 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.done,
              size: context.setWidth(100), 
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
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: context.setHight(15),
              ),
              child: SizedBox(
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
            ),
            ElevatedButton(
              onPressed: () {
                // navigate to login
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  vertical: context.setHight(12),
                 
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.loc.login,
                    style: getRegularStyle(
                      color: AppColors.white,
                      fontSize: context.setSp(FontSize.s16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
