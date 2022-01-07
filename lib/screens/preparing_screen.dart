import 'dart:math';

import 'package:flutter/material.dart';
import 'package:saudade/custom_widgets/day_indicator.dart';
import 'package:saudade/custom_widgets/heater.dart';
import 'package:saudade/custom_widgets/portrait.dart';
import 'package:saudade/custom_widgets/traps.dart';
import 'package:saudade/utils/game_mechanics.dart';
import 'package:saudade/models/character.dart';
import 'package:saudade/utils/context_extension.dart';

class PreparingScreen extends StatefulWidget {
  const PreparingScreen({required this.c1,required this.c2,required this.c3, Key? key}) : super(key: key);
  
  final Character? c1;
  final Character? c2;
  final Character? c3;

  @override
  _PreparingScreenState createState() => _PreparingScreenState();
}

class _PreparingScreenState extends State<PreparingScreen> {

  final img = "https://picsum.photos/200";
  int char1Value = 1;
  int char2Value = 1;
  int char3Value = 1;

  void setValue(int val){
    char1Value=val;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  Container buildBody() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(flex: 6, child: selectionChar1(char1Value)),
            Spacer(),
            Expanded(flex: 6, child: selectionChar2(char2Value)),
            Spacer(),
            Expanded(flex: 6, child: selectionChar3(char3Value)),
            Expanded(flex: 4, child: goLootIcon()),
          ],
        ),
      ),
    );
  }

  Widget goLootIcon() {
    return GestureDetector(
      child: Container(
        child: Stack(alignment: AlignmentDirectional.center,
          children: [
            Positioned(
              left: (context.dynamicWidth(0.168)*-1),
              child: Icon(
                Icons.keyboard_arrow_right,
                size: context.dynamicWidth(0.50),
                color: Colors.grey,
              )),
            Positioned(
              bottom: (context.dynamicWidth(0.05)),
              child: Text("Let's do it", style: context.theme.textTheme.headline5,)
            ),
            Positioned(
              top: (context.dynamicWidth(0.05)),
              child: Text("Let's do it", style: context.theme.textTheme.headline6,)
            ),
              
          ],
        ),
      ),
      onTap: (){
        GameMechanics gameMechanics= GameMechanics(char1Value,char2Value,char3Value);
        gameMechanics.inNight();
        Navigator.pushNamed(context, "houseScreen");
        setState(() {

          day++;
          temperature--;  //TODO: SOĞUKLUĞA GÖRE EVENT EKLE

          if (heaterIsActive) {
            heaterIsActive=false;
            temperature-=addFuelCounter*5;
            addFuelCounter=0;
          }
          
          if (trap1.isTrapActive) {
            trap1.ifThereIsMeat=Random().nextBool();
          }
          if (trap2.isTrapActive) {
            trap2.ifThereIsMeat=Random().nextBool();
          }


        });
      },
    );
  }


  //      SHIT CODE DONT LOOK DOWN    //
  // #region char1
  Widget selectionChar1(int groupValue) {
    return Column(
      children: [
        Portrait(onTap: (){}, image: img, height: 0.4,),
        Expanded(child: radioButton1("Sleep",1)),
        Expanded(child: radioButton1("Stay Guard",2)), 
        Expanded(child: radioButton1("Go Loot",3)),
      ],
    );
  }

  RadioListTile<int> radioButton1(String title,int value) {
    return RadioListTile(
      title: Text(title),
      value: value, 
      groupValue: char1Value, 
      onChanged: (int? val){
        setState(() { char1Value=val!; });
      }
    );
  }
  // #endregion char1

  // #region char2
  Widget selectionChar2(int groupValue) {
    return Column(
      children: [
        Portrait(onTap: (){}, image: img, height: 0.4,),
        Expanded(child: radioButton2("Sleep",1)),
        Expanded(child: radioButton2("Stay Guard",2)), 
        Expanded(child: radioButton2("Go Loot",3)),
      ],
    );
  }

  RadioListTile<int> radioButton2(String title,int value) {
    return RadioListTile(
      title: Text(title),
      value: value, 
      groupValue: char2Value, 
      onChanged: (int? val){
        setState(() { char2Value=val!; });
      }
    );
  }
  // #endregion char2

  // #region char3
  Widget selectionChar3(int groupValue) {
    return Column(
      children: [
        Portrait(onTap: (){}, image: img, height: 0.4,),
        Expanded(child: radioButton3("Sleep",1)),
        Expanded(child: radioButton3("Stay Guard",2)), 
        Expanded(child: radioButton3("Go Loot",3)),
      ],
    );
  }

  RadioListTile<int> radioButton3(String title,int value) {
    return RadioListTile(
      title: Text(title),
      value: value, 
      groupValue: char3Value, 
      onChanged: (int? val){
        setState(() { char3Value=val!; });
      }
    );
  }
  // #endregion char3
}