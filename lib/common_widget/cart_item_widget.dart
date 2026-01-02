import 'package:flutter/material.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/utils/app_images.dart';

import '../text_atoms/text_common.dart';
import 'container_decorated.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key,this.image,this.name, this.qty, this.price, this.discountedPrice, this.plusMinus,this.storeName});
  final String? image;
  final String? name;
  final dynamic qty;
  final dynamic price;
  final dynamic discountedPrice;
  final dynamic plusMinus;
  final dynamic storeName;

  @override
  Widget build(BuildContext context) {
    return ContainerDecorated(borderRadius: 15,color: Colors.white,padding: 8,child: Row(children: [
      ContainerDecorated(padding: 0,child: ImageCommon(image?? AppImagesConst.vegitable,height: 40,width: 40,)),
      const SizedBox(width: 8,),
       Expanded(flex: 3,child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmallText(text: name??"Coconad 100% Pure coconut oil",fontWeight: FontWeight.w500,),
          SmallText(text: qty??"1L",color: Colors.grey,fontWeight: FontWeight.w500,),
          SmallText(text: "$storeName",color: Colors.grey,fontWeight: FontWeight.w500,maxLine: 1,overflow: TextOverflow.ellipsis,),
        ],
      )),
      const SizedBox(width: 16,),
      SizedBox(width: 80,child: plusMinus,),
      // ContainerDecorated(paddingEdgeInsets:const EdgeInsets.symmetric(horizontal: 10,vertical: 6),borderRadius: 8,color: Colors.white,colorBorder: Colors.grey.shade200,
      //   child:  Row(children: [
      //     NormalHeadingText(text: "-",color: Colors.green,fontWeight: FontWeight.bold,),
      //     SizedBox(width: 16,),
      //     NormalHeadingText(text: "1",color: Colors.green,fontWeight: FontWeight.bold,),
      //     SizedBox(width:16,),
      //     NormalHeadingText(text: "+",color: Colors.green,fontWeight: FontWeight.bold,),
      //   ],),
      // ),

      const SizedBox(width: 16,),

      Expanded(
        child: Column(children: [
          discountedPrice==null?SizedBox():SmallText(text: "${discountedPrice!=null ?"₹$price":""}",size: 11,textDecoration: TextDecoration.lineThrough,color: Colors.grey,fontWeight: FontWeight.w400,),
          SmallText(text: "₹${discountedPrice??price}",fontWeight: FontWeight.w700,),
        ],),
      )

    ],),);
  }
}
