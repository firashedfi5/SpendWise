part of 'add_transaction_cubit.dart';

sealed class AddTransactionState extends Equatable {
  const AddTransactionState();

  @override
  List<Object> get props => [];
}

final class AddTransactionInitial extends AddTransactionState {}

final class AddTransactionLoading extends AddTransactionState {}

final class AddTransactionSuccess extends AddTransactionState {}

final class AddTransactionFailure extends AddTransactionState {
  final String errMessage;

  const AddTransactionFailure({required this.errMessage});
}

//* Category state
class CategoryUpdated extends AddTransactionState {
  final String category;
  const CategoryUpdated(this.category);

  @override
  List<Object> get props => [category];
}
