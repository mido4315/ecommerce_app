import 'package:ecommerce_app/core/constatns/app_assets.dart';
import 'package:ecommerce_app/core/constatns/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../core/widgets/custom_snack_bar.dart';
import '../view model/login cubit/login_cubit.dart';
import 'widgets/custom_auth_button.dart';
import 'widgets/custom_text_form_field.dart';
import 'widgets/square_tile.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // form global key
  final _loginKey = GlobalKey<FormState>();

  // text editing controllers
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  // dispose text editing controllers
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  // sign user in method
  void signUserIn() {
    if (_loginKey.currentState!.validate()) {
      BlocProvider.of<LoginCubit>(context).userLogin(
        email: _emailController.text,
        password: _passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            customSnackBar(context, state.errorMessage);
          }else if(state is LoginSuccess){
            customSnackBar(context, 'done ya kabeeer');
            context.go(AppRouter.kLayoutView);
          }
        },
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30.h),

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

                  // username text field
                  Form(
                    key: _loginKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: _emailController,
                          hintText: 'Email',
                          obscureText: false,
                        ),

                        SizedBox(height: 10.h),

                        // password text field
                        CustomTextFormField(
                          controller: _passwordController,
                          hintText: 'Password',
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10.h),

                  // forgot password?
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: AppStyles.textStyle18,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 25.h),

                  // sign in button
                  CustomAuthButton(
                    onTap: signUserIn,
                    buttonText: 'Sign In',
                  ),

                  SizedBox(height: 50.h),

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

                  SizedBox(height: 20.h),

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

                  SizedBox(height: 30.h),

                  // not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: AppStyles.textStyle18,
                      ),
                      SizedBox(width: 4.w),
                      TextButton(
                        onPressed: () {
                          context.go(AppRouter.kRegisterView);
                        },
                        child: Text(
                          'Register now',
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