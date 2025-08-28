import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  final int? id;
  final String? userId;
  final String? type;
  final String? title;
  final num? amount;
  final String? category;
  final DateTime? date;

  const TransactionModel({
    this.id,
    this.userId,
    this.type,
    this.title,
    this.amount,
    this.category,
    this.date,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'] as int?,
      userId: json['userId'] as String?,
      type: json['type'] as String?,
      title: json['title'] as String?,
      amount: json['amount'] as num?,
      category: json['category'] as String?,
      date: json['date'] == null
          ? null
          : DateTime.parse(json['date'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'type': type,
    'title': title,
    'amount': amount,
    'category': category,
    'date': date?.toIso8601String(),
  };

  TransactionModel copyWith({
    int? id,
    String? userId,
    String? type,
    String? title,
    num? amount,
    String? category,
    DateTime? date,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      category: category ?? this.category,
      date: date ?? this.date,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, userId, type, title, amount, category, date];
}
