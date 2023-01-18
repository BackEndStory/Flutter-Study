import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(Myapp());
}
 class Myapp extends StatelessWidget{
  @override
   Widget build(BuildContext context){        // 위젯을 반환하고 build 이름의 매개변수의 형은 BuildContext이다
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        body:SafeArea(
          top: true,
          bottom: true,
          left: true,
          right: true,
          child:Container(
            color:Colors.red,
            height:300,
            width:300
      )

        // Center(
        //   child:Container(
        //     color: Colors.black,
        //     child: Container(
        //
        //       color: Colors.lime,
        //       margin: EdgeInsets.all(3),          // Magin
        //       child: Padding(                     //Padding
        //         padding: EdgeInsets.all(
        //           2
        //       ),
        //       child: Container(
        //         color: Colors.amber,
        //         width: 50,
        //         height: 50,
        //       ),
        //     ),
        //     ),
          // child:SizedBox(
          //   height: 200,
          //   width: 200,
            // child: Container(
            //   color: Colors.blue,
            // ),
          )

          // child:Container(
          //   decoration: BoxDecoration(
          //     color: Colors.red,
          //     border: Border.all(
          //       width: 10,
          //       color:Colors.black
          //     ),
          //     borderRadius: BorderRadius.circular(10)
          //   ),
          //   height: 200,
          //   width: 100,
          // )
          
          // child: InkWell(
          //   onTap: (){
          //     print('on Tap');
          //   },
          //   onDoubleTap: (){
          //     print('Double Tap');
          //   },
          //   onLongPress: (){
          //     print('LongPress Tap');
          //   },
          //
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: Colors.lime,
          //     ),
          //     width:100,
          //     height: 100,
          //   ),
          // ),
         //  child:Column(
         //   mainAxisAlignment: MainAxisAlignment.center,
         //    children: [
         //      Text(
         //        '이승렬',
         //        style: TextStyle(
         //          fontSize: 20.0,
         //          fontWeight: FontWeight.w700,
         //          color: Colors.green,
         //        ),
         //      ),
         //      TextButton(
         //        onPressed: (){},
         //        style: TextButton.styleFrom(
         //          foregroundColor: Colors.red,
         //        ),
         //        child: Text('Text Button'),
         //      ),
         //      OutlinedButton(
         //          onPressed: (){},
         //          style: OutlinedButton.styleFrom(
         //            foregroundColor: Colors.green,
         //          ),
         //          child: Text('Outline Button')
         //      ),
         //      ElevatedButton(
         //          onPressed: (){},
         //          style:ElevatedButton.styleFrom(
         //            backgroundColor: Colors.black,
         //            foregroundColor: Colors.lime
         //          ),
         //          child: Text('Elevate Button')
         //      ),
         //      IconButton(
         //          onPressed: (){},
         //          icon: Icon(
         //            Icons.add,
         //          ),
         //      ),
         //    ],
         //
         // )
       // ),
      )
    );
  }
 }
class FloatingActionButtonExample extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){ print('click');},
          child: Text('클릭'),
        ),
        body: Container(),
      )
    );
  }
}
