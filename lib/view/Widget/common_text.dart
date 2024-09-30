import 'package:flutter/material.dart';
class CommonText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLine;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final TextDecoration? textDecoration;
  const CommonText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.maxLine,
    this.textAlign,
    this.textOverflow,
    this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          color: color ?? Colors.black,
          fontSize: fontSize ?? 10,
          fontWeight: fontWeight ?? FontWeight.w500),
      maxLines: maxLine??10,
      overflow:textOverflow??TextOverflow.ellipsis,
    );
  }
}