import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:helloworld/src/const/colors.dart';
class CalendarMain extends StatelessWidget{
  final OnDaySelected onDaySelected;
  final DateTime selectdDate;


  CalendarMain({
    required this.onDaySelected,
    required this.selectdDate,
});

  @override
  Widget build(BuildContext context){
    return TableCalendar(
        locale: 'ko_kr',
        onDaySelected: onDaySelected,
        selectedDayPredicate: (date) =>
           date.year == selectdDate.year &&
           date.month == selectdDate.month &&
           date.day == selectdDate.day,


        firstDay: DateTime(1900,1,1),
        lastDay: DateTime(2500,1,1),
        focusedDay: DateTime.now(),
        headerStyle: HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
          titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16,
          ),
        ),
      calendarStyle: CalendarStyle(
        isTodayHighlighted: false,
        defaultDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color:LIGHT_GREY_COLOR,
        ),
        weekendDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color:LIGHT_GREY_COLOR,
        ),
        selectedDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: PRIMARY_COLOR,
            width: 1,
          ),
        ),
        defaultTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: DARK_GREY_COLOR,
        ),
        weekendTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: DARK_GREY_COLOR,
        ),
        selectedTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: PRIMARY_COLOR,
        )
      ),
    );
  }
}