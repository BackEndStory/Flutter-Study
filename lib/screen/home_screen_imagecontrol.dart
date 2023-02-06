import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'dart:typed_data';

import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:helloworld/component/main_app_bar.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:helloworld/component/footer.dart';
import 'package:helloworld/models/sticker_model.dart';
import 'package:helloworld/component/emoticon_sticker.dart';
import 'package:uuid/uuid.dart';


class HomeScreen8 extends StatefulWidget{
  const HomeScreen8({Key? key}): super(key: key);

  @override
  State<HomeScreen8> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen8>{
  Set<StickerModel> stickers = {};
  String? selectedId;
  XFile? image;
  GlobalKey imgkey = GlobalKey();

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
            if(image != null)
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Footer(onEmotionTap:onEmoticonTap)
              )
          ],
        ),
      )
    );
  }
  Widget renderBody(){
    if(image != null){
      return RepaintBoundary(
        key: imgkey,
        child:Positioned.fill(
            child: InteractiveViewer(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.file(
                      File(image!.path),
                      fit: BoxFit.cover,
                    ),
                    ...stickers.map(
                            (sticker)=> Center(
                          child: EmoticonSticker(
                            key: ObjectKey(sticker.id),
                            onTransform: (){ onTransform(sticker.id);
                            },
                            imgpath: sticker.imgPath,
                            isSelected: selectedId == sticker.id,
                          ),
                        )
                    )
                  ],
                )
            )
        ),
      ) ;


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
  void onEmoticonTap(int index) async{
    setState(() {
      stickers = {
        ...stickers,
        StickerModel(
          id:Uuid().v4(),
          imgPath: 'assets/img/emoticon_${index}.png'
        )
      };
    });

  }
  void onPickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      this.image = image;
    });
  }
  void onTransform(String id){
    setState(() {
      selectedId = id;
    });
  }
  void onSaveImage() async{
    RenderRepaintBoundary boundary = imgkey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format:ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    await ImageGallerySaver.saveImage(pngBytes,quality: 100);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('저장되었습니다!')
      )
    );
  }
  void onDeleteItem() async{
    setState(() {
      stickers = stickers.where((sticker) => sticker.id != selectedId).toSet();
    });
  }
}