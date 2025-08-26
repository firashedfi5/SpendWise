import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:spendwise/core/utils/api_service.dart';
import 'package:spendwise/core/utils/auth_service.dart';
import 'package:spendwise/features/auth/data/repos/auth_repo_impl.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<AuthService>(AuthService());
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(getIt.get<ApiService>(), getIt.get<AuthService>()),
  );
}
