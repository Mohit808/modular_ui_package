import 'package:flutter/material.dart';
import '../../text_atoms/text_common.dart';

class SomethingWentWrongWidget extends StatelessWidget {
  const SomethingWentWrongWidget({super.key, this.center,this.msg, this.paddingTop});
  final dynamic center;
  final String? msg;
  final double? paddingTop;

  @override
  Widget build(BuildContext context) {
    return  center==null? HeadingText(text: msg??"Something went wrong"):  Center(
      child: Padding(
        padding: EdgeInsets.only(top: paddingTop??8.0),
        child: HeadingText(text: msg??"Something went wrong"),
      ),
    );
  }
}

