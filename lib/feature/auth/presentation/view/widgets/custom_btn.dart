import 'package:flutter/material.dart';
import 'package:tracking_app/core/theme/app_colors.dart';
import 'package:tracking_app/core/theme/font_style_manger.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key,required this.onPressed,
    required this.txt,this.bg=AppColors.pink});
  final void Function()? onPressed;
  final String txt;
  final Color bg;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style:ElevatedButton.styleFrom(
            backgroundColor: bg,
            textStyle:const TextStyle(
              inherit: false
            ),
            foregroundColor: AppColors.white,
            fixedSize: Size(MediaQuery.of(context).size.width, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(20)
            )
        ) ,
        onPressed: onPressed,
        child: Text(txt,style: getMediumStyle(
            fontSize: 16.0,
            color: AppColors.white),));
  }
}