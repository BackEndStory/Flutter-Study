import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class HomeScreen2 extends StatefulWidget{
  const HomeScreen2({Key? key}) : super(key:key);
  @override
  State<HomeScreen2> createState() => _HomeScreen2();
}


class _HomeScreen2 extends State<HomeScreen2>{
  final PageController pageController = PageController();
  @override
  void initState(){
    super.initState();
    Timer.periodic(
      Duration(seconds: 3),
        (timer){
        int? nextPage = pageController.page?.toInt();
        if(nextPage == null){
          return;
        }
        if(nextPage == 4){
          nextPage=0;
        }
        else{
          nextPage++;
        }
        pageController.animateToPage(nextPage, duration: Duration(milliseconds: 500), curve: Curves.ease);
        }
    );
  }

  @override
  Widget build(BuildContext context){

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: PageView(
             controller: pageController,
             children:[1,2,3,4,5]
                 .map( (number)=> Image.asset('assets/img/image_$number.jpeg',
                 fit: BoxFit.cover
             ),
           ).toList(),
      )
    );
  }

}