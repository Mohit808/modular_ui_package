
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modular_ui_package/project_modules/story/shimmer/shimmer_story_widget.dart';
import 'package:modular_ui_package/theme/app_colors.dart';

import '../../common_functions/image_network.dart';
import '../../common_widget/container_decorated.dart';
import '../../text_atoms/text_common.dart';
import '../../utils/network_handling/api_response.dart';
import '../../utils/utils.dart';
import 'all_stories/all_stories_screen.dart';
import 'controller_main_story.dart';
import 'full_story/full_story_screen.dart';
import 'my_story/my_story_screen.dart';
import 'story_add_screen/story_add_screen.dart';
import 'widget/whatsapp_sqare_story_widget.dart';
import 'widget/whatsapp_story_widget.dart';

class StoryMainWidget extends StatelessWidget {
  final Function({required dynamic userId, required dynamic name, required dynamic image,})? onUserTap;
  final Color? themeColor;
  final bool isBlack;
  const StoryMainWidget({super.key, this.onUserTap, this.themeColor, required this.isBlack,});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerMainStory(),
        builder: (controller) {
          Color color=isBlack?Colors.white:Colors.black;
          Color colorLight=isBlack?Colors.white70:Colors.black54;
          return Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(scrollDirection: Axis.horizontal,
                child: SizedBox(height: 120,
                  child:
                  controller.apiResponseStory.status==Status.LOADING?const ShimmerStoryWidget() :
                  Row(children: [

                    SizedBox(height: 120,width: 90,
                      child: InkWell(onTap: (){
                        showModalBottomSheet(showDragHandle: true,context: context, builder: (builder){
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(spacing: 10,mainAxisSize: MainAxisSize.min,children: [
                              InkWell(onTap: () async {
                                Get.back();
                                var xFile=await ImagePicker().pickImage(source: ImageSource.camera);
                                if(xFile!=null) Get.to(()=>StoryAddScreen(path: xFile.path,));
                              },
                                child: Row(spacing: 16,
                                  children: [
                                    const SizedBox(),
                                    const Icon(Icons.camera_alt_outlined,size: 30,),
                                    SmallText(text: "Camera".tr,fontWeight: FontWeight.w700,size: 16),
                                  ],
                                ),
                              ),
                              const Divider(),

                              InkWell(onTap: () async {
                                Get.back();
                                var xFile=await ImagePicker().pickImage(source: ImageSource.gallery);
                                if(xFile!=null)Get.to(()=>StoryAddScreen(path: xFile.path,));
                              },
                                child: Row(spacing: 16,
                                  children: [
                                    const SizedBox(),
                                    const Icon(Icons.landscape_outlined,size: 30,),
                                    SmallText(text: "Gallery".tr,fontWeight: FontWeight.w700,size: 16),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8,),
                              const SizedBox(),
                            ],),
                          );
                        });

                      },child: Stack(
                        children: [

                          InkWell(onTap: (){
                            if(controller.listMyStory.isNotEmpty)Get.to(()=> MyStoryScreen(color: themeColor,isBlack: isBlack,));
                          },child: controller.listMyStory.isEmpty?ContainerDecorated(color: isBlack?Colors.black:null,colorBorder: Colors.grey.shade400,borderRadius: 10,): WhatsAppSquareStoryWidget(height: 120,width: 90,isViewedList: controller.listMyStory.map((toElement)=>toElement.viewed??false).toList(),
                            child:  Stack(
                              children: [
                                ImageCommon(controller.listMyStory.first.mediaUrl,height: 120,width: 90,borderRadius: 10,),
                                Positioned.fill(child: Container(decoration: BoxDecoration(color: Colors.black26,borderRadius: BorderRadius.circular(10)),),)
                              ],
                            ),)),

                          Row(mainAxisAlignment: controller.listMyStory.isEmpty? MainAxisAlignment.center:MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(top: controller.listMyStory.isEmpty?16:0),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: WhatsAppStoryWidget(size: controller.listMyStory.isEmpty? 50:35,storyCount: controller.listMyStory.length,child: ContainerDecorated(padding: 0,borderRadius: 50,color: AppColors.primary,child: ImageCommon(userInfo?.image,borderRadius: 50,)),),
                                    ),
                                    Positioned(bottom: 0,right: 0,child: Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(40)),child: const Icon(Icons.add_circle,color: Colors.green,)))
                                  ],
                                ),
                              ),
                            ],
                          ),

                          Positioned(bottom: 8,right: 8,left: 8,child: Text( "Your Story",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 13,color: controller.listMyStory.isEmpty?colorLight:Colors.white),textAlign: TextAlign.center,))
                        ],
                      )),
                    ),
                    const SizedBox(width: 12,),

                    SizedBox(height: 120,
                      child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: controller.listGroupedStory.length,shrinkWrap: true,itemBuilder: (itemBuilder,index){
                        return SizedBox(width: 100,child: Stack(
                          children: [
                            InkWell(onTap: (){
                              int indexItem=controller.listGroupedStory[index].items!.indexWhere((e) => e.viewed == false) != -1 ? controller.listGroupedStory[index].items!.indexWhere((e) => e.viewed == false) : 0;
                              Get.to(()=>FullStoryScreen(isBlack: isBlack,listGroupedStory: controller.listGroupedStory,initialIndex: index,initialIndexItem: indexItem,onUserTap: ({required image, required name, required userId}) {
                                if (onUserTap != null) {onUserTap!(userId: userId, name:  name, image: image,);}

                              },));
                            },child: WhatsAppSquareStoryWidget(height: 120,width: 90,isViewedList: controller.listGroupedStory[index].items?.map((toElement)=>toElement.viewed??false).toList(),
                              child: Stack(
                                children: [
                                  ImageCommon(controller.listGroupedStory[index].items!.firstWhere((e) => e.viewed != true, orElse: () => controller.listGroupedStory[index].items!.first,).mediaUrl,height: 120,width: 90,borderRadius: 10,),
                                  Positioned.fill(child: Container(decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(10))))
                                ],
                              ),)),

                            Padding(
                              padding: const EdgeInsets.only(top: 4.0,left: 4),
                              child: InkWell(onTap: (){
                                if (onUserTap != null) onUserTap!(userId: controller.listGroupedStory[index].userId!, name:  controller.listGroupedStory[index].name!, image: controller.listGroupedStory[index].image!,);

                              },child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),border: Border.all(color: Colors.white,width: 0.5)),child: ImageCommon("${controller.listGroupedStory[index].image}",height: 24,width: 24,borderRadius: 40,))),
                            )
                          ],
                        ));
                      }),
                    ),
                    if(controller.listGroupedStory.length>9)
                      ContainerDecorated(borderRadius: 30,onTap: (){
                      Get.to(()=>AllStoriesScreen(isBlack: true,onUserTap: ({required image, required name, required userId}) {
                        if (onUserTap != null) onUserTap!(userId: userId, name:  name, image: image,);
                      },));
                    },paddingEdgeInsets: const EdgeInsets.symmetric(vertical: 16,horizontal: 5),color: const Color(0xFF7E127E),child: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 16,)),
                  ],),
                ),
              ),
            ],
          );
        }
    );
  }
}