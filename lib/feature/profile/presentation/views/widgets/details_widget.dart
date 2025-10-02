import 'package:flutter/material.dart';
import 'package:tracking_app/core/responsive/size_helper_extension.dart';
import 'package:tracking_app/core/theme/app_colors.dart';

class DriverDetailsWidget extends StatelessWidget{
  String title;
  String detail;
  String number;
  String imagePath;
 DriverDetailsWidget({super.key,required this.title,required this.detail,required this.number, required this.imagePath});
  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.all(16),
     child: Container(
       decoration:BoxDecoration(
         color: Colors.transparent,
         borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey,width: 1),

       )
         ,
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             ClipRRect(
               borderRadius: BorderRadius.circular(40),
               child: Image.asset(imagePath,height:50,width: 50,fit: BoxFit.cover,)),
             Column(
                children: [
                  Text(title,style: Theme.of(context).textTheme.bodyLarge,),
                  Text(detail,style: Theme.of(context).textTheme.bodyMedium,),
                  Text(number,style: Theme.of(context).textTheme.bodyMedium,),
                  
                ],
             ),
             Icon(Icons.arrow_forward_ios,color:AppColors.gray,size: 20,)
           ],
         )),
   );
  }

}