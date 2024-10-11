import 'package:flutter/material.dart';

import '../../../common_widget/container_decorated.dart';
import '../../../text_atoms/text_common.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerDecorated(paddingEdgeInsets: EdgeInsets.symmetric(vertical: 16),shadow: [
      BoxShadow(color: Colors.grey.shade300,blurRadius: 5)
    ],color: Colors.white,child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
      Icon(Icons.exit_to_app,color: Colors.red,),
      HeadingText(text: "Logout",color: Colors.red,)
    ],),);
  }
}
