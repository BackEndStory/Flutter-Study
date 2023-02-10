//
//
//
// import 'package:flutter/material.dart';
// import 'package:helloworld/component/costom_youtube_player.dart';
// import 'package:helloworld/models/video_model.dart';
// import 'package:helloworld/repository/youtube_repository.dart';
//
//
//
// class HomeScreen9 extends StatefulWidget{
//   const HomeScreen9({Key? key}):super(key: key);
//
//   @override
//   State<HomeScreen9> createState() => _HomeScreen9State();
// }
//
//
//
//
//
//
// class _HomeScreen9State extends State<HomeScreen9>{
//
//
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           '이승렬'
//         ),
//       ),
//       body: FutureBuilder<List<VideoModel>>(
//         future: YoutubeRepository.getVideos(),
//         builder: (context,snapshot){
//           if(snapshot.hasError){
//             return Center(
//               child: Text(
//                 snapshot.error.toString()
//               ),
//             );
//           }
//           if(!snapshot.hasData){
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           return RefreshIndicator(
//               child:  ListView(
//                   physics: BouncingScrollPhysics(),
//                   children: snapshot.data!.map((e)=> CustomYoutubePlayer(videoModel: e)).toList()
//               ),
//               onRefresh: ()async{
//                 setState(() {
//
//                 });
//               }
//           );
//
//
//
//
//
//
//         },
//       )
//     );
//   }
// }