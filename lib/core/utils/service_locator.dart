import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:spendwise/core/utils/api_service.dart';
import 'package:spendwise/core/utils/auth_service.dart';
import 'package:spendwise/features/auth/data/repos/auth_repo_impl.dart';
import 'package:spendwise/features/home/data/repos/home_repo_impl.dart';
import 'package:spendwise/features/transactions/data/data_sources/home_local_data_source.dart';
import 'package:spendwise/features/transactions/data/data_sources/home_remote_data_source.dart';
import 'package:spendwise/features/transactions/data/repo/transactions_repo_impl.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<AuthService>(AuthService());
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(getIt.get<ApiService>(), getIt.get<AuthService>()),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>(),
      HomeRemoteDataSourceImpl(getIt.get<ApiService>()),
      HomeLocalDataSourceImpl(),
    ),
  );
  getIt.registerSingleton<TransactionsRepoImpl>(
    TransactionsRepoImpl(getIt.get<ApiService>()),
  );
}
