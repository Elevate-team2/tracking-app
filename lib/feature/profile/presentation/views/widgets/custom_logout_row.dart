import 'package:flutter/material.dart';

class CustomLogoutRow extends StatelessWidget{

  String title;
  CustomLogoutRow({super.key,required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(Icons.logout, size: 15,color: Theme.of(context).iconTheme.color),
          const SizedBox(width: 5),
          Text(
            // AppLocalizations.of(context)!.language,
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Spacer(),
          Icon(Icons.logout, color: Theme.of(context).iconTheme.color),
        ],
      ),
    );
  }

}