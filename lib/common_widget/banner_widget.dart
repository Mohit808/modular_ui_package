import 'package:flutter/material.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';

import '../text_atoms/text_common.dart';
import '../theme/app_paddings.dart';
import 'container_decorated.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key, this.heading, this.description, this.buttonText, this.image, this.isNetworkImage,this.width,this.startColor,this.endColor});
  final String? heading;
  final String? description;
  final String? buttonText;
  final dynamic image;
  final bool? isNetworkImage;
  final double? width;
  final String? startColor;
  final String? endColor;
  @override
  Widget build(BuildContext context) {
    return ContainerDecorated(borderRadius: 15,padding: 0,width: width??double.infinity,
      linearGradient:  LinearGradient(
        colors: [
          startColor==null?const Color(0xFF3D6BF3):Color(int.parse(startColor!)),
          endColor==null?const Color(0xFF9EE0F3):Color(int.parse(endColor!)),
        ],
        begin: Alignment.topLeft,
        end: Alignment.centerRight,
        stops: [0.0, 0.8],
      )
      ,shadow: const [
        BoxShadow(
          offset: Offset(0, 0),
          blurRadius: 5,
          color: Color.fromRGBO(0, 0, 0, 0.16),
        )
      ],child: Padding(
        padding: AppPaddings.paddingAll16,
        child: Row(
          children: [
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                BigText20(text: heading??"Monsoon's Exotic \nHarvest!",color: Colors.white,maxLine: 2,overflow: TextOverflow.ellipsis,),
                const SizedBox(height: 16,),
                SmallText(text: description??"Up to 30% OFF on fruits that \nare too good to last forever",color: Colors.white,fontWeight: FontWeight.w500,maxLine: 2,overflow: TextOverflow.ellipsis,),
                const SizedBox(height: 16,),
                ContainerDecorated(borderRadius: 8,elevation: 3,paddingEdgeInsets:const EdgeInsets.symmetric(horizontal: 12,vertical: 6),color: Colors.white,child: SmallText(text: buttonText??"ORDER NOW",fontWeight: FontWeight.w800,size: 10,color: Colors.blue,),)
              ],),
            ),
            image==null?SizedBox():image.runtimeType!=String?image:isNetworkImage!=null?ImageCommon(image,height: 150,width: 150):Image.asset(image?? "assets/images/vegitable.png",height: 150,width: 150,),

          ],
        ),
      ),);
  }
}
