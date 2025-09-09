part of 'filtering_cubit.dart';

sealed class FilteringState extends Equatable {
  const FilteringState();

  @override
  List<Object> get props => [];
}

final class FilteringInitial extends FilteringState {}

final class FilteringSuccess extends FilteringState {
  final List<TransactionModel> filteredTransactions;

  const FilteringSuccess({required this.filteredTransactions});

  @override
  List<Object> get props => [filteredTransactions];
}
