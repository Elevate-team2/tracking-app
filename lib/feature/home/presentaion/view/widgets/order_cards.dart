import 'package:flutter/material.dart';
import 'package:tracking_app/core/enums/address_type.dart';
import 'package:tracking_app/core/theme/app_colors.dart';
import 'package:tracking_app/core/theme/font_manger.dart';
import 'package:tracking_app/core/theme/font_style_manger.dart';
import 'package:tracking_app/feature/home/domain/entity/order_entity.dart';
import 'package:tracking_app/feature/home/presentaion/view/widgets/address_container.dart';
import 'package:tracking_app/feature/home/presentaion/view/widgets/custum_btn.dart';

class OrderCards extends StatelessWidget {
  final List<OrderEntity> orders;
  const OrderCards({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white,

                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.lightGray30,
                      blurRadius: 1,
                      spreadRadius: 1,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Flower order",
                        style: getBoldStyle(
                          color: AppColors.black,
                          fontSize: FontSize.s18,
                        ),
                      ),
                    ),
                    AddressContainer(AddressType.store, "Pickup address", order),
                    const SizedBox(height: 15),
                    AddressContainer(AddressType.user,"User address",order),

                    const SizedBox(height: 10),

                    CustumBtn(order: order,),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
