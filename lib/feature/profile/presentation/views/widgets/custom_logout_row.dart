import 'package:flutter/material.dart';
import 'package:tracking_app/core/extensions/app_localization_extenstion.dart';
import 'package:tracking_app/core/responsive/size_helper_extension.dart';
import 'package:tracking_app/core/theme/app_colors.dart';
import 'package:tracking_app/core/theme/font_manger.dart';
import 'package:tracking_app/core/theme/font_style_manger.dart';
import 'package:tracking_app/feature/profile/presentation/view_model/profile_view_model/profile_bloc.dart';
import 'package:tracking_app/feature/profile/presentation/views/widgets/custum_dialog.dart';

class CustomLogoutRow extends StatelessWidget {
  final ProfileBloc _profileBloc;

  const CustomLogoutRow({
    super.key,
 
    required ProfileBloc profileBloc,
  }) : _profileBloc = profileBloc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(context.setWidth(8)),
      child: Row(
        children: [
          Icon(
            Icons.logout,
            size: 15,
            color: Theme.of(context).iconTheme.color,
          ),
           SizedBox(width: context.setWidth(8)),
          Text(
     
           context.loc.logout,
            style: getMediumStyle(color: AppColors.black,fontSize:context.setSp(FontSize.s14)),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
            
              showDialog(
                context: context,
                builder: (context) {
                  return CustumDialog(profileBloc:_profileBloc);
                },
              );
            },
            icon: Icon(Icons.logout, color: Theme.of(context).iconTheme.color),
          ),
        ],
      ),
    );
  }
}
