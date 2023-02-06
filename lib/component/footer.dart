

import 'package:flutter/material.dart';

typedef OnEmotionTap = Function(int id);
class Footer extends StatelessWidget{
  final OnEmotionTap onEmotionTap;
  Footer({
    required this.onEmotionTap,
    Key? key
    }):super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(

      color: Colors.white.withOpacity(0.9),
      height: 150,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(7,
                  (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.8),
                    child: GestureDetector(
                      onTap: (){
                        onEmotionTap(index+1);
                      },
                      child: Image.asset('assets/img/emoticon_${index+1}.png',height:100),

                    ),
                  )
          ),
        ),
      ),

    );
  }

}