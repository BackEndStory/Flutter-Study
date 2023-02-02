

import 'package:helloworld/screen/cam_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen6 extends StatelessWidget{
  const HomeScreen6({Key? key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
     backgroundColor: Colors.blue[100],
     body: SafeArea(
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           children: [
             Expanded(child: _Logo()),
             Expanded(child: _Image()),
             Expanded(child: _EntryButton()),
           ],
         ),
       ),
     ) ,
    );
  }
}

class _Logo extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.blue[300]!,
              blurRadius: 12,
              spreadRadius: 2,

            )
          ]
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.videocam,
                color:Colors.white,
                size: 40,
              ),
              SizedBox(width: 12,),
              Text('Live',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                letterSpacing: 4.0
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Center(
      child: Image.asset('assets/img/home_img.png'),
    );
  }
}

class _EntryButton extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_)=> CamScreen())
          );
        }, child: Text('입장하기'))
      ],
    );
  }
}