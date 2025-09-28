import 'package:flutter/cupertino.dart';
import 'package:tracking_app/core/theme/app_colors.dart';
import 'package:tracking_app/core/theme/font_style_manger.dart';

class CustumError extends StatelessWidget {
  final String errorMessage;
  const CustumError({super.key,required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:  [
        const SizedBox(height: 180.0),
        const Icon(CupertinoIcons.info_circle_fill, size: 60, color: AppColors.pink),
        const SizedBox(height: 20.0),
        Text(
          errorMessage,
          style: getBoldStyle(color: AppColors.gray, fontSize: 20),
        ),
      ],
    );
  }
}