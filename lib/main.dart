import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saudade/screens/gameHouseScreen.dart';
import 'package:saudade/screens/mainScreen.dart';
import 'package:saudade/screens/splashScreen.dart';

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
      initialRoute: "/",
      routes: {
        "/" : (context) => SplashScreen(),
        "mainScreen" : (context) => MainScreen(),
        "gameHouseScreen" : (context) => GameHouseScreen(),
      },
    );
  }
}