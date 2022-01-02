import 'package:saudade/models/character.dart';

class CharacterList {
  static Character c1 = new Character(id: 1,name: "Tolga", image: "", hungerRate: 0.5, tirednessRate: 0.7, sicknessRate: 0.9, injuryRate: 0.5 ,bagSize: 12);
  static Character c2 = new Character(id: 2,name: "Levent", image: "", hungerRate: 0.9, tirednessRate: 0.75, sicknessRate: 0.95, injuryRate: 0.1, bagSize: 10);
  static Character c3 = new Character(id: 3,name: "Bilo", image: "", hungerRate: 0.5, tirednessRate: 0.5, sicknessRate: 0.5,injuryRate: 0.5 , bagSize: 15);

  static List<Character> charList = [CharacterList.c1,CharacterList.c2,CharacterList.c3];
}