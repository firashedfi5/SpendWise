import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spendwise/core/errors/failure.dart';
import 'package:spendwise/features/auth/data/models/user_model.dart';

abstract class SettingsRepo {
  Future<Either<Failure, User>> updateProfile({required UserModel user});
  Future<Either<Failure, String>> uploadPhoto({required File imageFile});
}
