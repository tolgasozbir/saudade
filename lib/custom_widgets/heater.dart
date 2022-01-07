
import 'package:flutter/material.dart';
import 'package:saudade/custom_widgets/day_indicator.dart';
import 'package:saudade/utils/context_extension.dart';
import 'package:saudade/utils/item_list.dart';
import 'package:saudade/utils/mySnackBar.dart';

class Heater extends StatefulWidget {
  const Heater({ Key? key }) : super(key: key);

  @override
  _HeaterState createState() => _HeaterState();
}

class _HeaterState extends State<Heater> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/heater.png"),
        Expanded(child: fuelInfo()),
        Expanded(flex: 3, child: addFuelButton())
      ],
    );
  }

  Widget fuelInfo() {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/fuel.png"),
        Text("${ItemList.allItemList[10].amount}x",style: context.theme.textTheme.headline6),
      ],
    );
  }

  Widget addFuelButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: context.dynamicWidth(0.5), 
        height: context.dynamicHeight(0.3), 
        child: ElevatedButton(
          child: Text("Add Fuel",style: context.theme.textTheme.headline4),
          style: ElevatedButton.styleFrom(
            primary: Colors.white12,
            side: BorderSide(width: 2, color: Colors.blueGrey),
          ),
          onPressed: (){

            if (ItemList.allItemList[10].amount>=1) {
              if (addFuelCounter<3) {
                heaterIsActive=true;
                ItemList.allItemList[10].amount--;
                addFuelCounter++;
                temperature+=5;
                setState(() { });
              }else{
                mySnackBar(context, "no more can be added fuel", 2);
              }

            }else{
              mySnackBar(context," not enough fuel", 2);
            }

          }, 
        )
      ),
    );
  }
}

bool heaterIsActive = false;
int addFuelCounter = 0;