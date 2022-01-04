import 'dart:async';

import 'package:flutter/material.dart';
import 'package:saudade/utils/context_extension.dart';

class DayIndicator extends StatefulWidget {
  const DayIndicator({ Key? key }) : super(key: key);

  @override
  _DayIndicatorState createState() => _DayIndicatorState();
}

class _DayIndicatorState extends State<DayIndicator> {

  int hour=08;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      hour+=1;
      if (hour==24) {
        timer.cancel();
        Navigator.pushNamed(context, "preparingScreen");
      }
      setState(() {});    
    });
  }



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.2),
      child: Card(
        color: Color(0xFF444444),
        shape: Border.all(color: Colors.grey),
        child: Column(
          children: [
            Expanded(child: Center(child: Text("Day 1",style: context.theme.textTheme.subtitle1))),
            Expanded(child: Center(child: Text("${hour}:00",style: context.theme.textTheme.subtitle1!.copyWith(fontSize: 15)))),
            Expanded(child: Center(child: Text("20 °C",style: context.theme.textTheme.subtitle1!.copyWith(fontSize: 14)))),
          ],
        ),
      ),
    );
  }
}