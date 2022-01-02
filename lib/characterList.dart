import 'package:saudade/models/character.dart';

class CharacterList {
  static Character c1 = new Character(id: 1,name: "Tolga", image: "", hungerRate: 95, tirednessRate: 95, sicknessRate: 95, injuryRate: 95 ,bagSize: 12);
  static Character c2 = new Character(id: 2,name: "Levent", image: "", hungerRate: 95, tirednessRate: 95, sicknessRate: 100, injuryRate: 100, bagSize: 10);
  static Character c3 = new Character(id: 3,name: "Bilo", image: "", hungerRate: 95, tirednessRate: 95, sicknessRate: 95,injuryRate: 100 , bagSize: 15);

  static List<Character> charList = [CharacterList.c1,CharacterList.c2,CharacterList.c3];
}