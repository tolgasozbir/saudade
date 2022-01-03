import 'package:flutter/material.dart';
import 'package:saudade/utils/contextExtension.dart';

class MenuButton extends StatelessWidget {
  MenuButton({required this.onTap, required this.btnText, this.borderColor, this.borderWidth, Key? key }) : super(key: key);

  final btnText;
  final Color? borderColor;
  final double? borderWidth;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final Color surfaceColor=Color(0xFF545454);

    return GestureDetector(

      onTap: onTap,

      child: Padding(
        padding: const EdgeInsets.all(2.5),
        child: Container(
          height: double.infinity,
          child: Center(child: Text(btnText, style: context.theme.textTheme.headline5,)),
          decoration: BoxDecoration(
            color: surfaceColor,
            border: Border.all(color: borderColor ?? const Color(0xFFcd853f),width: borderWidth ?? 1.0 ),
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          ),
        ),
      ),
    );
  }
}