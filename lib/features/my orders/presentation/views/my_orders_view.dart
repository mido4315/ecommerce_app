import 'package:ecommerce_app/core/utils/app_router.dart';
import 'package:ecommerce_app/features/my%20orders/presentation/view%20model/my_orders_cubit.dart';
import 'package:ecommerce_app/widgets/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../widgets/table_header.dart';
import '../../../../widgets/table_row.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Orders'),
      body: SafeArea(
        child: BlocBuilder<MyOrdersCubit, MyOrdersState>(
          builder: (context, state) {
            if (state is MyOrdersSuccess) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    const TableRow(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                      ),
                      children: [
                        TableHeader("Order"),
                        TableHeader("Price"),
                        TableHeader("Status"),
                        TableHeader(""),
                      ],
                    ),
                    for (int i = 0; i < state.myOrders.length; i++)
                      tableRow(
                        image: state.myOrders[i].products[0].images[0],
                        amount: state.myOrders[i].totalPrice.toString(),
                        status: state.myOrders[i].status,
                        index: (i + 1).toString(),
                        i: i,
                        onTap: () {
                          context.push(
                            AppRouter.kMyOrdersDetailsView,
                            extra: state.myOrders[i],
                          );
                        },
                      ),
                  ],
                ),
              );
            } else if (state is MyOrdersFailure) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: const TextStyle(fontSize: 50),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}