import 'package:ecommerce_app/core/utils/app_router.dart';
import 'package:ecommerce_app/features/admin/admin%20orders/presentation/view%20model/admin_orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../widgets/table_header.dart';
import '../../../../../widgets/table_row.dart';

class AdminOrdersView extends StatelessWidget {
  const AdminOrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminOrdersCubit, AdminOrdersState>(
        builder: (context, state) {
      if (state is AdminOrdersSuccess) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Orders",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 0.5,
                color: Colors.grey,
              ),
              Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    // table head
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
                          TableHeader("Amount"),
                          TableHeader("Status"),
                          TableHeader(""),
                        ]),
                    //table data
                    for (int i = 0; i < state.orders.length; i++)
                      tableRow(
                        image: state.orders[i].products[0].images[0],
                        amount: state.orders[i].totalPrice.toString(),
                        status: state.orders[i].status,
                        index: (i + 1).toString(),
                        i: i,
                        onTap: () {
                          context.push(
                            AppRouter.kMyOrdersDetailsView,
                            extra: state.orders[i],
                          );
                        },
                      )
                  ]),
            ],
          ),
        );
      } else if (state is AdminOrdersFailure) {
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
    });
  }
}