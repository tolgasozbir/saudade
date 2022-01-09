import 'dart:ui';
import 'package:saudade/utils/character_list.dart';
import 'package:saudade/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:saudade/utils/item_list.dart';
import 'package:saudade/models/character.dart';
import 'package:saudade/models/item.dart';

class CharacterInfo extends StatefulWidget {
  const CharacterInfo({required this.char, Key? key }) : super(key: key);

  final Character char;

  @override
  State<CharacterInfo> createState() => _CharacterInfoState();
}

class _CharacterInfoState extends State<CharacterInfo> {
  @override
  Widget build(BuildContext context) {

    CharacterList.isAlive(widget.char);
    CharacterList.calculateMood(widget.char);

    return widget.char.isAlive ? 
      isAlive() :
      isDeath();
  }

  Widget isDeath() {
    return Column(
      children: [
        Expanded(child: Text("${widget.char.name} is dead...", style: context.theme.textTheme.headline5)),
        Expanded( flex: 4,
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.grey, 
            BlendMode.saturation
          ),
          child: Image.network("https://picsum.photos/200"),
        ),
      ),
        Expanded(child: Text("RIP", style: context.theme.textTheme.headline5)),
      ],
    );
  }

  SingleChildScrollView isAlive() {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: <Widget>[
          Text("${widget.char.name}" , style: context.theme.textTheme.headline5?.copyWith(color: Colors.white,fontSize: 30)),
          Text("Mood : ${widget.char.mood}" , style: context.theme.textTheme.headline5?.copyWith(color: Colors.white)),
          SizedBox(height: 12,),
          feedRowButtonsFirst(),
          SizedBox(height: 8,),
          feedRowButtonsSecond(),
          JournalText(),
          listViewBuilder(),
        ],
      ),
    );
  }

  Row feedRowButtonsFirst() {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget.char.thirstinessRate>=25 ? feedButton(ItemList.allItemList[9]) : const SizedBox(),
        widget.char.hungerRate>=25 ? isHungry() : const SizedBox(),
      ],
    );
  }

  Row isHungry() {
    return Row(
        children: [
          const SizedBox(width: 4,),
          feedButton(ItemList.allItemList[6]),  //
          const SizedBox(width: 4,),
          feedButton(ItemList.allItemList[7]),
          const SizedBox(width: 4,),
          feedButton(ItemList.allItemList[8]),
        ],
      );
  }

  Row feedRowButtonsSecond() {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget.char.injuryRate>=25 ? feedButton(ItemList.allItemList[3]): const SizedBox(),
        widget.char.sicknessRate>=25 ? isSick(): const SizedBox(),
      ],
    );
  }

  Row isSick() {
    return Row(
        children: [
          const SizedBox(width: 4,),
          feedButton(ItemList.allItemList[4]),
          const SizedBox(width: 4,),
          feedButton(ItemList.allItemList[5]),
        ],
      );
  }

      //TODO: ses eklencek
      //TODO: gün sonunda karakterlerin elde ettikleri durumları gün başında görüntülencek
  SizedBox feedButton(Item item) {
    return SizedBox(
        width: context.dynamicWidth(0.1),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: item.amount==0 ? null:(){
                item.amount--;
                setState(() { upStats(item); });
              },
              style: ElevatedButton.styleFrom(primary: Color(0xff234f1e)),
                child: ImageFiltered(
                imageFilter: item.amount!=0 ? ImageFilter.blur(sigmaX: 0, sigmaY: 0) : ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Image.asset(item.image!),
              ),
            ),
            Text(item.amount.toString()+"x"),
          ],
        ),
      );
  }

  void upStats(Item item) {
    if (item.name==ItemList.allItemList[9].name) {
      widget.char.thirstinessRate-=36;
    }else if(item.name==ItemList.allItemList[6].name){
      widget.char.hungerRate-=30;
    }else if(item.name==ItemList.allItemList[7].name){
      widget.char.hungerRate-=36;
    }else if(item.name==ItemList.allItemList[8].name){
      widget.char.hungerRate-=20;
    }else if(item.name==ItemList.allItemList[3].name){
      widget.char.injuryRate-=36;
    }else if(item.name==ItemList.allItemList[4].name){
      widget.char.sicknessRate-=36;
    }else if(item.name==ItemList.allItemList[5].name){
      widget.char.sicknessRate-=24;
    }

    if(widget.char.hungerRate<=0){
      widget.char.hungerRate=0;
    }else if(widget.char.injuryRate<=0){
      widget.char.injuryRate=0;
    }else if(widget.char.sicknessRate<=0){
      widget.char.sicknessRate=0;
    }else if(widget.char.thirstinessRate<=0){
      widget.char.thirstinessRate=0;
    }else if(widget.char.tirednessRate<=0){
      widget.char.tirednessRate=0;
    }

  }

  Padding JournalText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("${widget.char.name}'s Journal" , style: context.theme.textTheme.headline5?.copyWith(color: Colors.white)),
    );
  }

  ListView listViewBuilder() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount:10,
      itemBuilder: (context,index){
        return  Center(child: Text('Some text'));
    });
  }
}