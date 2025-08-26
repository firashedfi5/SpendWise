part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final UserModel user;

  const HomeSuccess({required this.user});
}

final class HomeFailure extends HomeState {
  final String errMessage;

  const HomeFailure({required this.errMessage});
}
