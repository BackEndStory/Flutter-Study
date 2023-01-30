
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/component/custom_video_player.dart';

class HomeScreen5 extends StatefulWidget{

  const HomeScreen5({Key? key}) : super(key:key);
   @override
  State<HomeScreen5> createState() => _HomeScreen5();
}



class _HomeScreen5 extends State<HomeScreen5>{
  XFile? video;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      body: video == null ? renderEmpty() : renderVideo(),
    );
  }

  Widget renderEmpty(){
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: getBoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Logo(
            onTap: onNewVideoPressed,
          ),
          SizedBox(height: 30,),
          _AppName(),
        ],
      ),
    );
  }
  void onNewVideoPressed() async{
    final video = await ImagePicker().pickVideo(source: ImageSource.gallery,);
    if(video != null){
      setState((){
        this.video = video;
      }
      );
    }
  }

  Widget renderVideo(){
    return Center(
      child: CustomVideoPlayer( video: video!,),
    );
  }
}

BoxDecoration getBoxDecoration(){
  return BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end:Alignment.bottomCenter,
      colors: [
        Color(0xFF2A3A7C),
        Color(0xFF000118),
      ]
    )
  );
}


class _Logo extends StatelessWidget{
  final GestureTapCallback onTap;
  const _Logo({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child:   Image.asset('assets/img/logo1.png'),
    ) ;

  }
}

class _AppName extends StatelessWidget{
  const _AppName({Key? key}):super(key: key);
  @override
  Widget build(BuildContext context){
   final textStyle = TextStyle(
     color: Colors.white,
     fontSize: 30,
     fontWeight: FontWeight.w300,
   );

   return Row(
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
       Text('VIDEO',
         style: textStyle,
       ),
       Text('PLAYER',
        style: textStyle.copyWith(
          fontWeight: FontWeight.w700,
        ),
       )
     ],
   );
  }

}