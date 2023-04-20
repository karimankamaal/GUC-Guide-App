import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/utils/dimensions.dart';
class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Color iconColor;

  const IconAndTextWidget({Key? key, required this.icon,
    required this.text,
    required this.color,
    required this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size:Dimensions.iconSize24),
        SizedBox(width: 5,),
        Text(text, style: TextStyle( color:Color(0xFFB6ACAC)))
      ],
    );
  }
}
