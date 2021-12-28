class Character {
  late int id;
  late String name;
  late String image;
  late int hp;   //durumlara göre belirlencek
  late double hungerRate;
  late double tirednessRate;
  late double sicknessRate;
  late String mood = "";   //readonly

  Character({required int id,required String name,required String image, required double hungerRate, required double tirednessRate, required double sicknessRate}){
    this.id = id;
    this.name=name;
    this.image=image;
    this.hungerRate=hungerRate;
    this.tirednessRate=tirednessRate;
    this.sicknessRate=sicknessRate;
    calculateHp(hungerRate, tirednessRate, sicknessRate);
    calculateMood();
  }

  void calculateHp(double hunger,double tired,double sick) {
    this.hp = 100 - (100 - ((130 * sick) + (90 * hunger) + (80 * tired))/3).toInt();
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
      mood+=" ,"+tired;

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
      mood+=" ,"+sick;



  }

}