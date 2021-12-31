
import 'package:flutter/material.dart';
import 'package:saudade/contextExtension.dart';
import 'package:saudade/item_list.dart';
import 'package:saudade/models/item.dart';

class InventoryInfo extends StatefulWidget {
  const InventoryInfo({ Key? key}) : super(key: key);

  @override
  State<InventoryInfo> createState() => _InventoryInfoState();
}

class _InventoryInfoState extends State<InventoryInfo> {
  @override
  Widget build(BuildContext context) {

    //final List<Item> inventoryItemList = ItemList().itemList; //TODO: SİL

    return Row(
      children: [
        Expanded(flex: 4, child: inventoryLeftSide(context, ItemList().itemList)),
        Expanded(flex: 3, child: itemDetailRightSide()),
      ],
    );
  }




  SingleChildScrollView inventoryLeftSide(BuildContext context, List<Item> inventoryItemList) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: [
          Text("Inventory",style: context.theme.textTheme.headline5?.copyWith(color: Colors.white)),
          gridViewCard(inventoryItemList),
        ],
      ),
    );
  }

  GridView gridViewCard(List<Item> inventoryItemList) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 10 / 8,
      ),
      itemCount: inventoryItemList.length,
      itemBuilder: (BuildContext context, int index) {
        return cardColumn(inventoryItemList, index);
      },
    );
  }

  Column cardColumn(List<Item> inventoryItemList, int index) {
    return Column(
      children: [
        Expanded(flex: 5, child: itemCard(inventoryItemList, index)),
        Expanded(child: itemNameAndAmountValue(inventoryItemList, index)),
      ],
    );
  }

  GestureDetector itemCard(List<Item> inventoryItemList, int index) {
    return GestureDetector(
      child: SizedBox(
        width: context.dynamicWidth(0.175),
        child: Card(
          color: Color(0x2EFFFFFF),
          child: Image.asset("${inventoryItemList[index].image}", fit: BoxFit.cover),
        ),
      ),
      onTap: () => setState(() {
        ItemList.selectedItem = inventoryItemList[index];
      }),
    );
  }

  Text itemNameAndAmountValue(List<Item> inventoryItemList, int index) {
    return Text(inventoryItemList[index].name + " x" + inventoryItemList[index].amount.toString());
  }

  Container itemDetailRightSide() {                     //TODO: Düzenlencek detay kısmı
    return Container(
        height: double.infinity,
        color: Colors.redAccent,
        child: Text(ItemList.selectedItem == null ? "" : ItemList.selectedItem!.name ));
  }


}
