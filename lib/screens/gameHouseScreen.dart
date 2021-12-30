
import 'package:flutter/material.dart';
import 'package:saudade/contextExtension.dart';
import 'package:saudade/custom_widgets/character_info.dart';
import 'package:saudade/custom_widgets/inventory_info.dart';
import 'package:saudade/custom_widgets/menu_button.dart';
import 'package:saudade/custom_widgets/portrait.dart';
import 'package:saudade/models/character.dart';
import 'package:saudade/models/item.dart';

import '../item_list.dart';

class GameHouseScreen extends StatefulWidget {
  const GameHouseScreen({ Key? key }) : super(key: key);

  @override
  _GameHouseScreenState createState() => _GameHouseScreenState();
}

class _GameHouseScreenState extends State<GameHouseScreen> {
  
  Color sideColorRed = Color(0xFF8D021F);
  Color sideColorAmber = Color(0xFFcd853f);
  Color btnSurfaceColor = Color(0xFF545454);

  Character c1 = new Character(id: 1,name: "Tolga", image: "", hungerRate: 0.5, tirednessRate: 0.7, sicknessRate: 0.9, injuryRate: 0.5 ,bagSize: 12);
  Character c2 = new Character(id: 2,name: "Levent", image: "", hungerRate: 0.9, tirednessRate: 0.75, sicknessRate: 0.95, injuryRate: 0.1, bagSize: 10);
  Character c3 = new Character(id: 3,name: "Bilo", image: "", hungerRate: 0.5, tirednessRate: 0.5, sicknessRate: 0.5,injuryRate: 0.5 , bagSize: 15);
  dynamic selectedMenu;
  bool isShowingInv = false;
  String selectedItemTxt = "";
  final img = "https://picsum.photos/200";

  List<String> itemNameList = [
    "Scrap","Circuit","Wood",
    "Bandage","Pills","Medical Herb","Ointment",
    "Canned Food","Cooked Meal","Raw Food",
  ];

  List<int> itemAmount = [
    0,0,0,
    0,0,0,0,
    0,0,0,
  ];
  
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
                      Expanded(flex: 1,child: portrait(c1)),
                      Expanded(flex: 1,child: portrait(c2)),
                      Expanded(flex: 1,child: portrait(c3)),
                       ////         Day-Time    //// düzenle
                      Expanded(flex: 1,child: clockduzenlencek(context),),













                      Expanded(flex: 2,child: MenuButton(
                        btnText: "Inventory",
                        onTap: () {
                          isShowingInv = true;
                          showMenu(InventoryInfo());
                        },
                      )), //item dışarda tanımlancak her yerden erişilcek
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      Expanded(flex: 1, child: MenuButton(btnText: "Exit",borderColor: Color(0xFF8D021F), borderWidth: 2, onTap: (){print("Exit");},)),
                    ],
                  ),
                ),

//selectedMenu=showInventory(context); isShowingInv = true;
                ///     orta alan   ///
                Expanded( flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      color: Colors.grey,
                      child: isShowingInv == true ? 
                      Row(
                        children: [
                          Expanded(flex: 4, child: selectedMenu ?? Container(child: Text("Boş"),),),
                          Expanded(flex: 3, child: Container(height: double.infinity, color: Colors.redAccent, child: Text(ItemList.selectedItem.name)),),
                        ],
                      ) :
                      selectedMenu,

                    )
                  ),
                ),


              ////  Alt   //
              Expanded( flex: 1,
                child: Row(
                  children: [
                    Expanded(flex: 2, child: MenuButton(onTap: null, btnText: "Craft")),
                    Expanded(flex: 2, child: MenuButton(onTap: null, btnText: "Cook")),
                    Expanded(flex: 2, child: MenuButton(onTap: null, btnText: "Traps")),
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
        isShowingInv = false;
        showMenu(CharacterInfo(char: char));
      },
    );
  }



  SizedBox clockduzenlencek(BuildContext context) {
    return SizedBox(
                      height: context.dynamicHeight(0.2),
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

  void showMenu(Widget widget) {
    setState(() {
      this.selectedMenu=widget;
    });

    List<Item> x = ItemList().itemList;
    for (var item in x) {
      if (item.name=="scrap") {
        print("burdaaaaaaaaaaaaaaaaaaaaaaaaaaa");
      }
    }
  }

}
