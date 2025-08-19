import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  final int? id;
  final String? userId;
  final int? amount;
  final String? type;
  final DateTime? date;

  const TransactionModel({
    this.id,
    this.userId,
    this.amount,
    this.type,
    this.date,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'] as int?,
      userId: json['userId'] as String?,
      amount: json['amount'] as int?,
      type: json['type'] as String?,
      date: json['date'] == null
          ? null
          : DateTime.parse(json['date'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'amount': amount,
    'type': type,
    'date': date?.toIso8601String(),
  };

  TransactionModel copyWith({
    int? id,
    String? userId,
    int? amount,
    String? type,
    DateTime? date,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      amount: amount ?? this.amount,
      type: type ?? this.type,
      date: date ?? this.date,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, userId, amount, type, date];
}
