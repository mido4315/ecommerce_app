import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/login_view.dart';


abstract class AppRouter {
  static const kSplashView = '/LoginView';
  static const kLoginView = '/LoginView';
  static const kRegisterView = '/BookDetailsView';
  static const kHomeView = '/SearchView';

  static final router = GoRouter(
    routes: [
      // GoRoute(
      //   path: '/',
      //   builder: (context, state) => const SplashView(),
      // ),
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginView(),
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