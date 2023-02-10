

import 'package:flutter/material.dart';
import 'package:helloworld/src/View/schedule-bottom.dart';
import 'package:helloworld/src/const/colors.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:helloworld/src/View/calendar-main.dart';
import 'package:helloworld/src/View/Schedule.dart';
import 'package:helloworld/src/View/today-banner.dart';

class HomeScreen11 extends StatefulWidget {
  const HomeScreen11({Key? key}) :super(key: key);
  @override
  State<HomeScreen11> createState() => _HomeScreen11State();

}

class _HomeScreen11State extends State<HomeScreen11>{

  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: PRIMARY_COLOR,
        onPressed: (){
          showModalBottomSheet(context: context,isDismissible: true, builder: (_)=> ScheduleBottom(),
            isScrollControlled: true,
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: SafeArea(
        child: Column(
             children: [
               CalendarMain(
                 selectdDate: selectedDate,
                 onDaySelected: onDaySelected,
               ),
               TodayBanner(selectedDate: selectedDate, count: 1),
               SizedBox(height: 8,),
               SchedulCard(startTime: 12, endTime: 14, content: '프로그래밍 공부')
             ],
        ),
      )
    );
  }

  void onDaySelected(DateTime selectedDate, DateTime focusedDate){
    setState(() {
      this.selectedDate = selectedDate;
    });
  }
}