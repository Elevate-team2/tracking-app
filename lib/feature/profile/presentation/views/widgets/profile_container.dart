import 'package:flutter/material.dart';
import 'package:tracking_app/core/responsive/size_helper_extension.dart';

class ProfileContainer extends StatelessWidget {
  final Widget containerChild;
  final void Function()? onClick;

  const ProfileContainer({
    super.key,
    required this.containerChild,
    this.onClick,
  });
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
     cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: onClick,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: context.setHight(10)),
          padding: EdgeInsets.all(context.setWidth(16)),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(context.setWidth(10)),
            border: Border.all(color: Colors.grey, width: context.setWidth(1)),
          ),
          child: containerChild,
        ),
      ),
    );
  }
}
