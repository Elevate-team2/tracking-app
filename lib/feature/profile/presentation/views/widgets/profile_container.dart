import 'package:flutter/material.dart';

class ProfileContainer extends StatelessWidget {
  final Widget containerChild;


  const ProfileContainer({super.key, required this.containerChild});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: containerChild,
    );
  }
}
