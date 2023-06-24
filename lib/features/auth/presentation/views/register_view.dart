import 'package:ecommerce_app/core/constants/app_assets.dart';
import 'package:ecommerce_app/core/constants/app_styles.dart';
import 'package:ecommerce_app/core/utils/app_router.dart';
import 'package:ecommerce_app/core/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../widgets/custom_text_form_field.dart';
import '../view model/register cubit/register_cubit.dart';
import 'widgets/custom_auth_button.dart';
import 'widgets/square_tile.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  // form global key
  final _registerKey = GlobalKey<FormState>();

  // text editing controllers
  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _addressController = TextEditingController();

  // dispose text editing controllers
  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _addressController.dispose();
  }

  // sign user in method
  void registerNewUser() {
    if (_registerKey.currentState!.validate()) {
      BlocProvider.of<RegisterCubit>(context).userRegister(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        address: _addressController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterFailure) {
            customSnackBar(context, state.errorMessage);
          }else if(state is RegisterSuccess){
            customSnackBar(context, 'done ya kabeeer');
          }
        },
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // logo
                  Icon(
                    Icons.lock,
                    size: 90.r,
                  ),

                  SizedBox(height: 20.h),

                  // welcome back, you've been missed!
                  Text(
                    'Welcome back you\'ve been missed!',
                    style: AppStyles.textStyle18,
                  ),

                  SizedBox(height: 25.h),

                  // name text field
                  Form(
                    key: _registerKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: _nameController,
                          hintText: 'Name',
                          obscureText: false,
                        ),

                        SizedBox(height: 10.h),

                        // password text field
                        CustomTextFormField(
                          controller: _emailController,
                          hintText: 'Email',
                          obscureText: false,
                        ),

                        SizedBox(height: 10.h),
                        // email text field
                        CustomTextFormField(
                          controller: _passwordController,
                          hintText: 'Password',
                          obscureText: true,
                        ),

                        SizedBox(height: 10.h),
                        CustomTextFormField(
                          controller: _addressController,
                          hintText: 'Address',
                          obscureText: false,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10.h),

                  // sign in button
                  CustomAuthButton(
                    onTap: registerNewUser,
                    buttonText: 'Sign Up',
                  ),

                  SizedBox(height: 10.h),
                  // or continue with
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                          child: Text(
                            'Or continue with',
                            style: AppStyles.textStyle18,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10.h),

                  // google + apple sign in buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // google button
                      const SquareTile(imagePath: AppAssets.googleLogo),

                      SizedBox(width: 25.w),

                      // apple button
                      const SquareTile(imagePath: AppAssets.appleLogo)
                    ],
                  ),

                  SizedBox(height: 10.h),

                  // You are a member? Login now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You are a member?',
                        style: AppStyles.textStyle18,
                      ),
                      SizedBox(width: 4.w),
                      TextButton(
                        onPressed: () {
                          context.go(AppRouter.kLoginView);
                        },
                        child: Text(
                          'Login',
                          style: AppStyles.textStyleBlue,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}