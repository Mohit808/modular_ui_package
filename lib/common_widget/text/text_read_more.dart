import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../theme/app_colors.dart';

class TextReadMore extends StatelessWidget {
  const TextReadMore(this.text,{super.key, this.fontSize});
  final String text;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return ReadMoreText(text,style: TextStyle(fontSize: fontSize??12),trimMode: TrimMode.Line, trimLines: 2, colorClickableText: Colors.pink, trimCollapsedText: '+ Show more', trimExpandedText: '- Show less', moreStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: AppColors.primary));

  }
}
