import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_functions/image_network.dart';
import '../../../models/story_model.dart';
import '../../../text_atoms/text_common.dart';
import 'controller_full_story.dart';

class FullStoryScreen extends StatelessWidget {
  final Function({required dynamic userId, required dynamic name, required dynamic image,})? onUserTap;
  const FullStoryScreen({super.key, required this.listGroupedStory, required this.initialIndex, this.initialIndexItem, this.onUserTap, required this.isBlack});
  final List<GroupedStories> listGroupedStory;
  final int initialIndex;
  final int? initialIndexItem;
  final bool isBlack;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerFullStory(listGroupedStory: listGroupedStory,initialIndex: initialIndex,initialIndexItem: initialIndexItem),
        builder: (controller) {
          Color color=isBlack?Colors.white:Colors.black;
          Color colorLight=isBlack?Colors.white70:Colors.black54;

          return WillPopScope(onWillPop: ()async{
            controller.timer?.cancel();
            return true;
          },
            child: Scaffold(
              backgroundColor: isBlack==true?Colors.black:null,
              body: PageView.builder(controller: controller.pageController,itemCount: listGroupedStory.length,onPageChanged: (value){
                if( listGroupedStory[value].items!.length>1){
                  controller.canScroll=true;
                  controller.update();
                }
                controller.selectedIndex=0;
                controller.startProgressTimer();
              },itemBuilder: (itemBuilder,index){
                return Stack(
                  children: [
                    GestureDetector(
                      onHorizontalDragStart: (details) {
                        controller.dragStart = details.globalPosition;
                      },
                      onHorizontalDragUpdate: (details) {
                        final delta = details.globalPosition.dx - controller.dragStart.dx;

                        if(!controller.canTriggerDrag()) return;
                        if (delta > 0) {
                          debugPrint("⬅️ Dragging BACKWARD");
                          if(controller.listGroupedStory[index].items!.length==1){
                            controller.pageController.previousPage(duration: Duration(milliseconds: 200), curve: Curves.easeIn);
                          }else
                          if(controller.selectedIndex<=controller.listGroupedStory[index].items!.length-1){
                            controller.canScroll=true;
                            controller.selectedIndex--;
                            controller.pageControllerItem.previousPage(duration: Duration(milliseconds: 200), curve: Curves.easeIn);
                            controller.update();
                          }

                        } else if (delta < 0) {
                          debugPrint("➡️ Dragging FORWARD");
                          if(controller.selectedIndex==controller.listGroupedStory[index].items!.length-1){
                            controller.canScroll=false;
                            controller.pageController.nextPage(duration: Duration(milliseconds: 200), curve: Curves.easeIn);

                          }
                        }
                      },
                      child: PageView.builder(controller: controller.pageControllerItem,physics: controller.listGroupedStory[index].items?.length==1?NeverScrollableScrollPhysics(): controller.canScroll?AlwaysScrollableScrollPhysics():NeverScrollableScrollPhysics(),onPageChanged: (currentPage){

                        controller.selectedIndex=currentPage;
                        if(currentPage==listGroupedStory[index].items!.length-1){
                          controller.canScroll=false;
                        }else{
                          controller.canScroll=true;
                        }
                        controller.update();
                        controller.startProgressTimer();

                        if(controller.listGroupedStory[index].items![currentPage].viewed!=true){
                          controller.postData(controller.listGroupedStory[index].items![currentPage].id);
                        }

                      },itemCount: listGroupedStory[index].items?.length,itemBuilder: (itemBuilder,indexItem){
                        return InkWell(onTap: (){
                          controller.tapToNext();
                        },
                          child: ImageCommon("${controller.listGroupedStory[index].items?[indexItem].mediaUrl}",boxFit: BoxFit.fitWidth,),
                        );
                      }),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 45.0),
                      child: Column(spacing: 16,children: [

                        SizedBox(height: 4,
                          child: Row(children: List.generate(controller.listGroupedStory[index].items?.length ?? 0, (x) {
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

                        Row(spacing: 16,children: [
                          SizedBox(),
                          Icon(Icons.arrow_back_ios_new_outlined,color: color,),
                          Expanded(
                            child: InkWell(onTap: (){
                              if (onUserTap != null) {onUserTap!(userId: controller.listGroupedStory[index].userId, name:  controller.listGroupedStory[index].name, image: controller.listGroupedStory[index].image,);}

                            },
                              child: Row(spacing: 16,children: [
                                ImageCommon("${controller.listGroupedStory[index].image}",sizeAndCircle: 40,),
                                Expanded(
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                    SmallText(text: "${controller.listGroupedStory[index].name}",fontWeight: FontWeight.w600,size: 15,color: color,),
                                    SmallText(text: formatDateRelative(controller.selectedIndex< controller.listGroupedStory[index].items!.length ?controller.listGroupedStory[index].items![controller.selectedIndex].createdAt:"----"),color: color,)
                                  ],),
                                ),
                              ],),
                            ),
                          )
                        ],),
                      ],),
                    )
                  ],
                );
              }),
            ),
          );
        }
    );
  }
}



String formatDateRelative(String? isoUtc) {
  if (isoUtc == null || isoUtc.trim().isEmpty) return "";

  DateTime dtUtc;
  try {
    dtUtc = DateTime.parse(isoUtc);
  } catch (e) {
    return isoUtc;
  }

  // convert to local time
  final DateTime dtLocal = dtUtc.toLocal();

  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final dateOnly = DateTime(dtLocal.year, dtLocal.month, dtLocal.day);

  String formatTime(DateTime dt) {
    int hour = dt.hour;
    final minute = dt.minute.toString().padLeft(2, '0');
    final ampm = hour >= 12 ? 'PM' : 'AM';
    if (hour == 0) {
      hour = 12; // Midnight
    } else if (hour > 12) {
      hour -= 12;
    }
    return '$hour:$minute $ampm';
  }

  final timeString = formatTime(dtLocal);

  if (dateOnly == today) return timeString;
  if (dateOnly == today.subtract(const Duration(days: 1))) return 'Yesterday';

  // fallback for other dates
  String two(int n) => n.toString().padLeft(2, '0');
  final day = two(dtLocal.day);
  final month = two(dtLocal.month);
  final year = two(dtLocal.year % 100);

  return '$day/$month/$year';
}