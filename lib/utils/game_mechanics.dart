import 'dart:math';
import 'package:saudade/utils/character_list.dart';
import 'package:saudade/utils/item_list.dart';
import 'package:saudade/models/character.dart';

class GameMechanics {

  late int char1State;
  late int char2State;
  late int char3State;

  GameMechanics(this.char1State,this.char2State,this.char3State);

  void inNight(){
    doSelectedTask();
  }

  void scavenge(Character char){
    print(char.name + " Scavengeeee");
    char.tirednessRate-=(24+Random().nextInt(37));   //////////// TODO: düzenle
    Random rnd = Random();
    List<String> foundItemName=[];
    List<int> foundItemAmount=[];

    for (var i = 0; i < char.bagSize; i++) {    //TODO: Şanşa dayalı olsun
      int rndItem = rnd.nextInt(ItemList.allItemList.length);
      ItemList.allItemList[rndItem].amount++;
      
      if (foundItemName.contains(ItemList.allItemList[rndItem].name)) {
        int count=0;
        for (var item in foundItemName) {
          if (item==ItemList.allItemList[rndItem].name) {
            foundItemAmount[count]++;
          }
          count++;
        }
      } else {
        foundItemName.add(ItemList.allItemList[rndItem].name);
        foundItemAmount.add(1);
      }
    }

    print("items found");
    for (var i = 0; i < foundItemAmount.length; i++) {
      print(foundItemName[i] +" "+ foundItemAmount[i].toString());
    }

  }

  void guard(Character char){
    print(char.name + " Guarddddddddd");
    char.tirednessRate -=(16+Random().nextInt(24));      ////////////
  }

  void sleep(Character char){
    print(char.name + " ZZZZZZZZz");
    char.tirednessRate+=(24+Random().nextInt(37));       //////////////
    if (char.tirednessRate>100) {
      char.tirednessRate=100;
    }
  }

  void doSelectedTask(){
    List<int> charStates=[char1State,char2State,char3State];
    int que=0;
    for (var item in charStates) {
      Character selectedChar = CharacterList.charList[que];
      selectedChar.hungerRate-=(24+Random().nextInt(37));        //////////////
      if (item==1) sleep(selectedChar);
      else if(item == 2) guard(selectedChar);
      else scavenge(selectedChar);
      que++;
    }
  }

}


/*        if (bulunan.contains(ItemList.allItemList[rndItem])) {
          for (var item in bulunan) {
            if (ItemList.allItemList[rndItem].id == item.id) {
              print("item found : ${item.name}");
            }
          }
        } else {
          bulunan.add(ItemList.allItemList[rndItem]);
          print("item found : ${ItemList.allItemList[rndItem].name}");
        }*/