import 'package:flutter/material.dart';

class SmallText extends StatelessWidget{
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;
  final double? letterSpacing;
  final int? maxLine;
  final double? padding;
  final double? paddingTop;
  final double? paddingBottom;
  final double? paddingLeft;
  final double? paddingRight;

  const SmallText({super.key, required this.text, this.color, this.size, this.fontWeight, this.textAlign, this.overflow, this.textDecoration, this.letterSpacing, this.maxLine, this.padding, this.paddingTop, this.paddingBottom, this.paddingLeft, this.paddingRight});
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: paddingTop??padding??0,bottom: paddingBottom??padding??0,left: paddingLeft??padding??0,right: paddingRight??padding??0), child: Text(text,maxLines: maxLine,style: TextStyle(letterSpacing: letterSpacing,decoration: textDecoration,color: color,fontSize: size??12,fontWeight: fontWeight),textAlign: textAlign,overflow: overflow,),
    );
  }
}

class NormalText extends StatelessWidget{
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;
  final double? letterSpacing;


  const NormalText({super.key, required this.text, this.color, this.size, this.fontWeight, this.textAlign, this.overflow, this.textDecoration, this.letterSpacing});
  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(letterSpacing: letterSpacing,decoration: textDecoration,color: color,fontSize: size,fontWeight: fontWeight),textAlign: textAlign,overflow: overflow,);
  }
}

class NormalHeadingText extends StatelessWidget{
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;
  final double? letterSpacing;


  const NormalHeadingText({super.key, required this.text, this.color, this.size, this.fontWeight, this.textAlign, this.overflow, this.textDecoration, this.letterSpacing});
  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(letterSpacing: letterSpacing,decoration: textDecoration,color: color,fontSize: size,fontWeight: fontWeight??FontWeight.w600),textAlign: textAlign,overflow: overflow,);
  }
}
class HeadingText extends StatelessWidget{
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;
  final double? letterSpacing;


  const HeadingText({super.key, required this.text, this.color, this.size, this.fontWeight, this.textAlign, this.overflow, this.textDecoration, this.letterSpacing});
  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(letterSpacing: letterSpacing,decoration: textDecoration,color: color,fontSize: size??16,fontWeight: fontWeight??FontWeight.w600),textAlign: textAlign,overflow: overflow,);
  }
}

class BigSemiText extends StatelessWidget{
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;
  final double? letterSpacing;


  const BigSemiText({super.key, required this.text, this.color, this.size, this.fontWeight, this.textAlign, this.overflow, this.textDecoration, this.letterSpacing});
  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(letterSpacing: letterSpacing,decoration: textDecoration,color: color,fontSize: size??18,fontWeight: fontWeight??FontWeight.w600),textAlign: textAlign,overflow: overflow,);
  }
}

class BigText20 extends StatelessWidget{
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;
  final double? letterSpacing;
  final int? maxLine;




  const BigText20({super.key, required this.text, this.color, this.size, this.fontWeight, this.textAlign, this.overflow, this.textDecoration, this.letterSpacing, this.maxLine});
  @override
  Widget build(BuildContext context) {
    return Text(text,maxLines: maxLine,style: TextStyle(letterSpacing: letterSpacing,decoration: textDecoration,color: color,fontSize: size??20,fontWeight: fontWeight??FontWeight.w700),textAlign: textAlign,overflow: overflow,);
  }
}
class BigText24 extends StatelessWidget{
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;
  final double? letterSpacing;
  final int? maxLines;



  const BigText24({super.key, required this.text, this.color, this.size, this.fontWeight, this.textAlign, this.overflow, this.textDecoration, this.letterSpacing, this.maxLines});
  @override
  Widget build(BuildContext context) {
    return Text(text,maxLines: maxLines,style: TextStyle(letterSpacing: letterSpacing,decoration: textDecoration,color: color,fontSize: size??24,fontWeight: fontWeight??FontWeight.w700),textAlign: textAlign,overflow: overflow,);
  }
}