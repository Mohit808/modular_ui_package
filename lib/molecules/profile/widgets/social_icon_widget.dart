import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialIconWidget extends StatelessWidget {
  const SocialIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,children: [
      FaIcon(FontAwesomeIcons.instagram,size: 40,),
      SizedBox(width: 48,),
      FaIcon(FontAwesomeIcons.facebook,size: 40,),
      SizedBox(width: 48,),
      FaIcon(FontAwesomeIcons.whatsapp,size: 40,),
    ],);
  }
}
