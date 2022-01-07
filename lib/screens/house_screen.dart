import 'package:flutter/material.dart';
import 'package:saudade/custom_widgets/cooking.dart';
import 'package:saudade/custom_widgets/crafting.dart';
import 'package:saudade/custom_widgets/heater.dart';
import 'package:saudade/custom_widgets/radio.dart';
import 'package:saudade/custom_widgets/traps.dart';
import 'package:saudade/utils/context_extension.dart';
import 'package:saudade/custom_widgets/character_info.dart';
import 'package:saudade/custom_widgets/day_indicator.dart';
import 'package:saudade/custom_widgets/inventory_info.dart';
import 'package:saudade/custom_widgets/menu_button.dart';
import 'package:saudade/custom_widgets/portrait.dart';
import 'package:saudade/models/character.dart';
import '../utils/character_list.dart';
import '../utils/item_list.dart';

class HouseScreen extends StatefulWidget {
  const HouseScreen({ Key? key }) : super(key: key);

  @override
  _HouseScreenState createState() => _HouseScreenState();
}

class _HouseScreenState extends State<HouseScreen> {

  @override
  void initState() {
    super.initState();
    ItemList.selectedItem=ItemList().myInvItemList[0];

  }

  dynamic selectedMenu;
  final img = "https://picsum.photos/200";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            width: context.dynamicWidth(1),
            height: context.dynamicHeight(1),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white38),
              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            ),
            child: Column(
              children: [

                Expanded(flex: 1, child: top()),
                Expanded(flex: 3, child: middle()),
                Expanded(flex: 1, child: bottom()),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Row top() {
    return Row(
      children: [
        Expanded(flex: 1,child: portrait(CharacterList.c1)),
        Expanded(flex: 1,child: portrait(CharacterList.c2)),
        Expanded(flex: 1,child: portrait(CharacterList.c3)),
        Expanded(flex: 1,child: DayIndicator()),  //TODO: Saat kısmı düzenlencek
        Expanded(flex: 2,child: myButton("Inventory", InventoryInfo())),
        Expanded(flex: 1, child: exitButton()),
      ],
    );
  }

  Padding middle() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        child: selectedMenu,
      )
    );
  }

  Row bottom() {
    return Row(
      children: [
        Expanded(flex: 3, child: myButton("Craft", Crafting())),
        Expanded(flex: 2, child: myButton("Cook", Cooking())),
        ItemList.craftingItems[1].amount == 1 ?  Expanded(flex: 2, child: myButton("Traps", Traps()))     : const SizedBox(),
        ItemList.craftingItems[2].amount == 1 ?  Expanded(flex: 2, child: myButton("Radio", RadioMenu())) : const SizedBox(),
        ItemList.craftingItems[3].amount == 1 ?  Expanded(flex: 2, child: myButton("Heater", Heater()))   : const SizedBox(),
        Expanded(flex: 2, child: myButton("Info", Crafting())),
        Expanded(flex: 3, child: finishDayButton(context)),
      ],
    );
  }

  MenuButton exitButton() {
    return MenuButton(
      btnText: "Exit",
      borderColor: Color(0xFF8D021F), 
      borderWidth: 2, 
      onTap: (){print("Exit");},  //TODO: exit 
    );
  }

  MenuButton myButton(String btnText, Widget widgetMenu){
    return MenuButton(
      btnText: btnText,
      onTap: ()=> showMenu(widgetMenu),
    );
  }

  MenuButton finishDayButton(BuildContext context) {
    return MenuButton(
      borderColor: Color(0xFF33AA33), 
      btnText: "Finish Day", 
      onTap: () => {Navigator.pushNamedAndRemoveUntil(context, "preparingScreen", (route) => false)} 
    );
  }
  

  Portrait portrait(Character char) {
    return Portrait(
      image: img,
      onTap: () {
        print("                     Su : ${char.thirstinessRate} - Açlık : ${char.hungerRate} - Yorgunluk : ${char.tirednessRate} - Hastalık : ${char.sicknessRate} - Sakatlanma : ${char.injuryRate}");
        print("isAlive? : ${char.isAlive}");
        showMenu(CharacterInfo(char: char));
      },
    );
  }

  void showMenu(Widget widget) {
    setState(() {
      this.selectedMenu=widget;
    });
  }

}
