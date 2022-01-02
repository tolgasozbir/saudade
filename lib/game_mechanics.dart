import 'dart:math';
import 'package:saudade/characterList.dart';
import 'package:saudade/item_list.dart';
import 'package:saudade/models/character.dart';

import 'models/item.dart';

class GameMechanics {

  late int char1State;
  late int char2State;
  late int char3State;

  GameMechanics(this.char1State,this.char2State,this.char3State);

  void inNight(){
    List<int> charStates=[char1State,char2State,char3State];
    int num=0;
    for (var item in charStates) {
      Character selectedChar = CharacterList.charList[num];
      if (item==1) sleep(selectedChar);
      else if(item == 2) guard(selectedChar);
      else scavenge(selectedChar);
      num++;
      print("******************");
    }
  }

  void scavenge(Character char){
    print(char.name + " Scavengeeee");
    Random rnd = Random();
    List<Item> bulunan=[];

    for (var i = 0; i < 25; i++) {
      if (rnd.nextInt(10) >= 0) {
        int rndItem = rnd.nextInt(ItemList.allItemList.length);
        ItemList.allItemList[rndItem].amount += 1;

        if (bulunan.length == 0) {
          bulunan.add(ItemList.allItemList[rndItem]);
          //print(bulunan[0] == ItemList.allItemList[rndItem]);
        }else{

          /*bulunan.firstWhere((element) {
            if (element==ItemList.allItemList[rndItem]) {
              print("var");
              return true;
            } else{
              print("yok");
              return false;
            }
          });*/
        }


        for (var item in bulunan) {
          if (item.id == ItemList.allItemList[rndItem].id) {
            item.amount++;
            print(item.name);
            print(item.amount);
          }
        }
      }

    }

  }

  void guard(Character char){
    print(char.name + " Guarddddddddd");
  }

  void sleep(Character char){
    print(char.name + " ZZZZZZZZz");
  }
}
