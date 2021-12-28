
import 'package:flutter/material.dart';
import 'package:saudade/contextExtension.dart';
import 'package:saudade/models/character.dart';

class GameHouseScreen extends StatefulWidget {
  const GameHouseScreen({ Key? key }) : super(key: key);

  @override
  _GameHouseScreenState createState() => _GameHouseScreenState();
}

class _GameHouseScreenState extends State<GameHouseScreen> {
  
  Color sideColorRed = Color(0xFF8D021F);
  Color sideColorAmber = Color(0xFFcd853f);
  Color sideColorYellow = Color(0xFFfcba03);
  Color btnSurfaceColor = Color(0xFF545454);

  Character c1 = new Character(id: 1,name: "Tolga", image: "", hungerRate: 1, tirednessRate: 1, sicknessRate: 1);
  Character c2 = new Character(id: 2,name: "Levent", image: "", hungerRate: 0.9, tirednessRate: 0.75, sicknessRate: 0.95);
  Character c3 = new Character(id: 3,name: "Bilo", image: "", hungerRate: 0.9, tirednessRate: 0.7, sicknessRate: 0.95);
  late Character selectedChar;

  final img = "https://picsum.photos/200";

  dynamic showMenu;


  @override
  Widget build(BuildContext context) {

    selectedChar=c1;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            width: context.dynamicWidth(1),
            height: context.dynamicHeigh(1),
            decoration: BoxDecoration(
              //color: Colors.red,
              border: Border.all(color: Colors.white38),
              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            ),
            child: Column(
              children: [
                /////////////////////     üst alan     ////////////////////
                Expanded(
                  child: Row(
                    children: [
                      Expanded(flex: 1,child: GestureDetector(child: portrait(context, sideColorYellow),onTap: (){print(c1.hungerRate); setState(() {}); },)),
                      //Expanded(flex: 1,child: GestureDetector(child: portrait(context, sideColorYellow),onTap: (){print(c2.hp); },)),
                      //Expanded(flex: 1,child: GestureDetector(child: portrait(context, sideColorYellow),onTap: (){print(c3.hp); },)),
                     ////         Day-Time    //// düzenle
                      Expanded(flex: 1,child: clockduzenlencek(context),),

                      Expanded(flex: 2,child: menuButton(context, "Inventory",sideColorAmber)),
                      Expanded(flex: 1, child: menuButton(context,"Exit",sideColorRed)),
                    ],
                  ),
                ),


                ///     orta alan   ///
                Expanded( flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: context.dynamicWidth(1),
                      color: Colors.white30,
                      child: characterInfo(context, selectedChar),      /////////////////////
                    ),
                  ),
                ),


              ////  Alt   //
              Expanded( flex: 1,
                child: Row(
                  children: [
                    Expanded(flex: 2, child: menuButton(context,"Craft",sideColorAmber)),
                    Expanded(flex: 2, child: menuButton(context,"Cook",sideColorAmber)),
                    Expanded(flex: 2, child: menuButton(context,"Traps",sideColorAmber)),
                    Expanded(flex: 2, child: menuButton(context,"Info",sideColorAmber)),
                    Expanded(flex: 3, child: menuButton(context,"Finish Day",sideColorAmber)),
                  ],
                ),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget characterInfo(BuildContext context,Character char){
    return ListView(
      children: [
        Center(child: Text("${char.name}" , style: context.theme.textTheme.headline5?.copyWith(color: Colors.white))),
        Center(child: Text("Health : ${char.hp}" , style: context.theme.textTheme.headline6?.copyWith(color: Colors.white))),
        Text(""),
        Center(child: Text("Mood : ${char.mood}" , style: context.theme.textTheme.headline6?.copyWith(color: Colors.white))),



        //Center(child: Text("${char.name}'s Journal" , style: context.theme.textTheme.headline5?.copyWith(color: Colors.white))),    
      ],
    );
  }

  SizedBox clockduzenlencek(BuildContext context) {
    return SizedBox(
                      height: context.dynamicHeigh(0.2),
                        child: Card(color: Color(0xFF444444),
                          child: Column(
                            children: [
                              Expanded(child: Center(child: Text("Day 1"))),
                              Expanded(child: Center(child: Text("12:30"))),
                            ],
                          ),
                        ),
                      );
  }


  Padding portrait(BuildContext context,Color sideColor) {
    return Padding(
    padding: const EdgeInsets.all(4.0),
    child: SizedBox(
      height: context.dynamicHeigh(0.2),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(img),
              fit: BoxFit.cover),
          border: Border.all(color: sideColor),
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    ),
  );
  }

  Widget menuButton(BuildContext context,String btnText,Color sideColor) {
    return Padding(
      padding: const EdgeInsets.all(2.5),
      child: Container(
        height: double.infinity,
        child: Center(child: Text(btnText, style: context.theme.textTheme.headline5,)),
        decoration: BoxDecoration(
          color: btnSurfaceColor,
          border: Border.all(color: sideColor),
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
    );
  }
}

