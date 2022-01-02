import 'package:saudade/characterList.dart';
import 'package:saudade/models/character.dart';

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
    }

  }

  void scavenge(Character char){
    print(char.name + " Scavengeeee");
  }

  void guard(Character char){
    print(char.name + " Guarddddddddd");
  }

  void sleep(Character char){
    print(char.name + " ZZZZZZZZz");
  }
}