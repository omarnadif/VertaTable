import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vertatable/src/constants/constantsColors.dart';
import 'package:intl/intl.dart';

class DateNavigation extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const DateNavigation({Key? key, required this.onDateSelected}) : super(key: key);

  @override
  _DateNavigationState createState() => _DateNavigationState();
}

class _DateNavigationState extends State<DateNavigation> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = 'fr_FR';
  }

  bool _isWeekend(DateTime day) {
    return day.weekday == DateTime.saturday || day.weekday == DateTime.sunday;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(color: tPrimaryColor, width: 3.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, -3),
          ),
        ],
        gradient: LinearGradient(
          colors: [Colors.white, Colors.grey.shade50],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: TableCalendar(
        locale: 'fr_FR',
        firstDay: DateTime.utc(2022, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!_isWeekend(selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
            widget.onDateSelected(selectedDay);
          }
        },
        calendarFormat: CalendarFormat.week,
        availableCalendarFormats: const {
          CalendarFormat.week: '',
        },
        daysOfWeekHeight: 16.0,
        rowHeight: 40.0,
        calendarStyle: CalendarStyle(
          selectedDecoration: const BoxDecoration(
            color: tAccentColor,
            shape: BoxShape.circle,
          ),
          todayDecoration: const BoxDecoration(
            color: tSecondaryColor,
            shape: BoxShape.circle,
          ),
          todayTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: tDarkColor,
          ),
          selectedTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          defaultTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: tAccentColor,
          ),
          weekendTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
          disabledTextStyle: const TextStyle(
            color: Colors.grey,
          ),
        ),
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(
            fontSize: 0,
          ),
          leftChevronVisible: false,
          rightChevronVisible: false,
        ),
        daysOfWeekStyle: const DaysOfWeekStyle(
          weekendStyle: TextStyle(color: Colors.grey, fontSize: 14.0, fontWeight: FontWeight.bold),
          weekdayStyle: TextStyle(color: tDarkColor, fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}


