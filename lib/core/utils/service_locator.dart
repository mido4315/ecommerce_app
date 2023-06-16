import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:get_it/get_it.dart';

import 'api_service.dart';
import 'shared_preferences.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<SharedPrefs>(
    SharedPrefs(),
    signalsReady: true,
  );
  getIt.registerSingleton<APIService>(
    APIService(
      Dio(),
    ),
  );
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      getIt.get<APIService>(),
    ),
  );
}