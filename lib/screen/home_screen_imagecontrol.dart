

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/component/main_app_bar.dart';
import 'package:image_picker/image_picker.dart';


class HomeScreen8 extends StatefulWidget{
  const HomeScreen8({Key? key}): super(key: key);

  @override
  State<HomeScreen8> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen8>{

  XFile? image;

  @override
  Widget build(BuildContext context){
    return Scaffold(

      body: SafeArea(
        child:  Stack(
          fit: StackFit.expand,
          children: [
            renderBody(),
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: MainAppBar(
                  onPickImage: onPickImage,
                  onSaveImage: onSaveImage,
                  onDeleteItem: onDeleteItem,
                )
            ),
          ],
        ),
      )
    );
  }
  Widget renderBody(){
    if(image != null){
      return Positioned.fill(child: InteractiveViewer(
            child: Image.file(
                File(image!.path),
                fit: BoxFit.cover,
            ),
      )
      );
    }else{
      return Center(
        child: TextButton(
          style: TextButton.styleFrom(primary: Colors.grey),
          onPressed: onPickImage,
          child: Text('이미지 선택하기'),
        ),
      );
    }
  }
  void onPickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      this.image = image;
    });
  }
  void onSaveImage(){}
  void onDeleteItem(){}
}