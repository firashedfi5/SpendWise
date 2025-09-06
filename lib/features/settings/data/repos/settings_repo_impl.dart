import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spendwise/core/errors/failure.dart';
import 'package:spendwise/core/utils/api_service.dart';
import 'package:spendwise/core/utils/service_locator.dart';
import 'package:spendwise/features/auth/data/models/user_model.dart';
import 'package:spendwise/features/settings/data/repos/settings_repo.dart';

class SettingsRepoImpl implements SettingsRepo {
  final ApiService _apiService;

  SettingsRepoImpl(this._apiService);

  @override
  Future<Either<Failure, User>> updateProfile({required UserModel user}) async {
    try {
      await getIt.get<FirebaseAuth>().currentUser!.updateProfile(
        displayName: user.username,
        photoURL: user.photoURL,
      );
      await getIt.get<FirebaseAuth>().currentUser!.reload();
      final User refreshedUser = getIt.get<FirebaseAuth>().currentUser!;
      _apiService.put(
        endPoint: '/Users/${getIt.get<FirebaseAuth>().currentUser!.uid}',
        data: user.toJson(),
      );
      return right(refreshedUser);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else if (e is FirebaseAuthException) {
        return left(FirebaseFailure.fromFirebase(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
