import 'package:flutter/material.dart';
import 'package:tracking_app/core/theme/app_colors.dart';
import 'package:tracking_app/feature/auth/domain/entity/driver_entity.dart';

class VechicalInfoCard extends StatelessWidget {
    final DriverEntity driverEntity;
  const VechicalInfoCard({super.key,required this.driverEntity});
  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        // go to vechincal profile
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Vehical info',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    driverEntity.vehicleType,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    driverEntity.vehicleNumber,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
      
          const Icon(Icons.arrow_forward_ios, color: AppColors.gray),
        ],
      ),
    );
  }
}
