import 'package:intl/intl.dart';

String getMonthRangeStringWithIntl(int monthNumber, {int? year}) {
  year ??= DateTime.now().year;

  if (monthNumber < 1 || monthNumber > 12) {
    throw ArgumentError('Month number must be between 1 and 12');
  }

  final firstDay = DateTime(year, monthNumber, 1);

  final lastDay = DateTime(year, monthNumber + 1, 0);

  // Format the dates
  final monthFormatter = DateFormat('MMM');
  final dayFormatter = DateFormat('dd');

  final monthName = monthFormatter.format(firstDay);
  final firstDayStr = dayFormatter.format(firstDay);
  final lastDayStr = dayFormatter.format(lastDay);

  return '$firstDayStr $monthName - $lastDayStr $monthName';
}
