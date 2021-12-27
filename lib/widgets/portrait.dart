import 'package:flutter/material.dart';
import 'package:saudade/contextExtension.dart';

class Portrait extends StatefulWidget {
  Portrait({
    required this.image,
    required this.height,
    Key? key
  }) : super(key: key);

  final double height;
  final String image;
  //late


  @override
  _PortraitState createState() => _PortraitState();
}

class _PortraitState extends State<Portrait> {
  //final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        height: context.dynamicHeigh(widget.height),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.image),
                fit: BoxFit.cover),
            border: Border.all(color: Color(0xFFfcba03)),
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }
}
