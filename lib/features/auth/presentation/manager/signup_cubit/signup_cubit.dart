import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/features/auth/data/models/user_model.dart';
import 'package:spendwise/features/auth/data/repos/auth_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._authRepo) : super(SignupInitial());

  final AuthRepo _authRepo;

  Future<void> signup({
    required String email,
    required String password,
    required String username,
  }) async {
    emit(SignupLoading());
    final result = await _authRepo.signup(
      email: email,
      password: password,
      username: username,
    );
    result.fold(
      (failure) => emit(SignupFailure(errMessage: failure.message)),
      (user) => emit(SignupSuccess(user: user)),
    );
  }

  Future<void> signupWithGoogle() async {
    emit(SignupLoading());
    final result = await _authRepo.loginWithGoogle();
    result.fold(
      (failure) => emit(SignupFailure(errMessage: failure.message)),
      (user) => emit(SignupSuccess(user: user)),
    );
  }

  Future<void> createUser({required UserModel user}) async {
    emit(UserCreationLoading());
    final result = await _authRepo.createUser(user);
    result.fold(
      (failure) => emit(UserCreationFailure(errMessage: failure.message)),
      (user) => emit(UserCreationSuccess()),
    );
  }
}
