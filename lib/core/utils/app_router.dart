import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/utils/shared_preferences.dart';
import 'package:ecommerce_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:ecommerce_app/features/auth/presentation/view%20model/login%20cubit/login_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/view%20model/register%20cubit/register_cubit.dart';
import 'package:ecommerce_app/features/categories%20details/data/repos/categories_repo_impl.dart';
import 'package:ecommerce_app/features/categories%20details/presentation/view%20model/categories%20details%20cubit/categories_details_cubit.dart';
import 'package:ecommerce_app/features/my%20orders/data/repos/my_orders_repo_impl.dart';
import 'package:ecommerce_app/features/my%20orders/presentation/view%20model/my_orders_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/admin/admin panel/presentation/view model/admin cubit/admin_cubit.dart';
import '../../features/admin/admin panel/presentation/views/admin_view.dart';
import '../../features/admin/posts/data/repos/posts_repo_impl.dart';
import '../../features/admin/posts/presentation/view model/add new product cubit/add_new_product_cubit.dart';
import '../../features/admin/posts/presentation/views/add_new_product.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/register_view.dart';
import '../../features/cart/presentation/view model/cart cubit/cart_cubit.dart';
import '../../features/cart/presentation/views/address_view.dart';
import '../../features/categories details/presentation/views/categories_details_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/layout/presentaion/view model/layout_cubit/layout_cubit.dart';
import '../../features/layout/presentaion/views/layout_view.dart';
import '../../features/my orders/presentation/views/my_orders_view.dart';
import '../../features/product details/data/repos/product_details_repo_impl.dart';
import '../../features/product details/presentation/view model/product details cubit/product_details_cubit.dart';
import '../../features/product details/presentation/views/product_details_view.dart';
import '../../features/search/presentation/views/search_view.dart';
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
  static const kCategoriesDetailsView =
      '/kCategoriesDetailsView/:categoryTitle';
  static const kSearchView = '/SearchView';
  static const kProductDetailsView = '/ProductDetailsView';
  static const kAddressView = '/AddressView';
  static const kMyOrdersView = '/MyOrdersView';

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
      GoRoute(
        path: kCategoriesDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => CategoriesDetailsCubit(
              CategoriesRepoImpl(getIt.get<APIService>()))
            ..getProducts(category: state.pathParameters['categoryTitle']!),
          child: CategoriesDetailsView(
            categoryTitle: state.pathParameters['categoryTitle']!,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => SearchView(
          products: state.extra as List<ProductModel>,
        ),
      ),
      GoRoute(
        path: kProductDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => ProductDetailsCubit(
              ProductDetailsRepoImpl(getIt.get<APIService>()))
            ..calculateRating(
              state.extra as ProductModel,
            ),
          child: ProductDetailsView(
            product: state.extra as ProductModel,
          ),
        ),
      ),
      GoRoute(
        path: kAddressView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              CartCubit(ProductDetailsRepoImpl(getIt.get<APIService>())),
          child: AddressView(
            totalPrice: state.extra as double,
          ),
        ),
      ),
      GoRoute(
        path: kMyOrdersView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              MyOrdersCubit(MyOrdersRepoImpl(getIt.get<APIService>()))..getOrders(),
          child: const MyOrdersView(),
        ),
      ),
      // GoRoute(
      //   path: kSearchView,
      //   builder: (context, state) => const SearchView(),
      // ),
    ],
  );
}