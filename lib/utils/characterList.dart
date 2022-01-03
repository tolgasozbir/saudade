import 'package:saudade/models/character.dart';

class CharacterList {
  static Character c1 = new Character(id: 1,name: "Tolga", image: "", hungerRate: 0, thirstinessRate: 0, tirednessRate: 0, sicknessRate: 0, injuryRate: 0 ,bagSize: 4);
  static Character c2 = new Character(id: 2,name: "Levent", image: "", hungerRate: 0, thirstinessRate: 0, tirednessRate: 0, sicknessRate: 0, injuryRate: 0, bagSize: 4);
  static Character c3 = new Character(id: 3,name: "Bilo", image: "", hungerRate: 0, thirstinessRate: 0, tirednessRate: 0, sicknessRate: 0,injuryRate: 0 , bagSize: 4);

  static List<Character> charList = [CharacterList.c1,CharacterList.c2,CharacterList.c3];

  static void isAlive(Character char) {
    if (char.hungerRate >= 100 || char.thirstinessRate>=100 || char.tirednessRate>=100 || char.sicknessRate>=100 || char.injuryRate>=100) {
      char.isAlive=false;  //TODO: ölüm durumunu kodla ne olcaksa
    }
  }

  static void calculateMood(Character char){
    char.mood="";

    List<String> statThrist =["", "Thirsty, ", "Very Thirsty, ", "Deadly Thirsty, ",];
    String thrist="";
    if (char.thirstinessRate>=0 && char.thirstinessRate<50) {         //0-49// ""
      thrist=statThrist[0];
    }else if(char.thirstinessRate>=50&& char.thirstinessRate<75){     //50-74// "Thirsty"
      thrist=statThrist[1];
    }else if(char.thirstinessRate>=75 && char.thirstinessRate<90){    //75-89// "Very Thirsty"
      thrist=statThrist[2];
    }else{                                                            //90-100  "Deadly Thirsty"
      thrist=statThrist[3];
    }
    char.mood+=thrist;

    List<String> statHungry =["Well Fed, ", "", "Hungry, ", "Very Hungry, ", "Deadly Hungry, ",];
    String hungry="";
    if (char.hungerRate>=0 && char.hungerRate<25) {
      hungry=statHungry[0];
    }else if(char.hungerRate>=25 && char.hungerRate<50){
      hungry=statHungry[1];
    }else if(char.hungerRate>=50 && char.hungerRate<75){
      hungry=statHungry[2];
    }else if(char.hungerRate>=75 && char.hungerRate<90){
      hungry=statHungry[3];
    }else{
      hungry=statHungry[4];
    }
    char.mood+=hungry;

    List<String> statTired =["Well Rested, ", "", "Tired, ", "So Tired, "];
    String tired="";
    if (char.tirednessRate>=0 && char.tirednessRate <25) {
      tired=statTired[0];
    }else if(char.tirednessRate>=25 && char.tirednessRate <50){
      tired=statTired[1];
    }else if(char.tirednessRate>=50 && char.tirednessRate <80){
      tired=statTired[2];
    }else{
      tired=statTired[3];
    }
      char.mood+=tired;

    List<String> statSickness =["", "", "Ill, ", "terminally ill, "];
    String sick="";
    if (char.sicknessRate>=0 && char.sicknessRate<25) {
      sick=statSickness[0];
    }else if(char.sicknessRate>=25 && char.sicknessRate<60){
      sick=statSickness[1];
    }else if(char.sicknessRate>=60 && char.sicknessRate<85){
      sick=statSickness[2];
    }else{
      sick=statSickness[3];
    }
      char.mood+=sick;

    List<String> statInjury =["","Injured, ","Badly Wounded, ","Fatally Injured, "];
    String injury="";
    if (char.injuryRate>=0 && char.injuryRate<25) {
      injury=statInjury[0];
    }else if(char.injuryRate>=25 && char.injuryRate<60){
      injury=statInjury[1];
    }else if(char.injuryRate>=60 && char.injuryRate<85){
      injury=statInjury[2];
    }else{
      injury=statInjury[3];
    }
      char.mood+=injury;

    if (char.mood.isEmpty) {
      char.mood="in good shape.";
    }else{
      char.mood = char.mood.substring(0,char.mood.length-2);
    }

  }
}