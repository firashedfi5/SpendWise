import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spendwise/core/constants.dart';
import 'package:spendwise/features/transactions/presentation/manager/add_transaction/add_transaction_cubit.dart';
import 'package:table_calendar/table_calendar.dart';

class ChooseDate extends StatefulWidget {
  const ChooseDate({super.key, required this.calendarColor});

  final Color calendarColor;

  @override
  State<ChooseDate> createState() => _ChooseDateState();
}

class _ChooseDateState extends State<ChooseDate> {
  DateTime today = DateTime.now();
  DateTime focusedDay = DateTime.now();
  // bool _initialized = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.calendarColor.withValues(alpha: 0.13),
        borderRadius: BorderRadius.circular(kBorderRadius24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TableCalendar(
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
          ),
          firstDay: DateTime.utc(2020, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          focusedDay: focusedDay,
          calendarFormat: CalendarFormat.week,
          availableCalendarFormats: const {CalendarFormat.week: 'Week'},

          calendarStyle: CalendarStyle(
            selectedDecoration: BoxDecoration(
              color: widget.calendarColor,
              shape: BoxShape.circle,
            ),
            todayDecoration: BoxDecoration(
              color: widget.calendarColor.withValues(alpha: 0.25),
              shape: BoxShape.circle,
            ),
            todayTextStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),

          availableGestures: AvailableGestures.all,
          selectedDayPredicate: (day) => isSameDay(day, today),
          onDaySelected: (selectedDay, newFocusedDay) {
            setState(() {
              today = selectedDay;
              focusedDay = newFocusedDay;
            });
            context.read<AddTransactionCubit>().date = selectedDay;
          },
        ),
      ),
    );
  }
}
