import 'package:flutter/material.dart';
import 'package:saudade/contextExtension.dart';
import 'package:saudade/models/character.dart';

class CharacterInfo extends StatelessWidget {
  const CharacterInfo({required this.char, Key? key }) : super(key: key);

  final Character char;

  @override
  Widget build(BuildContext context) {
return SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
            Text("${char.name}" , style: context.theme.textTheme.headline5?.copyWith(color: Colors.white)),
            Text("Mood : ${char.mood}" , style: context.theme.textTheme.headline6?.copyWith(color: Colors.white)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${char.name}'s Journal" , style: context.theme.textTheme.headline5?.copyWith(color: Colors.white)),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:20,
              itemBuilder: (context,index){
                return  Center(child: Text('Some text'));
            }),
          ],
        ),
      );
  }
}