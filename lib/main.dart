import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}
 class Myapp extends StatelessWidget{
  @override
   Widget build(BuildContext context){        // 위젯을 반환하고 build 이름의 매개변수의 형은 BuildContext이다
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        body:Center(
          child: Text(
            '이승렬',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              color: Colors.green,
            ),
          )
        )
      )
    );
  }
 }

