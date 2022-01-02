class Character {
  late int id;
  late String name;
  late String image;
  late int hp;   //durumlara göre belirlencek
  late int bagSize;
  late int hungerRate;
  late int tirednessRate;
  late int sicknessRate;
  late int injuryRate;
  late String mood = "";   //readonly

  Character({required int id,required String name,required String image, required int hungerRate, required int tirednessRate, required int sicknessRate, required int injuryRate  ,required int bagSize}){
    this.id = id;
    this.name=name;
    this.image=image;
    this.hungerRate=hungerRate;
    this.tirednessRate=tirednessRate;
    this.sicknessRate=sicknessRate;
    this.injuryRate=injuryRate;
    this.bagSize=bagSize;
    calculateHp(hungerRate, tirednessRate, sicknessRate, injuryRate);
    calculateMood();
  }

  void calculateHp(int hunger,int tired,int sick, int injury) {
    if (hunger == 0 || tired==0 || sick==0 || injury==0) {
      this.hp = 0;
    } else {
      this.hp = (hunger + tired + sick + injury) ~/ 4;
    }
  }

  void calculateMood(){
    List<String> statHungry =["Well Fed", "", "Hungry", "Very Hungry", "Deadly Hungry",];
    String hungry="";
    if (hungerRate>=75) {
      hungry=statHungry[0];
    }else if(hungerRate>=50){
      hungry=statHungry[1];
    }else if(hungerRate>=25){
      hungry=statHungry[2];
    }else if(hungerRate<=25 && hungerRate>0.10){
      hungry=statHungry[3];
    }else{
      hungry=statHungry[4];
    }
    mood+=hungry;

    List<String> statTired =[", Well Rested", "", ", Tired", ", So Tired"];
    String tired="";
    if (tirednessRate>=75) {
      tired=statTired[0];
    }else if(tirednessRate>=50){
      tired=statTired[1];
    }else if(tirednessRate>=25){
      tired=statTired[2];
    }else{
      tired=statTired[3];
    }
      mood+=tired;

    List<String> statSickness =["", "", ", Ill", ", terminally ill"];
    String sick="";
    if (sicknessRate>=75) {
      sick=statSickness[0];
    }else if(sicknessRate>=50){
      sick=statSickness[1];
    }else if(sicknessRate>=25){
      sick=statSickness[2];
    }else{
      sick=statSickness[3];
    }
      mood+=sick;

    List<String> statInjury =["",", Injured",", Badly Wounded",", Fatally Injured"];
    String injury="";
    if (injuryRate>=75) {
      injury=statInjury[0];
    }else if(injuryRate>=50){
      injury=statInjury[1];
    }else if(injuryRate>=25){
      injury=statInjury[2];
    }else{
      injury=statInjury[3];
    }
      mood+=injury;

    if (mood.isEmpty) {
      mood="in good shape.";
    }

  }

}