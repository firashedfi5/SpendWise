part of 'transactions_cubit.dart';

sealed class TransactionsState extends Equatable {
  const TransactionsState();

  @override
  List<Object> get props => [];
}

final class TransactionsInitial extends TransactionsState {}

final class TransactionsLoading extends TransactionsState {}

final class TransactionsSuccess extends TransactionsState {}

final class TransactionsFailure extends TransactionsState {
  final String errMessage;

  const TransactionsFailure({required this.errMessage});
}

//* Category state
class CategoryUpdated extends TransactionsState {
  final String category;
  const CategoryUpdated(this.category);

  @override
  List<Object> get props => [category];
}
