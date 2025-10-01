import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/config/di/di.dart';
import 'package:tracking_app/core/enums/address_type.dart';
import 'package:tracking_app/core/theme/app_colors.dart';
import 'package:tracking_app/core/theme/font_manger.dart';
import 'package:tracking_app/core/theme/font_style_manger.dart';
import 'package:tracking_app/feature/auth/domain/entity/driver_entity.dart';
import 'package:tracking_app/feature/home/domain/entity/order_entity.dart';
import 'package:tracking_app/feature/home/domain/entity/remote_data_entity.dart';
import 'package:tracking_app/feature/home/presentaion/view_models/home_view_model/home_events.dart';
import 'package:tracking_app/feature/home/presentaion/view_models/home_view_model/home_view_model.dart';

class CustumBtn extends StatelessWidget {
  final OrderEntity order;
  CustumBtn({super.key, required this.order});
  final HomeViewModel _homeViewModel = getIt.get<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _homeViewModel,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "EGP ${order.totalPrice}",
            style: getBoldStyle(color: AppColors.black, fontSize: FontSize.s18),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.white,
              side: const BorderSide(color: AppColors.pink),
            ),

            onPressed: () {
            
               _homeViewModel.add(DeleteOrderLocalyEvent(order.id));
            },
            child: Text(
              "Reject",
              style: getRegularStyle(
                color: AppColors.pink,
                fontSize: FontSize.s18,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final fakeRemoteDataEntity = RemoteDataEntity(
                const DriverEntity(
                  id: "driver_123",
                  country: "Egypt",
                  firstName: "Omar",
                  lastName: "Hassan",
                  vehicleType: "Car",
                  vehicleNumber: "EG-1234",
                  vehicleLicense: "LIC-56789",
                  nid: "29812345678901",
                  nidImg: "nid-photo.png",
                  email: "omar.hassan@example.com",
                  gender: "male",
                  phone: "+201000112233",
                  photo: "driver-photo.png",
                  role: "driver",
                  createdAt: "2025-01-01T10:00:00.000Z",
                ),
                order.copyWith(state: OrderStates.inProgress.name),
              );

              _homeViewModel.add(StartProgressEvnet(fakeRemoteDataEntity));
              // _homeViewModel.add(StartOrderEvent(order.id));
            },
            child: const Text("Accept"),
          ),
        ],
      ),
    );
  }
}
