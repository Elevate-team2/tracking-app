import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/feature/order/presentation/veiw_models/order_veiw_model/order_states.dart';

import '../../../../../core/request_state/request_state.dart';
import '../../veiw_models/order_veiw_model/order_bloc.dart';
import '../../veiw_models/order_veiw_model/order_events.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => context.read<OrderBloc>()..add(const GetDriverOrdersEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My orders"),
        ),
        body:  BlocBuilder<OrderBloc,OrderStates>(
            builder: (context, state) {
              switch(state.requestState){
                case RequestState.initial:
                  return const Center(child: Text("No data yet"),);
                case RequestState.init:
                  return const Center(child: Text("No data yet"),);
                case RequestState.error:
                  return const Center(child: Text("No data yet"),);
                case RequestState.loading:
                  return const Center(child: CircularProgressIndicator());
                case RequestState.success:
                  final orders = state.orders?.orders ?? [];
                  if (orders.isEmpty) {
                    return const Center(child: Text("No orders available."));
                  }
                  return const Column(
                    children: [
                      Row(
                        children: [
                          Text("ASA")
                        ],
                      )
                    ],
                  );
              }
            },
        ),
        
      ),
    );
  }
}