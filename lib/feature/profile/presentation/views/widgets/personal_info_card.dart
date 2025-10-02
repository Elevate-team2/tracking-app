import 'package:flutter/material.dart';
import 'package:tracking_app/core/theme/app_colors.dart';
import 'package:tracking_app/feature/auth/domain/entity/driver_entity.dart';

class PersonalInfoCard extends StatelessWidget {
  final DriverEntity driverEntity;
  const PersonalInfoCard({super.key, required this.driverEntity});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        // go to edit profile
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                  driverEntity.photo,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${driverEntity.firstName} ${driverEntity.lastName}",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    driverEntity.email,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    driverEntity.phone,
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
