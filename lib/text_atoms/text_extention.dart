import 'package:flutter/material.dart';

extension TextExtention on Text{
  Text get smallText => Text(data??"", style: const TextStyle().copyWith(color: Colors.black,fontSize: 12),);
  Text get normalText => Text(data??"", style: const TextStyle().copyWith(color: Colors.black,fontSize: 14),);
  Text get normalHeadingText => Text(data??"", style: style==null?const TextStyle().copyWith(color: Colors.black,fontWeight: FontWeight.w600):style!.copyWith(fontWeight: FontWeight.w600),);
  Text get headingText => Text(data??"", style: const TextStyle().copyWith(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),);
  Text get bigSemiText => Text(data??"", style: const TextStyle().copyWith(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),);
  Text get bigText20 => Text(data??"", style: const TextStyle().copyWith(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w700),);
}

extension TextColor on Text{
  Text get black => Text(data??"",style: style!.copyWith(color: Colors.black),);
  Text get white => Text(data??"",style: style!=null?style!.copyWith(color: Colors.white):TextStyle(color: Colors.white),);
}




abstract class StyleCustom{
  static TextStyle get textStyle =>const TextStyle(fontSize: 12);
}