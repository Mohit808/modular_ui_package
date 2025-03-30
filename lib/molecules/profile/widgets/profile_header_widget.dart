import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../common_functions/image_network.dart';
import '../../../common_widget/container_decorated.dart';
import '../../../text_atoms/text_common.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/app_images.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return

      Row(crossAxisAlignment: CrossAxisAlignment.start,children: [
        ContainerDecorated(elevation: 2,padding: 2,color: AppColors.primary,borderRadius: 50,child: SizedBox(height: 50,width: 50,child: ImageCommon(src: AppImagesConst.user,))),
        SizedBox(width: 8,),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingText(text: "Amit Yadav"),
              SizedBox(height: 2,),
              SmallText(text: "AmitYadav@marioxsoftware.com",fontWeight: FontWeight.w500,color: Colors.grey,),
              SizedBox(height: 4,),
              SmallText(text: "AUUDI EV 3678",fontWeight: FontWeight.w600,)
            ],
          ),
        ),
        FaIcon(FontAwesomeIcons.penToSquare,size: 18,)

      ],);
  }
}
