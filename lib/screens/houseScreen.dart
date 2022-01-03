import 'package:flutter/material.dart';
import 'package:saudade/contextExtension.dart';
import 'package:saudade/custom_widgets/character_info.dart';
import 'package:saudade/custom_widgets/day_indicator.dart';
import 'package:saudade/custom_widgets/inventory_info.dart';
import 'package:saudade/custom_widgets/menu_button.dart';
import 'package:saudade/custom_widgets/portrait.dart';
import 'package:saudade/models/character.dart';
import '../characterList.dart';
import '../item_list.dart';

class HouseScreen extends StatefulWidget {
  const HouseScreen({ Key? key }) : super(key: key);

  @override
  _HouseScreenState createState() => _HouseScreenState();
}

//TODO: preparing ekranında back tuşu çalışmasın
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
                      Expanded(flex: 1,child: portrait(CharacterList.c1)),
                      Expanded(flex: 1,child: portrait(CharacterList.c2)),
                      Expanded(flex: 1,child: portrait(CharacterList.c3)),
                       ////         Day-Time    //// düzenle
                      Expanded(flex: 1,child: DayIndicator()),  //TODO: Saat kısmı düzenlencek

                      Expanded(flex: 2,child: MenuButton(btnText: "Inventory",onTap: () =>showMenu(InventoryInfo()))),
                      
                          
                      Expanded(flex: 1, child: MenuButton(btnText: "Exit",borderColor: Color(0xFF8D021F), borderWidth: 2, onTap: (){print("Exit");},)),
                    ],
                  ),
                ),

                ///     orta alan   ///
                Expanded( flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      //color: Colors.grey,
                      child: selectedMenu,
                    )
                  ),
                ),


              ////  Alt   //
              Expanded( flex: 1,
                child: Row(
                  children: [
                    Expanded(flex: 3, child: MenuButton(onTap: null, btnText: "Craft")),
                    Expanded(flex: 2, child: MenuButton(onTap: null, btnText: "Cook")),
                    Expanded(flex: 2, child: MenuButton(onTap: null, btnText: "Traps")),
                    Expanded(flex: 2, child: MenuButton(onTap: null, btnText: "Radio")),
                    Expanded(flex: 2, child: MenuButton(onTap: null, btnText: "Heater")),
                    Expanded(flex: 2, child: MenuButton(onTap: null, btnText: "Info")),
                    Expanded(flex: 3, child: MenuButton(onTap: null, btnText: "Finish")),   //border color ver özel
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

  Portrait portrait(Character char) {
    return Portrait(
      image: img,
      onTap: () {
        print("Açlık : ${char.hungerRate} Yorgunluk : ${char.tirednessRate} Hataklık : ${char.sicknessRate} Yaralılık : ${char.injuryRate}");
        print("Hp : ${char.hp}");
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
