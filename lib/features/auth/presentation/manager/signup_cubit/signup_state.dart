part of 'signup_cubit.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final User user;

  const SignupSuccess({required this.user});
}

final class SignupFailure extends SignupState {
  final String errMessage;

  const SignupFailure({required this.errMessage});
}

//* User creation state
final class UserCreationLoading extends SignupState {}

final class UserCreationSuccess extends SignupState {}

final class UserCreationFailure extends SignupState {
  final String errMessage;

  const UserCreationFailure({required this.errMessage});
}
