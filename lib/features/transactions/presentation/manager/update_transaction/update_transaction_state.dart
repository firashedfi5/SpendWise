part of 'update_transaction_cubit.dart';

sealed class UpdateTransactionState extends Equatable {
  const UpdateTransactionState();

  @override
  List<Object> get props => [];
}

final class UpdateTransactionInitial extends UpdateTransactionState {}

final class UpdateTransactionLoading extends UpdateTransactionState {}

final class UpdateTransactionSuccess extends UpdateTransactionState {}

final class UpdateTransactionFailure extends UpdateTransactionState {
  final String errMessage;

  const UpdateTransactionFailure({required this.errMessage});
}
