import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/features/auth/data/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepo) : super(LoginInitial());

  final AuthRepo _authRepo;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    final result = await _authRepo.login(email: email, password: password);
    result.fold(
      (failure) => emit(LoginFailure(errMessage: failure.message)),
      (user) => emit(LoginSuccess(user: user)),
    );
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    final result = await _authRepo.loginWithGoogle();
    result.fold(
      (failure) => emit(LoginFailure(errMessage: failure.message)),
      (user) => emit(LoginSuccess(user: user)),
    );
  }

  //* Log out
  Future<void> logout() async {
    emit(LogoutLoading());
    final result = await _authRepo.logout();
    result.fold(
      (failure) => emit(LogoutFailure(errMessage: failure.message)),
      (success) => emit(LogoutSuccess()),
    );
  }
}
