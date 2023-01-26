import 'package:flutter/material.dart';
import 'package:helloworld/screen/home_screen.dart';
import 'package:helloworld/screen/home_screen_pageView.dart';
import 'package:helloworld/screen/u_and_i.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'sunflower',
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: 'parisienne',
            color: Colors.white,
            fontSize: 80,
            fontWeight: FontWeight.w700,

          ),
          headline2: TextStyle(
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.w700,
          ),
          bodyText1: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
          bodyText2: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        )
      ),
      home:HomeScreen3(),
    )
  );
}