import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomLanguageRow extends StatelessWidget{
  String svgPath;
  String title;
  String detail;
  CustomLanguageRow({super.key,required this.svgPath,required this.title,required this.detail});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SvgPicture.asset(
            svgPath,
            width: 15,
            height: 15,
          ),
          const SizedBox(width: 5),
          Text(
            // AppLocalizations.of(context)!.language,
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Spacer(),
          Text(detail,
            /*cubit.currentLanguage == "en"
                      ? AppLocalizations.of(context)!.english
                      : AppLocalizations.of(context)!.arabic*/
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

}