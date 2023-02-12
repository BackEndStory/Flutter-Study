
// import 'package:helloworld/screen/home_screen.dart';
// import 'package:helloworld/screen/home_screen_pageView.dart';
// import 'package:helloworld/screen/u_and_i.dart';
// import 'package:helloworld/screen/home_screen_navigation.dart';
// import 'package:helloworld/const/colors.dart';
// import 'package:helloworld/screen/root_screen.dart';
// import 'package:helloworld/screen/home_screen_playlist.dart';
// import 'package:camera/camera.dart';
// import 'package:helloworld/screen/home_screen_camera.dart';
// import 'package:helloworld/screen/home_screen_location.dart';
// import 'package:helloworld/screen/home_screen_imagecontrol.dart';
// import 'package:helloworld/screen/home_screen_httpdio.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/src/View/app.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:helloworld/src/Model/Repository/local-database.dart';
import 'package:get_it/get_it.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();

  final database = LocalDatabase();
  GetIt.I.registerSingleton<LocalDatabase>(database);

  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen11()
          ),

  );
}
// void main(){
//   runApp(
//       MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: HomeScreen9(),
//       )
//   );
// }


// void main(){
//   runApp(
//       MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: HomeScreen8(),
//       )
//   );
// }

// void main(){
//   runApp(
//       MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: HomeScreen7(),
//       )
//   );
// }

// void main(){
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomeScreen6(),
//     )
//   );
// }




// late List<CameraDescription> _cameras;
// Future<void> main() async{
//   WidgetsFlutterBinding.ensureInitialized(); //앱 실행될 준비확인
//   _cameras = await availableCameras();
//   runApp(const CameraApp());
// }
//
// class CameraApp extends StatefulWidget{
//   const CameraApp({Key? key}) : super(key: key);
//   @override
//   State<CameraApp> createState() => _CameraAppState();
// }
//
// class _CameraAppState extends State<CameraApp>{
//   late CameraController controller;
//
//   @override
//   void initState(){
//     super.initState();
//     initalizeCamera();
//   }
//   initalizeCamera() async {
//     try {
//       controller = CameraController(_cameras[0], ResolutionPreset.max);
//
//       await controller.initialize();
//       setState(() {});
//     }catch(e){
//         if(e is CameraException){
//           switch(e.code){
//             case 'CameraAccessDenied':
//               print('User denied camera access');
//               break;
//             default:
//               print('Handle other errors');
//               break;
//           }
//         }
//     }
//   }
//   @override
//   void dispose(){
//     controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context){
//     if(!controller.value.isInitialized){
//       return Container();
//     }
//     return MaterialApp(
//       home: CameraPreview(controller),
//     );
//   }
// }











// void main(){
//   runApp(
//       MaterialApp(
//         home: HomeScreen5(),
//       )
//   );
// }



// void main() {
//   runApp(
//
//       MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         scaffoldBackgroundColor: backgroundColor,
//         sliderTheme: SliderThemeData(
//           thumbColor: primaryColor,
//           activeTrackColor: primaryColor,
//           inactiveTrackColor: primaryColor.withOpacity(0.3),
//         ),
//
//         bottomNavigationBarTheme: BottomNavigationBarThemeData(
//           selectedItemColor: primaryColor,
//           unselectedItemColor: secondaryColor,
//           backgroundColor: backgroundColor,
//         )
//       ),
//       home:RootScreen(),
//      )
//   );
// }
// void main() {
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         fontFamily: 'sunflower',
//         textTheme: TextTheme(
//           headline1: TextStyle(
//             fontFamily: 'parisienne',
//             color: Colors.white,
//             fontSize: 80,
//             fontWeight: FontWeight.w700,
//
//           ),
//           headline2: TextStyle(
//             color: Colors.white,
//             fontSize: 50,
//             fontWeight: FontWeight.w700,
//           ),
//           bodyText1: TextStyle(
//             color: Colors.white,
//             fontSize: 30,
//           ),
//           bodyText2: TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//           ),
//         )
//       ),
//       home:HomeScreen3(),
//     )
//   );
// }