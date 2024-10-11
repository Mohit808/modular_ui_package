import 'package:flutter/material.dart';

import 'container_decorated.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0,bottom: 16),
      child: ContainerDecorated(borderRadius: 20,paddingEdgeInsets: EdgeInsets.only(top: 4,bottom: 4,left: 8,right: 2),child: Row(mainAxisSize: MainAxisSize.min,children: [
        Text(text),
        SizedBox(width: 8,),
        Icon(Icons.cancel)
      ],),),
    );
  }
}
