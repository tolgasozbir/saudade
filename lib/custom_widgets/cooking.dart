
import 'package:flutter/material.dart';
import 'package:saudade/models/item.dart';
import 'package:saudade/utils/context_extension.dart';
import 'package:saudade/utils/item_list.dart';
import 'package:saudade/utils/mySnackBar.dart';

class Cooking extends StatefulWidget {
  const Cooking({ Key? key }) : super(key: key);

  @override
  State<Cooking> createState() => _CookingState();
}

class _CookingState extends State<Cooking> {
@override
  void initState() {
    super.initState();
    ItemList.selectedItem = ItemList().cookingItems[0];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 4, child: cookingLeftSide(ItemList().cookingItems)),
        Expanded(flex: 3, child: itemDetailRightSide()),
      ],
    );
  }

  Widget cookingLeftSide(List<Item> cookingItems) {
    return Column(
      children: [
        Expanded(child: Text("Cooking",style: context.theme.textTheme.headline5?.copyWith(color: Colors.white))),
        Expanded(flex: 8, child: cardRow(cookingItems)),
      ],
    );
  }

  Row cardRow(List<Item> cookingItems) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        itemCard(cookingItems[0],1),
        itemCard(cookingItems[1],2),
      ],
    );
  }

  GestureDetector itemCard(Item cookingItem,int amount) {
    return GestureDetector(
      child: Column(
        children: [
          Expanded(
            child: Card(
            color: Color(0x2EFFFFFF),
            child: Image.asset("${cookingItem.image}", fit: BoxFit.cover),
            ),
          ),
          Text("${cookingItem.id-30}x "+cookingItem.name),
        ],
      ),
      onTap: () => setState(() { ItemList.selectedItem = cookingItem; }),
    );
  }

  /////////////////////////  RİGHT SİDE  /////////////////////////////////

 Container itemDetailRightSide() {
    return Container(
      height: double.infinity,
      color: Color(0x0FFFFFFF),
      child: Row(
        children: [
          Expanded(child: selectedItemDetail()),
          Expanded(child: craftButtonAndInfo()),
        ],
      )
    );
  }

  Widget selectedItemDetail() {
    return Column(
          children: [
            Text("${ItemList.selectedItem.id-30}x ${ItemList.selectedItem.name}",style: context.theme.textTheme.headline6),
            Expanded(flex: 2, child: craftItemPic()),
            Expanded(flex: 1, child: Center(child: Text("Need for craft",style: context.theme.textTheme.headline5?.copyWith(fontSize: 20)))),
            Expanded(flex: 2, child: needItemPics()),
          ],
        );
  }

  Widget craftItemPic() {
    return Container(
      width: double.infinity,
      child: Image.asset("${ItemList.selectedItem.image}"),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF2AAF2F)),
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      ),
    );
  }

  Row needItemPics() {
    return Row(
      children: [
        Expanded(child: itemPicAndAmount(ItemList.cookRecipes[calcItem()].keys.elementAt(0),ItemList.cookRecipes[calcItem()].values.elementAt(0))),
        Expanded(child: itemPicAndAmount(ItemList.cookRecipes[calcItem()].keys.elementAt(1),ItemList.cookRecipes[calcItem()].values.elementAt(1))),
        Expanded(child: itemPicAndAmount(ItemList.cookRecipes[calcItem()].keys.elementAt(2),ItemList.cookRecipes[calcItem()].values.elementAt(2))),
      ],
    );
  }

  Column itemPicAndAmount(String image,int amount) {
    return Column(
        children: [
          Expanded(flex: 3, child: Image.asset("${image}")),
          Expanded(child: Text("${amount}x")),
        ],
      );
  }

  Column craftButtonAndInfo(){
    return Column(
      children: [
        Text("description",style: context.theme.textTheme.headline6!.copyWith(decoration: TextDecoration.underline)),
        Expanded(flex: 2, child: Padding(padding: const EdgeInsets.all(8.0),
          child: Center(child: Text("${ItemList.selectedItem.itemDetail}",style: context.theme.textTheme.subtitle2!.copyWith(fontSize: 16))),
        )),
        Expanded(child: craftButton())
      ],
    );
  }

  SizedBox craftButton() {
    return SizedBox(
      width: double.infinity, 
      child: ElevatedButton(
        onPressed: craftButtonClick, 
        child: Text("Craft",style: context.theme.textTheme.headline4),
        style: ElevatedButton.styleFrom(
          primary: Colors.white12,
          side: BorderSide(width: 2, color: Colors.blueGrey),
        )
      )
    );
  }

  int calcItem(){
    int value=0;
    switch (ItemList.selectedItem.id) {
      case 31 : value=0;break;
      case 32 : value=1;break;
      default: break;
    }
    return value;
  }

  void craftButtonClick(){
    int selectedValue=calcItem();

    switch (selectedValue) {
      case 0: {
        if(ItemList.allItemList[8].amount>=1 && ItemList.allItemList[9].amount>=1-6 && ItemList.allItemList[10].amount>=2) {
          ItemList.allItemList[8].amount -= 1;
          ItemList.allItemList[9].amount -= 6;
          ItemList.allItemList[10].amount -= 2;
          ItemList.allItemList[7].amount++;
          mySnackBar(context, "Craft Succesful", 2);
        }else{
          mySnackBar(context, "there is not enough material", 2);
        }
      } break;   

      case 1: {
        if(ItemList.allItemList[8].amount>=2 && ItemList.allItemList[9].amount>=10 && ItemList.allItemList[10].amount>=2) {
          ItemList.allItemList[8].amount -= 2;
          ItemList.allItemList[9].amount -= 10;
          ItemList.allItemList[10].amount -= 2;
          ItemList.allItemList[7].amount+=2;
          mySnackBar(context, "Craft Succesful", 2);
        }else{
          mySnackBar(context, "there is not enough material", 2);
        }
      } break;   


    }
  }
}