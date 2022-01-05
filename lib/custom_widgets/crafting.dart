import 'package:flutter/material.dart';
import 'package:saudade/models/item.dart';
import 'package:saudade/utils/context_extension.dart';
import 'package:saudade/utils/item_list.dart';
import 'package:saudade/utils/mySnackBar.dart';

class Crafting extends StatefulWidget {
  const Crafting({ Key? key }) : super(key: key);

  @override
  _CraftingState createState() => _CraftingState();
}

class _CraftingState extends State<Crafting> {

  @override
  void initState() {
    super.initState();
    ItemList.selectedItem = ItemList().craftableItemList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 4, child: craftingLeftSide(context)),
        Expanded(flex: 3, child: itemDetailRightSide()),
      ],
    );
  }

  Column craftingLeftSide(BuildContext context) {
    return Column(
        children: [
        Text("Crafting",style: context.theme.textTheme.headline5?.copyWith(color: Colors.white)),
        Expanded(child: scrollGrid(ItemList().craftableItemList)),
      ],
    );
  }

  Widget scrollGrid(List<Item> cratableItems) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child:gridViewCard(cratableItems),
      );
  }

  GridView gridViewCard(List<Item> cratableItems) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 10 / 8,
      ),
      itemCount: cratableItems.length,
      itemBuilder: (BuildContext context, int index) {
        return cardColumn(cratableItems, index);
      },
    );
  }

  Column cardColumn(List<Item> inventoryItemList, int index) {
    return Column(
      children: [
        Expanded(flex: 5, child: itemCard(inventoryItemList, index)),
        Expanded(child: Text(inventoryItemList[index].name)),
      ],
    );
  }

  GestureDetector itemCard(List<Item> cratableItems, int index) {
    return GestureDetector(
      child: SizedBox(
        width: context.dynamicWidth(0.175),
        child: Card(
          color: Color(0x2EFFFFFF),
          child: Image.asset("${cratableItems[index].image}", fit: BoxFit.contain),
        ),
      ),
      onTap: () => setState(() { ItemList.selectedItem = cratableItems[index]; }),
    );
  }

  ////////////////////////  RİGHT SİDE  /////////////////////////////////

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
            Text("${ItemList.selectedItem.name}",style: context.theme.textTheme.headline5?.copyWith(color: Colors.white)),
            Expanded(flex: 2, child: craftItemPic()),
            Expanded(flex: 1, child: Center(child: Text("Need for craft",style: context.theme.textTheme.headline5?.copyWith(color: Colors.white,fontSize: 20)))),
            Expanded(flex: 2, child: needItemPics()),
          ],
        );
  }

  Widget craftItemPic() {
    return Container(
      width: double.infinity,
      child: Image.asset("${ItemList.selectedItem.image}"),
      decoration: BoxDecoration(
        //color: surfaceColor,
        border: Border.all(color: Color(0xFF2AAF2F)),
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      ),
    );
  }

  Row needItemPics() {
    return Row(
      children: [
        Expanded(child: itemPicAndAmount(ItemList.craftRecipes[calcItem()].keys.elementAt(0),ItemList.craftRecipes[calcItem()].values.elementAt(0))),
        Expanded(child: itemPicAndAmount(ItemList.craftRecipes[calcItem()].keys.elementAt(1),ItemList.craftRecipes[calcItem()].values.elementAt(1))),
        Expanded(child: itemPicAndAmount(ItemList.craftRecipes[calcItem()].keys.elementAt(2),ItemList.craftRecipes[calcItem()].values.elementAt(2))),
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
      case 21 : value=0;break;
      case 22 : value=1;break;
      case 23 : value=2;break;
      case 24 : value=3;break;
      case 25 : value=4;break;
      case 26 : value=5;break;
      case 27 : value=6;break;
      default: break;
    }
    return value;
  }


  void craftButtonClick(){
    int selectedValue=calcItem();

    switch (selectedValue) {
      case 0: {
        if(ItemList.allItemList[2].amount>=2) {
          ItemList.allItemList[2].amount -= 2;
          ItemList.allItemList[10].amount++;
          ItemList.selectedItem = ItemList().craftableItemList[0];
          mySnackBar(context, "Craft Succesful", 2);
        }else{
          mySnackBar(context, "there is not enough material", 2);
        }
      } break; 

      case 1: {
        if(ItemList.allItemList[0].amount>=24 && ItemList.allItemList[1].amount>=12 && ItemList.allItemList[2].amount>=16) {
          ItemList.allItemList[0].amount -= 24;
          ItemList.allItemList[1].amount -= 12;
          ItemList.allItemList[2].amount -= 16;
          ItemList.craftingItems[1].amount++;
          ItemList.selectedItem = ItemList().craftableItemList[0];
          mySnackBar(context, "Craft Succesful", 2);
        }else{
          mySnackBar(context, "there is not enough material", 2);
        }
      } break;   

      case 2: {
        if(ItemList.allItemList[0].amount>=15 && ItemList.allItemList[1].amount>=15 && ItemList.allItemList[2].amount>=12) {
          ItemList.allItemList[0].amount -= 15;
          ItemList.allItemList[1].amount -= 15;
          ItemList.allItemList[2].amount -= 12;
          ItemList.craftingItems[2].amount++;
          ItemList.selectedItem = ItemList().craftableItemList[0];
          mySnackBar(context, "Craft Succesful", 2);
        }else{
          mySnackBar(context, "there is not enough material", 2);
        }
      } break;

      case 3: {
        if(ItemList.allItemList[0].amount>=30 && ItemList.allItemList[1].amount>=20 && ItemList.allItemList[2].amount>=20) {
          ItemList.allItemList[0].amount -= 30;
          ItemList.allItemList[1].amount -= 20;
          ItemList.allItemList[2].amount -= 20;
          ItemList.craftingItems[3].amount++;
          ItemList.selectedItem = ItemList().craftableItemList[0];
          mySnackBar(context, "Craft Succesful", 2);
        }else{
          mySnackBar(context, "there is not enough material", 2);
        }
      } break;

      case 4: {
        if(ItemList.allItemList[0].amount>=20 && ItemList.allItemList[1].amount>=5 && ItemList.allItemList[2].amount>=15) {
          ItemList.allItemList[0].amount -= 20;
          ItemList.allItemList[1].amount -= 5;
          ItemList.allItemList[2].amount -= 15;
          ItemList.craftingItems[4].amount++;
          ItemList.selectedItem = ItemList().craftableItemList[0];
          mySnackBar(context, "Craft Succesful", 2);
        }else{
          mySnackBar(context, "there is not enough material", 2);
        }
      } break;

      case 5: {
        if(ItemList.allItemList[0].amount>=30 && ItemList.allItemList[1].amount>=20 && ItemList.allItemList[2].amount>=20) {
          ItemList.allItemList[0].amount -= 30;
          ItemList.allItemList[1].amount -= 20;
          ItemList.allItemList[2].amount -= 20;
          ItemList.craftingItems[5].amount++;
          ItemList.selectedItem = ItemList().craftableItemList[0];
          mySnackBar(context, "Craft Succesful", 2);
        }else{
          mySnackBar(context, "there is not enough material", 2);
        }
      } break;

      case 6: {
        if(ItemList.allItemList[0].amount>=30 && ItemList.allItemList[1].amount>=30 && ItemList.allItemList[2].amount>=30) {
          ItemList.allItemList[0].amount -= 30;
          ItemList.allItemList[1].amount -= 30;
          ItemList.allItemList[2].amount -= 30;
          ItemList.craftingItems[6].amount++;
          ItemList.selectedItem = ItemList().craftableItemList[0];
          mySnackBar(context, "Craft Succesful", 2);
        }else{
          mySnackBar(context, "there is not enough material", 2);
        }
      } break;

    }

    setState(() {

    });

  }

}

//Text("${ItemList.selectedItem.itemDetail}",style: context.theme.textTheme.headline6?.copyWith(color: Colors.white))