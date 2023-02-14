

import 'package:flutter/material.dart';
import 'package:helloworld/src/View/schedule-bottom.dart';
import 'package:helloworld/src/ViewModel/schudule-provider.dart';
import 'package:helloworld/src/const/colors.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:helloworld/src/View/calendar-main.dart';
import 'package:helloworld/src/View/Schedule.dart';
import 'package:helloworld/src/View/today-banner.dart';
import 'package:get_it/get_it.dart';
import 'package:helloworld/src/Model/Repository/local-database.dart';

class HomeScreen11 extends StatelessWidget {

  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context){

    final provider = context.watch<ScheduleProvider>();
    final selectedDate = provider.selectedDate;
    final schedules = provider.cache[selectedDate] ?? [];

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: PRIMARY_COLOR,
          onPressed: (){
            showModalBottomSheet(context: context,isDismissible: true, builder: (_)=> ScheduleBottom(selectedDate: selectedDate,),
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
                onDaySelected: (selectedDate, focusedDate)=> onDaySelected(selectedDate, focusedDate, context),
              ),
              TodayBanner(selectedDate: selectedDate, count: schedules.length),
              SizedBox(height: 8,),
              Expanded(
                  child:ListView.builder(
                        itemCount: schedules.length,
                        itemBuilder: (context, index){
                          final schedule = schedules[index];
                          return Dismissible(key: ObjectKey(schedule.id),
                          direction: DismissDirection.startToEnd,
                          onDismissed: (DismissDirection direction){
                          provider.deleteSchedule(date:selectedDate,id:schedule.id);
                          },

                          child: Padding(
                              padding: const EdgeInsets.only(bottom: 8, left: 8,right: 8),
                              child: SchedulCard(
                                startTime: schedule.startTime,
                                endTime: schedule.endTime,
                                content: schedule.content,
                              )
                          ) ,

                          );
                        },
                      )
                  )

            ],
          ),
        )
    );
  }
  void onDaySelected(DateTime selectedDate, DateTime focusedDate, BuildContext context){
    final provider = context.read<ScheduleProvider>();
    provider.changeSelectedDate(date: selectedDate);
    provider.getSchedules(date: selectedDate);
  }
}


