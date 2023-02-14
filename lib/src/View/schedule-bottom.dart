

import 'package:flutter/material.dart';
import 'package:helloworld/src/View/custom-text-field.dart';
import 'package:helloworld/src/ViewModel/schudule-provider.dart';
import 'package:helloworld/src/const/colors.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:get_it/get_it.dart';
import 'package:helloworld/src/Model/Repository/local-database.dart';
import 'package:helloworld/src/Model/DataSource/remote_datasource.dart';
import 'package:helloworld/src/Model/Repository/schedule-repository.dart';
import 'package:provider/provider.dart';

class ScheduleBottom extends StatefulWidget{
  final DateTime selectedDate;

  const ScheduleBottom({
    required this.selectedDate,
    Key? key
}):super(key:key);

  @override
  State<ScheduleBottom> createState() => _ScheduleBottomState();
}

class _ScheduleBottomState extends State<ScheduleBottom>{
  final GlobalKey<FormState> formKey = GlobalKey();

  int? startTime;
  int? endTime;
  String? content;
  @override
  Widget build(BuildContext context){
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return Form(
      key: formKey,
      child: SafeArea(
          child: Container(
          height: MediaQuery.of(context).size.height/2 + bottomInset,
          color: Colors.white,
          child: Padding(
            padding:  EdgeInsets.only(left: 8,right: 8,top: 8, bottom:bottomInset),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child:CustomTextField(
                      label: '시작시간',
                      isTime: true,
                      onSaved: (String? val){
                        startTime = int.parse(val!);
                      },
                      validator: timeValidator,
                    ),
                    ),
                    const SizedBox(width: 16,),
                    Expanded(child: CustomTextField(
                      label: '종료시간',
                      isTime: true,
                      onSaved: (String? val){
                        endTime = int.parse(val!);
                      },
                      validator: timeValidator,
                    )
                    ),

                  ],
                ),
                const SizedBox(width: 8,),
                Expanded(child: CustomTextField(
                  label: '내용',
                  isTime: false,
                  onSaved: (String? val){
                    content =val;
                  },
                  validator: contentValidator,
                )
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => onSavePressed(context),
                    style: ElevatedButton.styleFrom(
                      primary: PRIMARY_COLOR,
                    ),
                    child: Text('저장'),
                  ),
                )
              ],
            ),
          )
      )
      ),
    );
  }

  void onSavePressed(BuildContext context) async {
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      context.read<ScheduleProvider>().createSchedule(
          schedule: ScheduleModel(id: 'new_models', content: content!, date: widget.selectedDate, startTime: startTime!, endTime: endTime!),
      );

     Navigator.of(context).pop();
    }
  }
  String? timeValidator(String? val){
    if(val == null){
      return '값을 입력해주세요';
    }
    int? number;
    try{
      number = int.parse(val);
    }catch(e){
      return '숫자를 입력해주세요';
    }
    if(number < 0 || number > 24){
      return '0시부터 24시 사이를 입력해주세요';
    }
    return null;
  }
  String? contentValidator(String? val){
    if(val == null || val.length == 0){
      return '값을 입력해주세요';
    }
    return null;
  }
}