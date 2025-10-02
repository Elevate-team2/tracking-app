import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tracking_app/core/assets_manager/assets_manger.dart';
import 'package:tracking_app/core/constants/app_widgets_keys.dart';
import 'package:tracking_app/core/extensions/app_localization_extenstion.dart';
import 'package:tracking_app/core/responsive/size_helper_extension.dart';
import 'package:tracking_app/core/theme/app_colors.dart';

class ProfilePhotoSection extends StatelessWidget {
  final String? photoUrl;
  final File? selectedPhoto;
  final VoidCallback onPickPhoto;

  const ProfilePhotoSection({
    super.key,
    this.photoUrl,
    this.selectedPhoto,
    required this.onPickPhoto,
  });

  @override
  Widget build(BuildContext context) {

    ImageProvider backgroundImage;

    if (selectedPhoto != null) {
      backgroundImage = FileImage(selectedPhoto!);
    } else if (photoUrl?.isNotEmpty ?? false) {
      backgroundImage = NetworkImage(photoUrl!);
    } else {
      backgroundImage = const AssetImage(ImgAssets.defaultUserPhoto);
    }

    return Stack(
      key: const Key(AppWidgetsKeys.photoStack),
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          key: const Key(AppWidgetsKeys.photoAvatar),
          radius: context.setWidth(60),
          backgroundImage: backgroundImage,
          backgroundColor: AppColors.white,
        ),
        IconButton(
          key: const Key(AppWidgetsKeys.photoSelectIcon),
          tooltip: context.loc.uploadNid,
          onPressed: onPickPhoto,
          icon: Container(
            width: context.setWidth(35),
            height: context.setWidth(35),
            decoration: BoxDecoration(
              color: AppColors.lightPink,
              borderRadius: BorderRadius.circular(context.setSp(10)),
            ),
            child: const Icon(Icons.camera_alt_outlined),
          ),
        ),
      ],
    );
  }
}
