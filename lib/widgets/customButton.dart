import 'package:flutter/material.dart';
import 'package:saudade/contextExtension.dart';

class customButton extends StatelessWidget {
  const customButton({
    required this.buttonText, 
    required this.borderColor,
    Key? key}) : super(key: key);

  final String buttonText;
  final Color borderColor;
  //final double paddingNum;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.5),
      child: ElevatedButton(
        child: Center(child: Text(buttonText, style: context.theme.textTheme.headline5),),
        onPressed: () {

        },
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF545454),
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            side: BorderSide(color: borderColor),
          ),
        ),
      ),
    );
  }
}
