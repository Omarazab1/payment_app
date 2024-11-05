import 'package:flutter/material.dart';

class DetailsText extends StatelessWidget {
  const DetailsText({super.key, required this.text1, required this.text2,  this.textStyle});
  final String text1;
  final String text2;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text1 ,style:  textStyle,),
        Text(text2, style: textStyle,),

      ],
    );
  }
}
