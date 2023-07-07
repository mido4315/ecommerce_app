import 'package:flutter/material.dart';

import '../core/models/order.dart';
import '../core/utils/service_locator.dart';
import '../features/admin/admin orders/data/repos/admin_orders_repo.dart';
import '../features/auth/data/repos/auth_repo_impl.dart';

class OrderTracking extends StatefulWidget {
  const OrderTracking({
    super.key,
    required this.order,
    required this.adminOrdersRepo,
  });

  final OrderModel order;
  final AdminOrdersRepo adminOrdersRepo;

  @override
  State<OrderTracking> createState() => _OrderTrackingState();
}

class _OrderTrackingState extends State<OrderTracking> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      child: Stepper(
        physics: const NeverScrollableScrollPhysics(),
        currentStep: widget.order.status,
        controlsBuilder: (context, details) {
          var user = getIt.get<AuthRepoImpl>().myUserModel;
          if (user.type == "admin") {
            return ElevatedButton(
              child: const Text('Done'),
              onPressed: () {
                //updateOrderScreen(details.currentStep,widget.order);
                widget.adminOrdersRepo.changeOrderStatus(
                  status: details.currentStep+1,
                  order: widget.order,
                );
                setState(() {
                  widget.order.status+=1;
                });
              },
            );
          } else {
            return const SizedBox();
          }
        },
        steps: [
          Step(
            title: const Text('Pending'),
            content: const Text('We Just Took your Order'),
            isActive: widget.order.status >= 0,
            state: widget.order.status > 0
                ? StepState.complete
                : StepState.indexed,
          ),
          Step(
            title: const Text('Preparing'),
            content: const Text('Your Order is under preparing'),
            isActive: widget.order.status >= 1,
            state: widget.order.status > 1
                ? StepState.complete
                : StepState.indexed,
          ),
          Step(
            title: const Text('Ready'),
            content: const Text('Yor Order is ready to shaping'),
            isActive: widget.order.status >= 2,
            state: widget.order.status > 2
                ? StepState.complete
                : StepState.indexed,
          ),
          Step(
            title: const Text('On way'),
            content: const Text('Order is On the way'),
            isActive: widget.order.status >= 3,
            state: widget.order.status > 3
                ? StepState.complete
                : StepState.indexed,
          ),
          Step(
            title: const Text('Completed'),
            content: const Text('Have Fun with your order'),
            isActive: widget.order.status >= 4,
            state: widget.order.status >= 4
                ? StepState.complete
                : StepState.indexed,
          )
        ],
      ),
    );
  }
}