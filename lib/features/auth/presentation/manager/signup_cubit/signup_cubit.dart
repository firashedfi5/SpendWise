import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/features/auth/data/repos/auth_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._authRepo) : super(SignupInitial());

  final AuthRepo _authRepo;

  Future<void> signupUser({
    required String email,
    required String password,
  }) async {
    emit(SignupLoading());
    final result = await _authRepo.signupUser(email: email, password: password);
    result.fold(
      (failure) => emit(SignupFailure(errMessage: failure.message)),
      (user) => emit(SignupSuccess(user: user)),
    );
  }
}
