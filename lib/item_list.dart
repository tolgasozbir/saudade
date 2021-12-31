import 'package:saudade/models/item.dart';

class ItemList {

  List<Item> _itemList=[
    Item(1, "Scrap", 1, "assets/Scrap.png"),
    Item(2, "Circuit", 2, "assets/circuit.png"),
    Item(3, "Wood", 2, "assets/Woods.png"),
    Item(4, "Bandage", 0, "assets/Bandage.png"),
    Item(5, "Pills", 0, "assets/Pills.png"),
    Item(6, "Medical Herb", 0, "assets/Herbs.png"),
    Item(7, "Canned Food", 1, "assets/CannedFood.png"),
    //Item(8, "Cooked Meal", 0, "assets/circuit"),
    //Item(9, "Raw Food", 1, "assets/circuit"),
  ];

  static Item? selectedItem;      //TODO: BASe valuesi yok

  List<Item> get itemList => _itemList;

  set itemList(List<Item> itemList) {
    _itemList = itemList;
  }


}