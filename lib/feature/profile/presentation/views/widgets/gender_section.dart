import 'package:flutter/material.dart';
import 'package:tracking_app/core/constants/app_widgets_keys.dart';
import 'package:tracking_app/core/constants/constants.dart';
import 'package:tracking_app/core/extensions/app_localization_extenstion.dart';
import 'package:tracking_app/core/responsive/size_helper_extension.dart';
import 'package:tracking_app/core/theme/app_colors.dart';
import 'package:tracking_app/core/theme/font_manger.dart';
import 'package:tracking_app/core/theme/font_style_manger.dart';

class GenderSection extends StatelessWidget {
  final String? selectedGender;

  const GenderSection({
    super.key,
    required this.selectedGender,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          context.loc.gender,
          style: getMediumStyle(
            color: AppColors.black,
            fontSize: context.setSp(FontSize.s16),
          ),
        ),
        SizedBox(width: context.setWidth(15)),
        RadioMenuButton<String>(
          key: const Key(AppWidgetsKeys.femaleRadio),
          value: Constants.female,
          groupValue: selectedGender,
          onChanged: (val) {},
          child: Text(context.loc.female), // بدل "Female"
        ),
        RadioMenuButton<String>(
          key: const Key(AppWidgetsKeys.maleRadio),
          value: Constants.male,
          groupValue: selectedGender,
          onChanged: (val) {},
          child: Text(context.loc.male), // بدل "Male"
        ),
      ],
    );
  }
}
