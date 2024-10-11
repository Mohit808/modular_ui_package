import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../common_widget/container_decorated.dart';
import '../../../text_atoms/text_common.dart';

class ProfileItemWidgets extends StatelessWidget {
  const ProfileItemWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerDecorated(shadow: [
      BoxShadow(color: Colors.grey.shade300,blurRadius: 5)

    ],paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 16,),color: Colors.white,child: Column(children: [
      SizedBox(height: 16,),
      customRow(FontAwesomeIcons.bell,"Notification"),
      Divider(height: 36,),
      customRow(FontAwesomeIcons.truck,"Add Vehicle"),
      Divider(height: 36,),
      customRow(Icons.support_agent_rounded,"Help & Support"),
      Divider(height: 36,),
      customRow(FontAwesomeIcons.book,"Guides"),
      Divider(height: 36,),
      customRow(Icons.privacy_tip,"Legal,Terms & Conditions"),
      Divider(height: 36,),
      customRow(Icons.star,"Rate Us"),
      SizedBox(height: 24,)
    ],),);
  }
  Widget customRow(icon,text){
    return Row(children: [
      SizedBox(height: 24,width: 24,child: FaIcon(icon,color: Colors.black54,size: 20,)),
      SizedBox(width: 24,),
      NormalText(text: text,fontWeight: FontWeight.w500,color: Colors.black54,),
      Spacer(),
      Icon(Icons.arrow_forward_ios,size: 18,color: Colors.black54,)
    ],);
  }
}
