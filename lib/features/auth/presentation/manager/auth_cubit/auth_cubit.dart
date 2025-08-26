import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/features/auth/data/models/user_model.dart';
import 'package:spendwise/features/auth/data/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInitial());

  final AuthRepo _authRepo;

  //* Sign up
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

  //* Log in
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

  //TODO: Keep the user logged in
}
