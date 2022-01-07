import 'package:flutter/material.dart';
import 'package:saudade/utils/context_extension.dart';
import 'package:saudade/utils/item_list.dart';
import 'package:saudade/utils/mySnackBar.dart';

class Traps extends StatefulWidget {
  const Traps({ Key? key }) : super(key: key);

  @override
  _TrapsState createState() => _TrapsState();
}

class _TrapsState extends State<Traps> {

  TrapProperty selectedTrap=trap1;
  int selectedBait=0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 4, child: leftSide()),
        Expanded(flex: 3, child: rightSide()),
      ],
    );
  }
  Widget leftSide() {
    return cardRow();
  }

  Row cardRow() {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: itemCard(trap1)),
        Expanded(child: itemCard(trap2)),
      ],
    );
  }

  GestureDetector itemCard(TrapProperty trap) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(flex: 4,
              child: Card(
              shape: selectedTrap== trap ? Border.all(color: Colors.pink) : Border.all(),
              color: Color(0x2EFFFFFF),
              child: Image.asset("assets/trap.png", fit: BoxFit.contain),
              ),
            ),
            Expanded(child: Center(child: trap.isTrapActive==true ? Text("Waiting") : Text("Ready for setup"))),
            trap.isTrapActive == false ? SizedBox() : CircularProgressIndicator(),
          ],
        ),
      ),
      onTap: () => setState(() { selectedTrap = trap; }),
    );
  }






  ////    RİGHT SİDE    ////


  Container rightSide() {
    return Container(
      color: Color(0x0FFFFFFF),
      child: setupOrCollect(),
    );
  }

  Widget setupOrCollect() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: selectedTrap.isTrapActive == false ? 
      setup() : 
      waitingAndCollect(),
    );
  }

  Widget setup(){
    return Column(
      children: [
        Text("Select Bait and Setup Trap", style: context.theme.textTheme.headline6,),
        Expanded(flex: 3, child: baitPics()),
        Expanded(child: SizedBox(width: double.infinity, child: ElevatedButton(
        onPressed: setupTrap, 
        child: Text("Set Trap",style: context.theme.textTheme.headline4),
        style: ElevatedButton.styleFrom(
          primary: Colors.white12,
          side: BorderSide(width: 2, color: Colors.blueGrey),
        )
      )))
      ],
    );
  }

  Row baitPics() {
    return Row(
      children: [
        Expanded(child: baitImage("assets/rawFood.png",0)),
        Expanded(child: baitImage("assets/CannedFood.png",1)),
      ],
    );
  }

  Widget baitImage(String image,int baitNum) {
    return GestureDetector(
      child: Container(decoration: BoxDecoration(border: selectedBait==baitNum ? Border.all(color: Colors.pink) : Border()), child: Image.asset(image)),
      onTap: (){
        setState(() {selectedBait=baitNum;});
      },
    );
  }

  Widget collect(){
    return Column(
      children: [

      ],
    );
  }

  void setupTrap(){
    if (selectedTrap==trap1) {
      if (selectedBait==0 && ItemList.allItemList[8].amount>=1) {
        ItemList.allItemList[8].amount--;
        selectedTrap.isTrapActive=true;
      }else if(selectedBait==1 && ItemList.allItemList[6].amount>=1){
        ItemList.allItemList[6].amount--;
        selectedTrap.isTrapActive=true;
      }
      else{
        mySnackBar(context, "not enough food", 2);
      }
    }else{
      if (selectedBait==0 && ItemList.allItemList[8].amount>=1) {
        ItemList.allItemList[8].amount--;
        selectedTrap.isTrapActive=true;
      }else if(selectedBait==1 && ItemList.allItemList[6].amount>=1){
        ItemList.allItemList[6].amount--;
        selectedTrap.isTrapActive=true;
      }
      else{
        mySnackBar(context, "not enough food", 2);
      }
    }

    setState(() {
      
    });
  }

  Widget waitingAndCollect() {
    return selectedTrap.ifThereIsMeat==false ? waitingPhase(): collectMeat();
  }

  Column waitingPhase() {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Waiting"),
      SizedBox(height: 16,),
      CircularProgressIndicator(),
    ],
  );
  }

  Column collectMeat(){
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(flex: 2, child: Image.asset("assets/rawFood.png")),
        Expanded(child: Center(child: Text("2x Raw Food",style: context.theme.textTheme.headline4,))),
        Expanded(
          child: ElevatedButton(
          onPressed: collectTrapMeat, 
          child: Text("Collect Meats",style: context.theme.textTheme.headline4),
          style: ElevatedButton.styleFrom(
            primary: Colors.white12,
            side: BorderSide(width: 2, color: Colors.blueGrey),
          )
              ),
        )
      ],
    );
  }

  void collectTrapMeat(){
    ItemList.allItemList[8].amount+=2;
    selectedTrap.ifThereIsMeat=false;
    selectedTrap.isTrapActive=false;
    setState(() { });
  }

}

class TrapProperty {
  late int trapNum;
  late bool isTrapActive;
  late bool ifThereIsMeat;

  TrapProperty(this.trapNum,this.isTrapActive,this.ifThereIsMeat);
}

TrapProperty trap1 = TrapProperty(1, false,false);
TrapProperty trap2 = TrapProperty(2, false,false);