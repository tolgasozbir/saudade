class Character {
  late int id;
  late String name;
  late String image;
  late int hp;   //durumlara göre belirlencek
  late int bagSize;
  late double hungerRate;
  late double tirednessRate;
  late double sicknessRate;
  late double injuryRate;
  late String mood = "";   //readonly

  Character({required int id,required String name,required String image, required double hungerRate, required double tirednessRate, required double sicknessRate, required double injuryRate  ,required int bagSize}){
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

  void calculateHp(double hunger,double tired,double sick, double injury) {
    this.hp = 100 - (100 - ((120 * sick) + (120 * injury ) + (90 * hunger) + (70 * tired))/4).toInt();  //tekrar hesaplancak herhangi birisi 0 olduğunca ölcek
  }

  void calculateMood(){
    List<String> statHungry =["Well Fed", "Not Hungry", "Hungry", "Very Hungry", "Deadly Hungry",];
    String hungry="";
    if (hungerRate>=0.75) {
      hungry=statHungry[0];
    }else if(hungerRate>=0.50){
      hungry=statHungry[1];
    }else if(hungerRate>=0.25){
      hungry=statHungry[2];
    }else if(hungerRate<=0.25 && hungerRate>0.10){
      hungry=statHungry[3];
    }else{
      hungry=statHungry[4];
    }
    mood+=hungry;

    List<String> statTired =["Well Rested", "Not Tired", "Tired", "So Tired"];
    String tired="";
    if (tirednessRate>=0.75) {
      tired=statTired[0];
    }else if(tirednessRate>=0.50){
      tired=statTired[1];
    }else if(tirednessRate>=0.25){
      tired=statTired[2];
    }else{
      tired=statTired[3];
    }
      mood+=", "+tired;

    List<String> statSickness =["Very Healty", "Healty", "Ill", "terminally ill"];
    String sick="";
    if (tirednessRate>=0.75) {
      sick=statSickness[0];
    }else if(tirednessRate>=0.50){
      sick=statSickness[1];
    }else if(tirednessRate>=0.25){
      sick=statSickness[2];
    }else{
      sick=statSickness[3];
    }
      mood+=", "+sick;

    List<String> statInjury =["",", Injured",", Badly Wounded",", Fatally Injured"];
    String injury="";
    if (tirednessRate>=0.75) {
      injury=statInjury[0];
    }else if(tirednessRate>=0.50){
      injury=statInjury[1];
    }else if(tirednessRate>=0.25){
      injury=statInjury[2];
    }else{
      injury=statInjury[3];
    }
      mood+=injury;



  }

}