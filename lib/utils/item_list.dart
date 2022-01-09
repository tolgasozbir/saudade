import 'package:saudade/models/item.dart';

class ItemList {

  // get current list //
  static List<Item> allItemList = [
    Item(1, "Scrap", 8, "assets/Scrap.png","It is used in the manufacture of almost all products."),
    Item(2, "Circuit", 8, "assets/circuit.png","Electrical parts necessary to manufacture advanced products."),
    Item(3, "Wood", 12, "assets/Woods.png","A necessary component for the production of all kinds of goods that can also be used as fuel."),
    Item(4, "Bandage", 1, "assets/Bandage.png","It is used to bandage wounds.It is used to increase the speed of healing of wounds."),
    Item(5, "Pills", 1, "assets/Pills.png","pills make it easier to deal with pain or illness."),
    Item(6, "Medical Herb", 2, "assets/Herbs.png","Medicinal herbs cure diseases, not as effective as medicine."),
    Item(7, "Canned Food", 2, "assets/CannedFood.png","it tastes bad but satisfying meal. You get used to the taste over time."),
    Item(8, "Cooked Meal", 0, "assets/cookedMeal.png","Cooked meal, more nutritious and tastier."),
    Item(9, "Raw Food", 4, "assets/rawFood.png","It's edible but would be more nutritious when cooked."),
    Item(10,"Water",12,"assets/water.png","Clean water. You can drink or prepare a good meal."),
    Item(11,"Fuel",8,"assets/fuel.png","we can burn in the heater to warm up our place, or in the stove to cook food.")
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
    {"assets/Scrap.png":0,"assets/circuit.png":0,"assets/Woods.png":2,},
    {"assets/Scrap.png":24,"assets/circuit.png":12,"assets/Woods.png":16,},
    {"assets/Scrap.png":15,"assets/circuit.png":15,"assets/Woods.png":12,},
    {"assets/Scrap.png":30,"assets/circuit.png":20,"assets/Woods.png":20,},
    {"assets/Scrap.png":20,"assets/circuit.png":16,"assets/Woods.png":12,},
    {"assets/Scrap.png":20,"assets/circuit.png":5,"assets/Woods.png":15,},
    {"assets/Scrap.png":30,"assets/circuit.png":20,"assets/Woods.png":20,},
    {"assets/Scrap.png":30,"assets/circuit.png":30,"assets/Woods.png":30,}
  ];

  ///   CRAFTİNG MENU ITEMS    ///
  static List<Item> craftingItems = [
    Item(21,"Fuel",0,"assets/fuel.png","we can burn in the heater to warm up our place, or in the stove to cook food."),
    Item(22,"Traps",0,"assets/trap.png","Trap for small animals like rats. We simply have to put in some bait and wait."),
    Item(23,"Radio",0,"assets/radio.png","We can listen to current news and weather forecasts."),
    Item(24,"Heater",0,"assets/heater.png","We can build it so we don't get sick in cold weather"),
    Item(25,"Cooker Up.",0,"assets/cooker.png","We can cook better with less ingredients"),
    Item(26,"Comfy Beds",0,"assets/bed.png","more comfortable bed offers better sleep"),
    Item(27,"Strong Door",0,"assets/door.png","We can reinforcing the door and installing a simple alarm system."),
    Item(28,"Safe Env.",0,"assets/envTrap.png","Will significantly increase raid defense and help reduce casualties losses.")
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