import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../common_functions/image_network.dart';
import '../../../common_widget/appbar_common.dart';
import '../controller_main_story.dart';
import '../full_story/full_story_screen.dart';
import '../widget/whatsapp_sqare_story_widget.dart';

class AllStoriesScreen extends StatelessWidget {
  final Function({required dynamic userId, required dynamic name, required dynamic image,})? onUserTap;
  final bool isBlack;
  const AllStoriesScreen({super.key, this.onUserTap, required this.isBlack});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerMainStory(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "Stories".tr,color: AppColors.scaffoldBackgroundColor,colorIconTheme: Colors.black,titleColor: Colors.black,centerTitle: false,),
          body: SmartRefresher(controller: controller.refreshControllerStory,
            enablePullUp: controller.loadMoreStory,
            onRefresh: controller.refreshStoryData,
            onLoading: controller.fetchStoryData,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0,right: 16,top: 16),
                child: Column(children: [
                  GridView.builder(itemCount: controller.listGroupedStory.length,shrinkWrap: true,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 250), itemBuilder: (itemBuilder,index){
                    return Stack(
                      children: [
                        InkWell(onTap: (){
                          Get.to(()=>FullStoryScreen(listGroupedStory: controller.listGroupedStory,initialIndex: index,isBlack: isBlack,));
                        },child: WhatsAppSquareStoryWidget(isViewedList: controller.listGroupedStory[index].items!.map((toElement)=>toElement.viewed!).toList(), child: ImageCommon(controller.listGroupedStory[index].items!.first.mediaUrl,borderRadius: 10,))),

                        Padding(padding: const EdgeInsets.only(top: 4.0,left: 4),
                          child: InkWell(onTap: (){
                            if (onUserTap != null) {onUserTap!(userId: controller.listGroupedStory[index].userId, name:  controller.listGroupedStory[index].name, image: controller.listGroupedStory[index].image,);}
                          },child: ImageCommon(controller.listGroupedStory[index].image??"",height: 40,width: 40,borderRadius: 30,)),
                        ),
                      ],
                    );
                  }),

                ],),
              ),
            ),
          ),
        );
      }
    );
  }
}
