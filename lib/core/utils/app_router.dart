import 'package:ecommerce_app/core/utils/shared_preferences.dart';
import 'package:ecommerce_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:ecommerce_app/features/auth/presentation/view%20model/login%20cubit/login_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/view%20model/register%20cubit/register_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/register_view.dart';
import '../../features/layout/presentaion/view model/layout_cubit/layout_cubit.dart';
import '../../features/layout/presentaion/views/home_view.dart';
import '../../features/layout/presentaion/views/layout_view.dart';
import 'service_locator.dart';

abstract class AppRouter {
  static const kSplashView = '/LoginView';
  static const kLoginView = '/LoginView';
  static const kRegisterView = '/RegisterView';
  static const kHomeView = '/HomeView';
  static const kLayoutView = '/LayoutView';

  static final router = GoRouter(
    routes: [
      // GoRoute(
      //     path: '/',
      //     builder: (context, state) {
      //       if (getIt.get<SharedPrefs>().getData(key: 'token') == null) {
      //         return const LoginView();
      //       }
      //       return const HomeView();
      //     }),
      GoRoute(
          path: '/',
          builder: (context, state) {
            String? token = getIt.get<SharedPrefs>().getData(key: 'token');
            if (token != null) {
              return BlocProvider(
                create: (context) => LayoutCubit(),
                child: const LayoutView(),
              );
            }
            return BlocProvider(
              create: (context) => LoginCubit(
                getIt.get<AuthRepoImpl>(),
                //AuthRepoImpl(APIService(Dio())),
              ),
              child: const LoginView(),
            );
          }),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(
            getIt.get<AuthRepoImpl>(),
            //AuthRepoImpl(APIService(Dio())),
          ),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => BlocProvider(
          create: (context) => RegisterCubit(
            getIt.get<AuthRepoImpl>(),
          ),
          child: const RegisterView(),
        ),
      ),
      GoRoute(
        path: kLayoutView,
        builder: (context, state) => BlocProvider(
          create: (context) => LayoutCubit(),
          child: const LayoutView(),
        ),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      // GoRoute(
      //   path: kBookDetailsView,
      //   builder: (context, state) => const BookDetailsView(),
      // ),
      // GoRoute(
      //   path: kSearchView,
      //   builder: (context, state) => const SearchView(),
      // ),
    ],
  );
}