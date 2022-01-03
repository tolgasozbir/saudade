import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saudade/utils/characterList.dart';
import 'package:saudade/screens/houseScreen.dart';
import 'package:saudade/screens/mainScreen.dart';
import 'package:saudade/screens/preparingScreen.dart';
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
      initialRoute: "houseScreen",  // "/"
      routes: {
        "/" : (context) => SplashScreen(),
        "mainScreen" : (context) => MainScreen(),
        "houseScreen" : (context) => HouseScreen(),
        "preparingScreen" : (context) => PreparingScreen(c1: CharacterList.c1, c2: CharacterList.c2, c3: CharacterList.c3,),
      },
    );
  }
}