import 'package:ecommerce_app/core/constants/app_colors.dart';
import 'package:ecommerce_app/core/constants/app_styles.dart';
import 'package:ecommerce_app/core/utils/app_router.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/core/widgets/custom_snack_bar.dart';
import 'package:ecommerce_app/features/cart/presentation/view%20model/cart%20cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/cart/presentation/views/widgets/custom_dialog_on_cash.dart';
import 'package:ecommerce_app/widgets/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../widgets/custom_text_form_field.dart';
import '../../../auth/data/repos/auth_repo_impl.dart';
import 'widgets/pay_button.dart';

class AddressView extends StatefulWidget {
  const AddressView({Key? key, required this.totalPrice}) : super(key: key);

  final double totalPrice;
  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  // form global key
  final _registerKey = GlobalKey<FormState>();

  // text editing controllers
  final _addressController = TextEditingController();

  final _homeController = TextEditingController();

  final _areaController = TextEditingController();

  final _specialMarkController = TextEditingController();

  // dispose text editing controllers
  @override
  void dispose() {
    super.dispose();
    _addressController.dispose();
    _homeController.dispose();
    _areaController.dispose();
    _specialMarkController.dispose();
  }

  // sign user in method
  Future<void> onCashResult() async {
    if (_registerKey.currentState!.validate()) {
      String address =
          "${_addressController.text} ${_homeController.text}${_areaController.text}${_specialMarkController.text}";
      BlocProvider.of<CartCubit>(context).addNewAddress(address: address);
      BlocProvider.of<CartCubit>(context).createNewOrder(
        address: address,
        totalPrice: widget.totalPrice,
        paymentMethod: 'CASH',
      );
      customDialogOnCash(
          context: context,
          onOk: () {
            context.go(AppRouter.kLayoutView);
          },
          txtHead: 'Your order has been created successfully',
          txtMsg: '');
    }
    //context.pop();
  }

  String? myAddress = getIt.get<AuthRepoImpl>().myUserModel.address;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is OrderHasNotBeenCreated) {
          customSnackBar(context, state.errorMessage);
        }
      },
      child: Scaffold(
        appBar: simpleAppBar(
          title:
              myAddress!.isNotEmpty ? 'Choose an address' : 'Add Your Address',
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (myAddress!.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.r),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.card,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              myAddress!,
                              style: AppStyles.textStyleTitle20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Or Add New Address',
                        style: AppStyles.textStyleTitle22,
                      ),
                    ],
                  ),
                Form(
                  key: _registerKey,
                  child: Column(
                    children: [
                      SizedBox(height: 30.h),
                      CustomTextFormField(
                        controller: _addressController,
                        hintText: 'Address',
                        obscureText: false,
                        prefixIcon: Icons.home,
                      ),
                      SizedBox(height: 10.h),
                      CustomTextFormField(
                        controller: _homeController,
                        hintText: 'Home, Number',
                        obscureText: false,
                        prefixIcon: Icons.streetview,
                      ),
                      SizedBox(height: 10.h),
                      CustomTextFormField(
                        controller: _areaController,
                        hintText: 'Area, Street',
                        obscureText: false,
                        prefixIcon: Icons.add_business,
                      ),
                      SizedBox(height: 10.h),
                      CustomTextFormField(
                        controller: _specialMarkController,
                        hintText: 'Special Mark',
                        obscureText: false,
                        prefixIcon: Icons.mark_as_unread,
                      ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: EdgeInsets.fromLTRB(18.w, 0, 18.w, 16.h),
                        child: const SizedBox(
                          width: double.infinity,
                          child: MyPayButton(),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(18.w, 0, 18.w, 16.h),
                        child: SizedBox(
                          height: 40.h,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff698531)),
                            onPressed: onCashResult,
                            child: const Text(
                              '\$ Cash on delivery',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}