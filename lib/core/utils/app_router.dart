import 'package:ecommerce_app/core/utils/shared_preferences.dart';
import 'package:ecommerce_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:ecommerce_app/features/auth/presentation/view%20model/login%20cubit/login_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/view%20model/register%20cubit/register_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/admin/admin panel/presentation/view model/admin cubit/admin_cubit.dart';
import '../../features/admin/admin panel/presentation/views/admin_view.dart';
import '../../features/admin/posts/data/repos/posts_repo_impl.dart';
import '../../features/admin/posts/presentation/view model/add new product cubit/add_new_product_cubit.dart';
import '../../features/admin/posts/presentation/views/add_new_product.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/register_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/layout/presentaion/view model/layout_cubit/layout_cubit.dart';
import '../../features/layout/presentaion/views/layout_view.dart';
import 'api_service.dart';
import 'service_locator.dart';

abstract class AppRouter {
  static const kSplashView = '/LoginView';
  static const kLoginView = '/LoginView';
  static const kRegisterView = '/RegisterView';
  static const kHomeView = '/HomeView';
  static const kLayoutView = '/LayoutView';
  static const kAdminView = '/AdminView';
  static const kAddNewProduct = '/AddNewProduct';

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
              if (getIt.get<AuthRepoImpl>().myUserModel.type == 'user') {
                return BlocProvider(
                  create: (context) => LayoutCubit(),
                  child: const LayoutView(),
                );
              }
              return BlocProvider(
                create: (context) => AdminCubit(),
                child: const AdminView(),
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
      GoRoute(
        path: kAdminView,
        builder: (context, state) => BlocProvider(
          create: (context) => AdminCubit(),
          child: const AdminView(),
        ),
      ),
      GoRoute(
        path: kAddNewProduct,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              AddNewProductCubit(PostsRepoImpl(getIt.get<APIService>())),
          child: const AddNewProduct(),
        ),
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