import 'package:flutter/material.dart';
import 'package:saudade/contextExtension.dart';
import 'package:saudade/item_list.dart';
import 'package:saudade/models/item.dart';

class InventoryInfo extends StatefulWidget {
  const InventoryInfo({ Key? key}) : super(key: key);

  //final VoidCallback onTap;

  @override
  State<InventoryInfo> createState() => _InventoryInfoState();
}

class _InventoryInfoState extends State<InventoryInfo> {
  @override
  Widget build(BuildContext context) {
    final List<Item> inventoryItemList = ItemList().itemList;

    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: <Widget>[
          Text("Inventory",
              style: context.theme.textTheme.headline5
                  ?.copyWith(color: Colors.white)),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 10 / 8,
            ),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Expanded(
                      flex: 5,
                      child: GestureDetector(
                          child: Card(
                            color: Colors.black12,
                            child: Image.asset(
                              "assets/circuit.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          onTap: () {
                            print(ItemList.selectedItem.name);
                            ItemList.selectedItem = inventoryItemList[index];
                            setState(() {});
                          })),

                  Expanded(child: itemNameAndAmountValue(inventoryItemList, index)),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Text itemNameAndAmountValue(List<Item> inventoryItemList, int index) => Text(inventoryItemList[index].name + " x" + inventoryItemList[index].amount.toString());
}
