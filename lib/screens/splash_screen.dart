import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void routeMainMenu(){
      Navigator.pushNamedAndRemoveUntil(context, "mainScreen", (route) => false);
    }

    Timer(Duration(seconds: 3),routeMainMenu );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Text("Saudade",style: TextStyle(fontSize: 36),),
          ),
        ),
      ),
    );
  }
}
