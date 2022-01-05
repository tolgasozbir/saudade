
import 'package:flutter/material.dart';
import 'package:saudade/utils/context_extension.dart';
import 'package:saudade/utils/item_list.dart';
import 'package:saudade/models/item.dart';

class InventoryInfo extends StatefulWidget {
  const InventoryInfo({ Key? key}) : super(key: key);

  @override
  State<InventoryInfo> createState() => _InventoryInfoState();
}

class _InventoryInfoState extends State<InventoryInfo> {

  @override
  void initState() {
    super.initState();
    ItemList.selectedItem = ItemList().myInvItemList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 4, child: inventoryLeftSide(context)),
        Expanded(flex: 3, child: itemDetailRightSide()),
      ],
    );
  }

  Column inventoryLeftSide(BuildContext context) {
    return Column(
        children: [
        Text("Inventory",style: context.theme.textTheme.headline5?.copyWith(color: Colors.white)),
        Expanded(child: scrollGrid(context, ItemList().myInvItemList)),
      ],
    );
  }

  SingleChildScrollView scrollGrid(BuildContext context, List<Item> inventoryItemList) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: gridViewCard(inventoryItemList),
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
          child: Image.asset("${inventoryItemList[index].image}", fit: BoxFit.contain),
        ),
      ),
      onTap: () => setState(() { ItemList.selectedItem = inventoryItemList[index]; }),
    );
  }

  Text itemNameAndAmountValue(List<Item> inventoryItemList, int index) {
    return Text(inventoryItemList[index].name + " x" + inventoryItemList[index].amount.toString());
  }

  Container itemDetailRightSide() {
    return Container(
      height: double.infinity,
      color: Color(0x0FFFFFFF),
      child: Column(
        children: [
          Text("${ItemList.selectedItem.name}",style: context.theme.textTheme.headline5?.copyWith(color: Colors.white)),
          Expanded(flex: 6, child: Image.asset("${ItemList.selectedItem.image}")),
          Expanded(flex: 4, child: Text("${ItemList.selectedItem.itemDetail}",style: context.theme.textTheme.headline6?.copyWith(color: Colors.white))),
        ],
      )
    );
  }

}