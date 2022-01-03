import 'dart:ui';

import 'package:saudade/contextExtension.dart';
import 'package:flutter/material.dart';
import 'package:saudade/item_list.dart';
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
return SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
            Text("${widget.char.name}" , style: context.theme.textTheme.headline5?.copyWith(color: Colors.white)),
            Text("Mood : ${widget.char.mood}" , style: context.theme.textTheme.headline6?.copyWith(color: Colors.white)),
            SizedBox(height: 12,),
            feedRowButtons(context),
            JournalText(context),
            listViewBuilder(),
          ],
        ),
      );
  }

  Row feedRowButtons(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        feedButton(context,ItemList.allItemList[9]),
        const SizedBox(width: 4,),
        feedButton(context,ItemList.allItemList[6]),
        const SizedBox(width: 4,),
        feedButton(context,ItemList.allItemList[7]),
        const SizedBox(width: 4,),
        feedButton(context,ItemList.allItemList[8]),
      ],
    );
  }

      //TODO: ses eklencek ve yediği şeye göre stat artcak
  SizedBox feedButton(BuildContext context,Item item) {
    return SizedBox(
        width: context.dynamicWidth(0.1),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: item.amount==0 ? null:(){
                item.amount--;
                setState(() {});
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

  Padding JournalText(BuildContext context) {
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