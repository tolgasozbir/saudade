
import 'package:flutter/material.dart';
import 'package:saudade/utils/context_extension.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [

              ElevatedButton(
                child: Container(
                  width: context.dynamicWidth(0.32),
                  height: context.dynamicHeight(0.16),
                  child: Center(child: Text("New Game", style: context.theme.textTheme.headline5,))),
                onPressed: (){
                  Navigator.pushNamed(context, "houseScreen");
                  //TODO: Reset everything
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF545454),
                  //padding: EdgeInsets.only(left:context.dynamicWidth(0.25), right: context.dynamicWidth(0.25)),
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    side: BorderSide(color: Color(0xFFAAAAAA)),
                  )
                ),
              ),

              ElevatedButton(
                child: Container(
                  width: context.dynamicWidth(0.32),
                  height: context.dynamicHeight(0.16),
                  child: Center(child: Text("Exit", style: context.theme.textTheme.headline5,))),
                onPressed: (){
                  
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF545454),
                  //padding: EdgeInsets.only(left:context.dynamicWidth(0.25), right: context.dynamicWidth(0.25)),
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    side: BorderSide(color: Color(0xFFAAAAAA)),
                  )
                ),
              ),












            ],
          ),
        ),
      ),
    );
  }
}