import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:spendwise/core/utils/api_service.dart';
import 'package:spendwise/core/utils/auth_service.dart';
import 'package:spendwise/core/utils/firebase_service.dart';
import 'package:spendwise/features/auth/data/repos/auth_repo_impl.dart';
import 'package:spendwise/features/home/data/data_sources/home_local_data_source.dart';
import 'package:spendwise/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:spendwise/features/home/data/repos/home_repo_impl.dart';
import 'package:spendwise/features/settings/data/repos/settings_repo_impl.dart';
import 'package:spendwise/features/transactions/data/data_sources/transactions_local_data_source.dart';
import 'package:spendwise/features/transactions/data/data_sources/transactions_remote_data_source.dart';
import 'package:spendwise/features/transactions/data/repo/transactions_repo_impl.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<FirebaseStorage>(FirebaseStorage.instance);

  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<AuthService>(AuthService());

  getIt.registerSingleton<FirebaseService>(FirebaseService());

  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(getIt.get<ApiService>(), getIt.get<AuthService>()),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      HomeRemoteDataSourceImpl(getIt.get<ApiService>()),
      HomeLocalDataSourceImpl(),
    ),
  );
  getIt.registerSingleton<TransactionsRepoImpl>(
    TransactionsRepoImpl(
      TransactionsRemoteDataSourceImpl(getIt.get<ApiService>()),
      TransactionsLocalDataSourceImpl(),
    ),
  );
  getIt.registerSingleton<SettingsRepoImpl>(
    SettingsRepoImpl(getIt.get<ApiService>(), getIt.get<FirebaseService>()),
  );
}
