import 'package:saudade/models/item.dart';

class ItemList {

  // get current list //
  static List<Item> allItemList = [
    Item(1, "Scrap", 100, "assets/Scrap.png","It is used in the manufacture of almost all products."),
    Item(2, "Circuit", 200, "assets/circuit.png","Electrical parts necessary to manufacture advanced products."),
    Item(3, "Wood", 200, "assets/Woods.png","A necessary component for the production of all kinds of goods that can also be used as fuel."),
    Item(4, "Bandage", 0, "assets/Bandage.png","It is used to bandage wounds.It is used to increase the speed of healing of wounds."),
    Item(5, "Pills", 0, "assets/Pills.png","pills make it easier to deal with pain or illness."),
    Item(6, "Medical Herb", 0, "assets/Herbs.png","Medicinal herbs cure diseases, not as effective as medicine."),
    Item(7, "Canned Food", 1, "assets/CannedFood.png","it tastes bad but satisfying meal. You get used to the taste over time."),
    Item(8, "Cooked Meal", 0, "assets/cookedMeal.png","Cooked meal, more nutritious and tastier."),
    Item(9, "Raw Food", 4, "assets/rawFood.png","It's edible but would be more nutritious when cooked."),
    Item(10,"Water",20,"assets/water.png","Clean water. You can drink or prepare a good meal."),
    Item(11,"Fuel",6,"assets/fuel.png","we can burn in the heater to warm up our place, or in the stove to cook food.")
    ];

  static late Item selectedItem;

  //    Items in Inventory    //
  List<Item> _myInvItemList =[];

  // if item amount is more than 0 adding item to inventory
  List<Item> get myInvItemList {
    for (var item in allItemList) {
      if (item.amount != 0) {
        _myInvItemList.add(item);
      }
    }
    return _myInvItemList;
  }


      ///   Cooking Recipes  ///

  static List<Map<String,int>> cookRecipes = [
    {"assets/rawFood.png":1,"assets/water.png":6,"assets/fuel.png":2},
    {"assets/rawFood.png":2,"assets/water.png":10,"assets/fuel.png":2}
  ];

    List<Item> _cookingItems = [
      Item(31, "Cooked Meal", 0, "assets/cookedMeal.png","Cooked meal, more nutritious and tastier."),
      Item(32, "Cooked Meal", 0, "assets/cookedMeal.png","Cooked meal, more nutritious and tastier.")
    ];

    List<Item> get cookingItems {
    return _cookingItems;
  }


  // Crafting Menu Recipes //
  static List<Map<String,int>> craftRecipes = [
    {"assets/Scrap.png":20,"assets/circuit.png":12,"assets/Woods.png":10,},
    {"assets/Scrap.png":15,"assets/circuit.png":15,"assets/Woods.png":12,},
    {"assets/Scrap.png":30,"assets/circuit.png":20,"assets/Woods.png":20,},
    {"assets/Scrap.png":20,"assets/circuit.png":5,"assets/Woods.png":15,},
    {"assets/Scrap.png":30,"assets/circuit.png":20,"assets/Woods.png":20,},
    {"assets/Scrap.png":30,"assets/circuit.png":30,"assets/Woods.png":30,}
  ];

  ///   CRAFTİNG MENU ITEMS    ///   TODO: gelişmiş ocak eklencek + fuel
  static List<Item> craftingItems = [
    Item(21,"Traps",0,"assets/Herbs.png","Trap for small animals like rats. We simply have to put in some bait and wait."),
    Item(22,"Radio",0,"assets/circuit.png","We can listen to current news and weather forecasts."),
    Item(23,"Heater",0,"assets/cookedMeal.png","We can build it so we don't get sick in cold weather"),
    Item(24,"Comfy Beds",0,"assets/Scrap.png","more comfortable bed offers better sleep"),
    Item(25,"Strong Door",0,"assets/water.png","We can reinforcing the door and installing a simple alarm system."),
    Item(26,"Safe Env. ",0,"assets/Herbs.png","Will significantly increase raid defense and help reduce casualties losses.")
  ];

  List<Item> _craftableItemList = [];

    List<Item> get craftableItemList {
    for (var item in craftingItems) {
      if (item.amount == 0) {
        _craftableItemList.add(item);
      }
    }
    return _craftableItemList;
  }

}