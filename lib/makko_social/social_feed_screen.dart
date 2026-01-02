import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/makko_social/controller_social_feed.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';

class SocialFeedScreen extends StatelessWidget {
  const SocialFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerSocialFeed(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "",height: 0,color: AppColors.scaffoldBackgroundColor,elevation: 0,),
          body: SingleChildScrollView(
            child: Padding(
              padding: AppPaddings.paddingAll16,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NormalHeadingText(text: "Story",letterSpacing: 2,),
                  SizedBox(height: 8,),
                  SizedBox(height: 80,child: ListView.builder(scrollDirection: Axis.horizontal,itemBuilder: (itemBuilder,index){
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: SizedBox(height: 100,width: 56,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                ContainerDecorated(padding: 2,colorBorder: index==0?Colors.blue:Colors.grey,color: Colors.transparent,borderRadius: 50,child: SizedBox(height: 50,width: 50,child: ClipRRect(borderRadius: BorderRadius.circular(50),child: ImageCommon( "https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80",)))),

                                index!=0?SizedBox():Positioned(bottom: 0,right: 0,child: ContainerDecorated(borderRadius: 20,color: Colors.blue,padding: 2,child: Icon(Icons.add,color: Colors.white,size: 16,)))
                              ],
                            ),
                            SizedBox(height: 4,),
                            SmallText(text: index==0?"You":"Username",fontWeight: FontWeight.w500,overflow: TextOverflow.ellipsis,)
                          ],
                        ),
                      ),
                    );
                  }),),
                  SizedBox(height: 16,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NormalHeadingText(text: "Feed",letterSpacing: 2,),
                      SizedBox(height: 16,
                        child: PopupMenuButton(onSelected: (value){
                          controller.changeLayout();
                        },iconSize: 16,itemBuilder: (BuildContext context) { return [
                          PopupMenuItem(child: SmallText(text: "Change layout",),value: "value",)
                        ]; },),
                      ),
                    ],
                  ),
                  SizedBox(height: 8,),
                  ListView.builder(shrinkWrap: true,itemCount: 20,physics: NeverScrollableScrollPhysics(),itemBuilder: (itemBuilder,index){
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0,top: 8),
                          child: Row(crossAxisAlignment: CrossAxisAlignment.start,children: [
                            controller.layoutChanged?SizedBox():SizedBox(height: 40,width: 40,child: ClipRRect(borderRadius: BorderRadius.circular(10),child: ImageCommon( "https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80",))),
                            controller.layoutChanged?SizedBox():SizedBox(width: 16,),
                            Expanded(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        !controller.layoutChanged?SizedBox(): SizedBox(height: 24,width: 24,child: ClipRRect(borderRadius: BorderRadius.circular(20),child: ImageCommon( "https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80",))),
                                        !controller.layoutChanged?SizedBox(): SizedBox(width: 8,),
                                        SmallText(text: "Ivan Brennan",fontWeight: FontWeight.w700,letterSpacing: 0.3,),
                                      ],
                                    ),
                                    SizedBox(width: 16,),
                                    ContainerDecorated(padding: 2,borderRadius: 10,color:Colors.black54,),
                                    SizedBox(width: 8,),
                                    SmallText(text: "2m",color: Colors.black54,),
                                  ],
                                ),
                                SizedBox(height: 4,),
                                SmallText(text: "Seriously, can someone tell to stop talking about comics. is getting annoying"),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                                  child: SizedBox(width: double.infinity,child: ClipRRect(borderRadius: BorderRadius.circular(10),child: ImageCommon( "https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80"))),
                                ),
                                SizedBox(height: 8,),
                                Row(children: [
                                  FaIcon(FontAwesomeIcons.heart,size: 16,color: Colors.black54,),
                                  SizedBox(width: 8,),
                                  SmallText(text: "9,239",fontWeight: FontWeight.w600,color: Colors.black54,),

                                  Spacer(),
                                  FaIcon(FontAwesomeIcons.commentDots,size: 16,color: Colors.black54,),
                                  SizedBox(width: 8,),
                                  SmallText(text: "939",fontWeight: FontWeight.w600,color: Colors.black54,),

                                  Spacer(),
                                  FaIcon(FontAwesomeIcons.bookmark,size: 14,color: Colors.black54,),
                                  SizedBox(width: 8,),
                                  SmallText(text: "Saved",fontWeight: FontWeight.w600,color: Colors.black54,),

                                  Spacer(),
                                  FaIcon(FontAwesomeIcons.shareFromSquare,size: 16,color: Colors.black54,),
                                  SizedBox(width: 8,),
                                  SmallText(text: "Share",fontWeight: FontWeight.w600,color: Colors.black54,),
                                ],)
                              ],),
                            )
                          ],),
                        ),
                        Divider()
                      ],
                    );
                  })
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
