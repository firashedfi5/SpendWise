part of 'add_update_transaction_cubit.dart';

sealed class AddUpdateTransactionState extends Equatable {
  const AddUpdateTransactionState();

  @override
  List<Object> get props => [];
}

//* Add transaction states
final class AddTransactionInitial extends AddUpdateTransactionState {}

final class AddTransactionLoading extends AddUpdateTransactionState {}

final class AddTransactionSuccess extends AddUpdateTransactionState {}

final class AddTransactionFailure extends AddUpdateTransactionState {
  final String errMessage;

  const AddTransactionFailure({required this.errMessage});
}

//* Category state
class CategoryUpdated extends AddUpdateTransactionState {
  final String category;
  const CategoryUpdated(this.category);

  @override
  List<Object> get props => [category];
}

//* Update transaction states
final class UpdateTransactionInitial extends AddUpdateTransactionState {
  final TransactionModel transaction;

  const UpdateTransactionInitial({required this.transaction});
}

final class UpdateTransactionLoading extends AddUpdateTransactionState {}

final class UpdateTransactionSuccess extends AddUpdateTransactionState {}

final class UpdateTransactionFailure extends AddUpdateTransactionState {
  final String errMessage;

  const UpdateTransactionFailure({required this.errMessage});
}
