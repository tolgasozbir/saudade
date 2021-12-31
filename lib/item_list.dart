import 'package:saudade/models/item.dart';

class ItemList {

  List<Item> _itemList=[
    Item(1, "Scrap", 1, "assets/Scrap.png","It is used in the manufacture of almost all products."),
    Item(2, "Circuit", 2, "assets/circuit.png","Electrical parts necessary to manufacture advanced products."),
    Item(3, "Wood", 2, "assets/Woods.png","A necessary component for the production of all kinds of goods that can also be used as fuel."),
    Item(4, "Bandage", 0, "assets/Bandage.png","It is used to bandage wounds.It is used to increase the speed of healing of wounds."),
    Item(5, "Pills", 0, "assets/Pills.png","pills make it easier to deal with pain or illness."),
    Item(6, "Medical Herb", 0, "assets/Herbs.png","Medicinal herbs cure diseases, not as effective as medicine."),
    Item(7, "Canned Food", 1, "assets/CannedFood.png","it tastes bad but satisfying meal. You get used to the taste over time."),
    //Item(8, "Cooked Meal", 0, "assets/circuit"),
    //Item(9, "Raw Food", 1, "assets/circuit"),
  ];

  static late Item selectedItem;

  List<Item> get itemList => _itemList;

  set itemList(List<Item> itemList) {
    _itemList = itemList;
  }


}