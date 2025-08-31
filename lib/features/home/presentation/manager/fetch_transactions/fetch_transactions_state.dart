part of 'fetch_transactions_cubit.dart';

sealed class FetchTransactionsState extends Equatable {
  const FetchTransactionsState();

  @override
  List<Object> get props => [];
}

final class FetchTransactionsInitial extends FetchTransactionsState {}

final class FetchTransactionsLoading extends FetchTransactionsState {}

final class FetchTransactionsSuccess extends FetchTransactionsState {}

final class FetchTransactionsFailure extends FetchTransactionsState {
  final String errMessage;

  const FetchTransactionsFailure({required this.errMessage});
}
