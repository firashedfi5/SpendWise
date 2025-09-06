import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 0)
class TransactionModel extends Equatable {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? userId;

  @HiveField(2)
  final String? type;

  @HiveField(3)
  final String? title;

  @HiveField(4)
  final double? amount;

  @HiveField(5)
  final String? category;

  @HiveField(6)
  final DateTime? date;

  @HiveField(7)
  final DateTime? createdAt;

  const TransactionModel({
    this.id,
    this.userId,
    this.type,
    this.title,
    this.amount,
    this.category,
    this.date,
    this.createdAt,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'] as int?,
      userId: json['userId'] as String?,
      type: json['type'] as String?,
      title: json['title'] as String?,
      amount: json['amount'] as double?,
      category: json['category'] as String?,
      date: json['date'] == null
          ? null
          : DateTime.parse(json['date'] as String),
      createdAt: json['date'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
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
    'createdAt': createdAt?.toIso8601String(),
  };

  TransactionModel copyWith({
    int? id,
    String? userId,
    String? type,
    String? title,
    double? amount,
    String? category,
    DateTime? date,
    DateTime? createdAt,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      category: category ?? this.category,
      date: date ?? this.date,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
    id,
    userId,
    type,
    title,
    amount,
    category,
    date,
    createdAt,
  ];
}
