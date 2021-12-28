


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

  Character c1 = new Character(id: 1,name: "Tolga", image: "", hungerRate: 0.7, tirednessRate: 0.7, sicknessRate: 0.9, injuryRate: 0.5 ,bagSize: 12);
  Character c2 = new Character(id: 2,name: "Levent", image: "", hungerRate: 0.9, tirednessRate: 0.75, sicknessRate: 0.95, injuryRate: 0.1, bagSize: 10);
  Character c3 = new Character(id: 3,name: "Bilo", image: "", hungerRate: 0.9, tirednessRate: 0.9, sicknessRate: 0.75,injuryRate: 0.05 , bagSize: 15);
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
                      Expanded(flex: 1,child: GestureDetector(child: portrait(context, sideColorYellow),onTap: (){selectedMenu=characterInfo(context,c1); isShowingInv = false;setState(() {}); },)),
                      Expanded(flex: 1,child: GestureDetector(child: portrait(context, sideColorYellow),onTap: (){selectedMenu=characterInfo(context,c2); isShowingInv = false;setState(() {}); },)),
                      Expanded(flex: 1,child: GestureDetector(child: portrait(context, sideColorYellow),onTap: (){selectedMenu=characterInfo(context,c3); isShowingInv = false; setState(() {}); },)),
                     ////         Day-Time    //// düzenle
                      Expanded(flex: 1,child: clockduzenlencek(context),),

                      Expanded(flex: 2,child: GestureDetector(child: menuButton(context, "Inventory",sideColorAmber), onTap: (){selectedMenu=showInventory(context); isShowingInv = true;  setState(() {}); },)),
                      Expanded(flex: 1, child: menuButton(context,"Exit",sideColorRed)),
                    ],
                  ),
                ),


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
                          Expanded(flex: 3, child: Container(height: double.infinity, color: Colors.redAccent, child: Text(selectedItemTxt),),),
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

  Widget showInventory(BuildContext context) {
    return SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
            Text("Inventory" , style: context.theme.textTheme.headline5?.copyWith(color: Colors.white)),
            
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 10/8,
              ),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Expanded(flex: 5, child: GestureDetector(child: Card(color: Colors.black12, child: Image.asset("assets/scrap.png",fit: BoxFit.fill,),),onTap: (){selectedItemTxt=itemNameList[index]; setState(() {}); },)),
                    Expanded(child: Text(itemNameList[index] + " x" +itemAmount[index].toString())), 
                  ],
                );
              },
            ),
          ],
        ),
      );
  }


  Widget characterInfo(BuildContext context,Character char){
    return SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
            Text("${char.name}" , style: context.theme.textTheme.headline5?.copyWith(color: Colors.white)),
            Text("Mood : ${char.mood}" , style: context.theme.textTheme.headline6?.copyWith(color: Colors.white)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${char.name}'s Journal" , style: context.theme.textTheme.headline5?.copyWith(color: Colors.white)),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:20,
              itemBuilder: (context,index){
                return  Center(child: Text('Some text'));
            }),
          ],
        ),
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

 /*Expanded(flex: 1, child: Text("${char.name}" , style: context.theme.textTheme.headline5?.copyWith(color: Colors.white))),
        //Expanded(child: Center(child: Text("Health : ${char.hp}" , style: context.theme.textTheme.headline6?.copyWith(color: Colors.white)))),
        Expanded(flex: 2, child: Center(child: Text("Mood : ${char.mood}" , style: context.theme.textTheme.headline6?.copyWith(color: Colors.white)))),
        Expanded(flex: 2, child: Center(child: Text("${char.name}'s Journal" , style: context.theme.textTheme.headline5?.copyWith(color: Colors.white)))),
        */