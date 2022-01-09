import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saudade/screens/house_screen.dart';
import 'package:saudade/screens/main_screen.dart';
import 'package:saudade/screens/preparing_screen.dart';
import 'package:saudade/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Saudade',
      theme: ThemeData.dark(),
      //theme: ThemeData(brightness: Brightness.dark,),
      initialRoute: "houseScreen",  // "/"
      routes: {
        "/" : (context) => SplashScreen(),
        "mainScreen" : (context) => MainScreen(),
        "houseScreen" : (context) => HouseScreen(),
        "preparingScreen" : (context) => PreparingScreen(),
      },
    );
  }
}