import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common_functions/image_network.dart';
import '../../../../models/story_model.dart';
import '../../../../text_atoms/text_common.dart';
import '../../full_story/full_story_screen.dart';
import 'controller_my_full_story.dart';

class MyFullStoryScreen extends StatelessWidget {
  final List<Stories> list;
  final bool isBlack;
  const MyFullStoryScreen({super.key, required this.list, required this.isBlack});


  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerMyFullStory(list: list),
      builder: (controller) {
        Color color=isBlack?Colors.white:Colors.black;
        Color colorLight=isBlack?Colors.white70:Colors.black54;
        return WillPopScope(onWillPop: ()async{
          controller.timer?.cancel();
          return true;
        },
          child: Scaffold(
            backgroundColor: isBlack?Colors.black:null,
            body: Stack(
              children: [
                PageView.builder(onPageChanged: (value){
                  controller.selectedIndex=value;
                  controller.startProgressTimer();
                },controller: controller.pageController,itemCount: list.length,scrollDirection: Axis.horizontal,pageSnapping: true,itemBuilder: (itemBuilder,index){
                  return InkWell(onTap: (){
                    controller.tapToNext();
                  },
                    child: ImageCommon("${list[index].mediaUrl}",boxFit: BoxFit.fitWidth,),
                  );
                }),

                Positioned(bottom: 36,left: 0,right: 0,
                  child: Column(
                    children: [
                      if(list[controller.selectedIndex].text!=null && "${list[controller.selectedIndex].text}".isNotEmpty)Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SmallText(text: "${list[controller.selectedIndex].text}",color: colorLight,textAlign: TextAlign.center,),
                      ),
                      Row(mainAxisSize: MainAxisSize.min,mainAxisAlignment: MainAxisAlignment.center,spacing: 8,
                        children: [
                          Icon(Icons.remove_red_eye_outlined,color: colorLight,),
                          SmallText(text: "${list[controller.selectedIndex].viewCount??'0'}",color: colorLight,size: 16,fontWeight: FontWeight.w600,),
                        ],
                      ),
                    ],
                  ),
                ),



                ///////// app bar
                Padding(
                  padding: const EdgeInsets.only(top: 60.0,left: 16),
                  child: Column(spacing: 8,crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(spacing: 16,
                        children: [
                          InkWell(onTap: (){
                            Get.back();
                          },child: Icon(Icons.arrow_back_ios_new_rounded,color: color,)),

                          Row(spacing: 8,children: [
                            ImageCommon(list[controller.selectedIndex].user?.image,sizeAndCircle: 35,),
                            Column(spacing: 4,crossAxisAlignment: CrossAxisAlignment.start,children: [
                              SmallText(text: "You",size: 15,fontWeight: FontWeight.w600,color: color,),
                              SmallText(text: formatDateRelative("${list[controller.selectedIndex].createdAt}"),color: colorLight,size: 13,fontWeight: FontWeight.w500,)
                            ],),
                          ],)

                        ],
                      ),
                    ],
                  ),
                ),


                // progress bar
                Padding(
                  padding: const EdgeInsets.only(top: 48.0),
                  child: SizedBox(height: 4,
                    child: Row(children: List.generate(list.length, (x) {
                      return Expanded(child: Container(height: 4, margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(color: x < controller.selectedIndex ? Colors.green : Color(0xFFBAB8B8),borderRadius: BorderRadius.circular(4),),
                        child:
                        x == controller.selectedIndex
                            ? FractionallySizedBox(alignment: Alignment.centerLeft, widthFactor: controller.progress, child: Container(decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(4),),),)
                            : null,
                      ),
                      );
                    },),),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
