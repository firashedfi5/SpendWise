import 'package:dartz/dartz.dart';
import 'package:spendwise/core/errors/failure.dart';
import 'package:spendwise/features/settings/data/repos/settings_repo.dart';

class SettingsRepoImpl implements SettingsRepo {
  @override
  Future<Either<Failure, Unit>> updateProfile() {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
}
