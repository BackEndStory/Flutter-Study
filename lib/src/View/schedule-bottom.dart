

import 'package:flutter/material.dart';
import 'package:helloworld/src/View/custom-text-field.dart';
import 'package:helloworld/src/const/colors.dart';

class ScheduleBottom extends StatefulWidget{
  const ScheduleBottom({
    Key? key
}):super(key:key);

  @override
  State<ScheduleBottom> createState() => _ScheduleBottomState();
}

class _ScheduleBottomState extends State<ScheduleBottom>{

  @override
  Widget build(BuildContext context){
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return SafeArea(child: Container(
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
                ),
                ),
                const SizedBox(width: 16,),
                Expanded(child: CustomTextField(
                  label: '종료시간',
                  isTime: true,
                )
                ),

              ],
            ),
            const SizedBox(width: 8,),
            Expanded(child: CustomTextField(
              label: '내용',
              isTime: false,
            )
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onSavePressed,
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
    );
  }

  void onSavePressed(){}
}