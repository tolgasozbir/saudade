import 'package:flutter/material.dart';
import 'package:saudade/contextExtension.dart';

class Portrait extends StatelessWidget {
  const Portrait({required this.onTap, required this.image, Key? key}) : super(key: key);

  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {

    final Color borderColor = Color(0xFFfcba03);

    return GestureDetector(

      onTap:()=>onTap(),

      child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        height: context.dynamicHeight(0.2),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover),
            border: Border.all(color: borderColor),
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
      ),
    );
  }
}