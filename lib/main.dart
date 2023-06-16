import 'package:ecommerce_app/core/constatns/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_router.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/core/utils/shared_preferences.dart';
import 'package:ecommerce_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await getIt.get<SharedPrefs>().init();
  if (getIt.get<SharedPrefs>().getData(key: 'token') != null) {
    await getIt.get<AuthRepoImpl>().getUserData();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
            title: 'E-Commerce App',

            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.background,
                secondary: AppColors.card,
                background:AppColors.background,
                onPrimary: AppColors.text1,
                onSecondary: AppColors.text1,
              ),
              useMaterial3: true,
            ),
          );
        });
  }
}