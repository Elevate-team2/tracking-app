import 'package:flutter/material.dart';
import 'package:tracking_app/core/theme/app_colors.dart';
import 'package:tracking_app/core/theme/font_manger.dart';
import 'package:tracking_app/core/theme/font_style_manger.dart';

class CustumBtn extends StatelessWidget {
  final int price;
  const CustumBtn({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "EGP $price",
          style: getBoldStyle(color: AppColors.black, fontSize: FontSize.s18),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.white,
            side: BorderSide(color: AppColors.pink),
          ),

          onPressed: () {},
          child: Text(
            "Reject",
            style: getRegularStyle(
              color: AppColors.pink,
              fontSize: FontSize.s18,
            ),
          ),
        ),
        ElevatedButton(onPressed: () {}, child: Text("Accept")),
      ],
    );
  }
}
