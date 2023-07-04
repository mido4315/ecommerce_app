import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay/pay.dart';

import '../../../../../core/constants/payment_configurations.dart';
import '../../view model/cart cubit/cart_cubit.dart';

class MyPayButton extends StatelessWidget {
  const MyPayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return GooglePayButton(
        paymentConfiguration:
            PaymentConfiguration.fromJsonString(defaultGooglePay),
        paymentItems: BlocProvider.of<CartCubit>(context).paymentItems,
        type: GooglePayButtonType.pay,
        margin: const EdgeInsets.only(top: 15.0),
        onPaymentResult: BlocProvider.of<CartCubit>(context).onGooglePayResult,
        loadingIndicator: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return ApplePayButton(
        paymentConfiguration:
            PaymentConfiguration.fromJsonString(defaultApplePay),
        paymentItems: BlocProvider.of<CartCubit>(context).paymentItems,
        margin: const EdgeInsets.only(top: 15.0),
        onPaymentResult: BlocProvider.of<CartCubit>(context).onApplePayResult,
        loadingIndicator: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}