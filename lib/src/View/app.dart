

import 'package:flutter/material.dart';
import 'package:helloworld/src/View/schedule-bottom.dart';
import 'package:helloworld/src/const/colors.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:helloworld/src/View/calendar-main.dart';
import 'package:helloworld/src/View/Schedule.dart';
import 'package:helloworld/src/View/today-banner.dart';
import 'package:get_it/get_it.dart';
import 'package:helloworld/src/Model/Repository/local-database.dart';

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
                 onDaySelected: onDaySelected,
               ),
               StreamBuilder<List<Schedule>>(
               stream: GetIt.I<LocalDatabase>().watchSchedules(selectedDate),
               builder: (context, snapshot){
                return TodayBanner(selectedDate: selectedDate, count: snapshot.data?.length ?? 0);
                 }
               ),
               SizedBox(height: 8,),
               Expanded(
                   child: StreamBuilder<List<Schedule>>(
                     stream: GetIt.I<LocalDatabase>().watchSchedules(selectedDate),
                     builder: (context, snapshot){
                       if(!snapshot.hasData){
                         return Container();
                       }
                       return ListView.builder(
                           itemCount: snapshot.data!.length,
                           itemBuilder: (context, index){
                             final schedule = snapshot.data![index];
                             return Dismissible(key: ObjectKey(schedule.id),
                               direction: DismissDirection.startToEnd,
                               onDismissed: (DismissDirection direction){
                               GetIt.I<LocalDatabase>().removeSchedule(schedule.id);
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
                       );
                     },
                   )
               )
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