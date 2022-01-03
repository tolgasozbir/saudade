class Character {
  late int id;
  late String name;
  late String image;
  late bool isAlive;
  late int bagSize;
  late int hungerRate;
  late int thirstinessRate;
  late int tirednessRate;
  late int sicknessRate;
  late int injuryRate;
  late String mood = "";   //readonly

  Character({required int id,required String name,required String image, required int hungerRate,required int thirstinessRate, required int tirednessRate, required int sicknessRate, required int injuryRate  ,required int bagSize}){
    this.id = id;
    this.name=name;
    this.image=image;
    this.hungerRate=hungerRate;
    this.thirstinessRate=thirstinessRate;
    this.tirednessRate=tirednessRate;
    this.sicknessRate=sicknessRate;
    this.injuryRate=injuryRate;
    this.bagSize=bagSize;
    this.isAlive=true;
  }

}