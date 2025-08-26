part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

//* Sig up states
final class SignupLoading extends AuthState {}

final class SignupSuccess extends AuthState {
  final User user;

  const SignupSuccess({required this.user});
}

final class SignupFailure extends AuthState {
  final String errMessage;

  const SignupFailure({required this.errMessage});
}

//* User creation states
final class UserCreationLoading extends AuthState {}

final class UserCreationSuccess extends AuthState {}

final class UserCreationFailure extends AuthState {
  final String errMessage;

  const UserCreationFailure({required this.errMessage});
}

//* Log in states
final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {
  final User user;

  const LoginSuccess({required this.user});
}

final class LoginFailure extends AuthState {
  final String errMessage;

  const LoginFailure({required this.errMessage});
}

//* Log out states
final class LogoutLoading extends AuthState {}

final class LogoutSuccess extends AuthState {}

final class LogoutFailure extends AuthState {
  final String errMessage;

  const LogoutFailure({required this.errMessage});
}
