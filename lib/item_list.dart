import 'package:saudade/models/item.dart';

class ItemList {

  List<Item> _itemList=[
    Item(1, "Scrap", 1, "assets/circuit"),
    Item(2, "Circuit", 2, "assets/circuit"),
    Item(3, "Wood", 2, "assets/circuit"),
    Item(4, "Bandage", 0, "assets/circuit"),
    Item(5, "Pills", 0, "assets/circuit"),
    Item(6, "Medical Herb", 0, "assets/circuit"),
    Item(7, "Ointment", 0, "assets/circuit"),
    Item(8, "Canned Food", 1, "assets/circuit"),
    Item(9, "Cooked Meal", 0, "assets/circuit"),
    Item(10, "Raw Food", 1, "assets/circuit"),
  ];

  static Item selectedItem=Item(0, "Not Selected Any Item", 0, "");

  List<Item> get itemList => _itemList;

  set itemList(List<Item> itemList) {
    _itemList = itemList;
  }


}