import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomLogoutRow extends StatelessWidget{

  String title;
  CustomLogoutRow({super.key,required this.title});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.logout, size: 20, color: Theme.of(context).iconTheme.color),
        SizedBox(width: 5),
        Text(
          // AppLocalizations.of(context)!.language,
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const Spacer(),
        Icon(Icons.logout, size: 40, color: Theme.of(context).iconTheme.color),
      ],
    );
  }

}