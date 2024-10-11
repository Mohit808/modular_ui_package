import 'package:flutter/material.dart';
import '../../text_atoms/text_common.dart';

class SomethingWentWrongWidget extends StatelessWidget {
  const SomethingWentWrongWidget({super.key, this.center,this.msg});
  final dynamic center;
  final String? msg;

  @override
  Widget build(BuildContext context) {
    return  center==null? HeadingText(text: msg??"Something went wrong"):  Center(child: HeadingText(text: msg??"Something went wrong"),);
  }
}

