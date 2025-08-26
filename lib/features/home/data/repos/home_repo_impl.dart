import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spendwise/core/errors/failure.dart';
import 'package:spendwise/core/utils/api_service.dart';
import 'package:spendwise/features/auth/data/models/user_model.dart';
import 'package:spendwise/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService _apiService;

  HomeRepoImpl(this._apiService);

  @override
  Future<Either<Failure, UserModel>> getUser({required String userId}) async {
    try {
      final data = await _apiService.get(endPoint: '/Users/$userId');
      final userData = UserModel.fromJson(data);
      return right(userData);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
