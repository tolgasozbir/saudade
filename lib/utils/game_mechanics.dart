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
    char.tirednessRate+=(32+Random().nextInt(5));    //tiredness + 32-36
    char.sicknessRate +=(8+Random().nextInt(5));     //sick      + 8-12
    char.injuryRate +=(4+Random().nextInt(9));       //injuary   + 4-12
    Random rnd = Random();

    for (var i = 0; i < char.bagSize; i++) {        //5
      int rndItem = rnd.nextInt(100);
      if (rndItem>=0 && rndItem<=15)      ItemList.allItemList[0].amount++;   //scrap
      else if(rndItem>=16 && rndItem<=31) ItemList.allItemList[1].amount++;   //circuit
      else if(rndItem>=32 && rndItem<=49) ItemList.allItemList[2].amount++;   //wood
      else if(rndItem>=50 && rndItem<=55) ItemList.allItemList[3].amount++;   //bandage
      else if(rndItem>=56 && rndItem<=59) ItemList.allItemList[4].amount++;   //piils
      else if(rndItem>=60 && rndItem<=65) ItemList.allItemList[5].amount++;   //medical herbs
      else if(rndItem>=66 && rndItem<=73) ItemList.allItemList[6].amount++;   //canned food
      else if(rndItem>=74 && rndItem<=85) ItemList.allItemList[8].amount++;   //raw food
      else if(rndItem>=84 && rndItem<=99) ItemList.allItemList[9].amount++;   //water
      
    }
  }

  void guard(Character char){
    char.tirednessRate +=(16+Random().nextInt(17));   //tiredness + 16-32
    char.sicknessRate +=(8+Random().nextInt(5));     //sick      + 8-12
    print(char.name + " Guard");
  }

  void sleep(Character char){
    char.tirednessRate-=(24+Random().nextInt(13));    //tiredness - 24-36
    char.injuryRate-=(12+Random().nextInt(13));       //injuary   - 12-24
    char.sicknessRate-=(16+Random().nextInt(13));     //Sick      - 16-28
    if (char.tirednessRate<=0) char.tirednessRate=0;
    if (char.injuryRate<=0) char.injuryRate=0;
    if (char.sicknessRate<=0) char.sicknessRate=0;

    print(char.name + " Uyuyor");
  }

  void doSelectedTask(){
    List<int> charStates=[char1State,char2State,char3State];
    int que=0;
    for (var item in charStates) {
      Character selectedChar = CharacterList.charList[que];

      selectedChar.hungerRate+=(16+Random().nextInt(17));       //Hungry      + 16-32
      selectedChar.thirstinessRate+=(12+Random().nextInt(13));  //thirstness  + 12-24

      if (item==1) sleep(selectedChar);
      else if(item == 2) guard(selectedChar);
      else scavenge(selectedChar);
      que++;
    }
  }

  void randomEvents(){  //TODO: random events

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