import 'package:flutter/material.dart';
import 'package:tracking_app/core/enums/address_type.dart';
import 'package:tracking_app/core/theme/app_colors.dart';
import 'package:tracking_app/feature/home/domain/entity/order_entity.dart';
import 'package:tracking_app/feature/home/presentaion/view/widgets/cache_image.dart';

class AddressContainer extends StatelessWidget {
  final String _containerName;
  final OrderEntity _orderEntity;
  final AddressType _addressType;

  // info about driver
  const AddressContainer(
    this._addressType,
    this._containerName,
    this._orderEntity, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
   String address='', name='', image='';
    if (_addressType == AddressType.store) {
      address = _orderEntity.store.address;
      name = _orderEntity.store.name;
      image = _orderEntity.store.image;
    } else if (_addressType == AddressType.user) {
      address =
          _orderEntity.shippingAddress.city +
          _orderEntity.shippingAddress.street;
      name = _orderEntity.user.firstName+_orderEntity.user.lastName;
      image = _orderEntity.user.photo;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(_containerName),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: InkWell(
            onTap: () {
              // if type is user then go to map user and driver
              // if type is store then go to map store and driver
             
              // need information about driver,user,stor
            },
            child: Container(
              padding: const EdgeInsets.all(10),
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
              child:
                  //////  ROW OF IMAGE AND TEXT  ///////////
                  Row(
                    children: [
                     CacheImage(imageUrl: image),

                      //////  COLUM OF TEXT  ///////////
                       Padding(
                         padding:const  EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(name),

                            //////  ROW OF ADDRESS  ///////////
                            Row(
                              children: [
                                const Icon(Icons.location_on_outlined),

                                 SizedBox(
                                  
                                  width: 220,
                                   child: Text(address,
                                   maxLines: 1,overflow:TextOverflow.ellipsis ,),
                                 ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
