import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../text_atoms/text_common.dart';
import '../theme/app_paddings.dart';

class BottomSheetCommon extends StatelessWidget {
  const BottomSheetCommon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
    ],);
  }
}



class BottomSheetImageSelection extends StatelessWidget {
  const BottomSheetImageSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Container(decoration: BoxDecoration(color: CupertinoColors.white,borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding:AppPaddings.paddingAll16,
        child: Column(mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            InkWell(onTap: (){
              selectImage(ImageSource.camera);
            },
              child: const Row(children: [
                Icon(Icons.camera_alt),
                SizedBox(width: 16,),
                NormalHeadingText(text: "Camera"),
              ],),
            ),
            const Divider(),
            const SizedBox(height: 16,),
            InkWell(onTap: (){
              selectImage(ImageSource.gallery);
            },
              child: const Row(children: [
                Icon(Icons.browse_gallery),
                SizedBox(width: 16,),
                NormalHeadingText(text: "Gallary"),
              ],),
            ),
            const SizedBox(height: 24,)
          ],
        ),
      ),
    );
  }
  selectImage(ImageSource source) async {
    var data=await ImagePicker().pickImage(source: source);
    if(data!=null){
      Get.back(result: data.path);
    }else{
      Get.back();
    }
  }
}