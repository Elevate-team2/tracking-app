import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tracking_app/core/responsive/size_helper_extension.dart';
import 'package:tracking_app/core/theme/app_colors.dart';
import 'package:tracking_app/core/theme/font_style_manger.dart';

class LoadImage extends StatelessWidget {
  const LoadImage({super.key,required this.onTap,required this.lbl,
    this.file});
 final void Function()? onTap;
 final File? file;
 final String lbl;
  @override
  Widget build(BuildContext context) {

     return  Container(
        padding: const EdgeInsets.symmetric(
        horizontal: 12
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(child: file==null?
            Text(lbl,
              style: getMediumStyle
              (color: AppColors.gray,
                  fontSize: context.setSp(14)),):

            Image.file(file!, height: context.setHight(45),
                fit: BoxFit.cover),),

             IconButton(onPressed: onTap,
                 icon:
             Icon(Icons.file_upload_outlined,
               color: AppColors.black,
               size: context.setSp(20),
             )
             ),


          ],
        ),
      );

  }
}
