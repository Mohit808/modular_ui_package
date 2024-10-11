import 'dart:io';

import 'package:flutter/material.dart';
import 'package:modular_ui_package/utils/app_images.dart';

class NetworkOrAssetImage extends StatelessWidget {
  const NetworkOrAssetImage({super.key, required this.src, this.color, this.borderRadius, this.height, this.width, this.fit,this.isFile});
  final String src;
  final Color? color;
  final double? borderRadius;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final bool? isFile;

  @override
  Widget build(BuildContext context) {
    return
        ClipRRect(borderRadius: BorderRadius.circular(borderRadius??0),child:
        isFile!=null?
        Image.file(File(src),height: height,width: width,color:color,fit: fit,errorBuilder: (a,b,c){
          return Image.asset(AppImagesConst.imageError);
        },):
        src.startsWith("http") ?
        Image.network(src,height: height,width: width,color:color,fit: fit,errorBuilder: (a,b,c){
          return Image.asset(AppImagesConst.imageError);
        },):

        Image.asset(src,height: height,width: width,color: color,fit: fit,errorBuilder: (a,b,c){
          return Image.asset(AppImagesConst.imageError,color: color,height: height,width: width,);
        },),);
  }
}
