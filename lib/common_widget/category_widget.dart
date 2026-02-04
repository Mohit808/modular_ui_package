import 'package:flutter/material.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/utils/app_images.dart';

import '../text_atoms/text_common.dart';
import 'container_decorated.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, this.height, this.width,this.image,this.text,this.loading});
  final double? height;
  final double? width;
  final String? image;
  final String? text;
  final bool? loading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContainerDecorated(color: loading!=null?null:Colors.pinkAccent.shade100.withOpacity(0.1),borderRadius: 15,child: ImageCommon( image!=null?image! : DateTime.timestamp().millisecond.isEven?AppImagesConst.vegitable2: AppImagesConst.vegitable,height: height??75,width: width??75,borderRadius:10),),
        const SizedBox(height: 8,),
        SizedBox(width: 75,child: SmallText(text: text??"Fresh \nVegitable",fontWeight: FontWeight.w700,textAlign: TextAlign.center,))
      ],
    );
  }
}
