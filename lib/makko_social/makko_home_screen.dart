import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/bottom_sheet_common.dart';
import 'package:modular_ui_package/makko_social/notification_screen.dart';
import 'package:modular_ui_package/utils/app_images.dart';

import '../common_functions/image_network.dart';
import '../common_widget/container_decorated.dart';
import '../text_atoms/text_common.dart';
import '../theme/app_colors.dart';
import 'makko_user_profile_screen.dart';

class MakkoHomeScreen extends StatefulWidget {
  const MakkoHomeScreen({super.key});

  @override
  State<MakkoHomeScreen> createState() => _MakkoHomeScreenState();
}

class _MakkoHomeScreenState extends State<MakkoHomeScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;
  List list=[
    "https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp",
    "https://pixlr.com/images/index/product-image-one.webp",
    "https://images.ctfassets.net/hrltx12pl8hq/4f6DfV5DbqaQUSw0uo0mWi/6fbcf889bdef65c5b92ffee86b13fc44/shutterstock_376532611.jpg?fit=fill&w=600&h=1200",
    "https://images.ctfassets.net/hrltx12pl8hq/4f6DfV5DbqaQUSw0uo0mWi/6fbcf889bdef65c5b92ffee86b13fc44/shutterstock_376532611.jpg?fit=fill&w=600&h=1200",
    "https://images.ctfassets.net/hrltx12pl8hq/4f6DfV5DbqaQUSw0uo0mWi/6fbcf889bdef65c5b92ffee86b13fc44/shutterstock_376532611.jpg?fit=fill&w=600&h=1200",
    "https://images.ctfassets.net/hrltx12pl8hq/4f6DfV5DbqaQUSw0uo0mWi/6fbcf889bdef65c5b92ffee86b13fc44/shutterstock_376532611.jpg?fit=fill&w=600&h=1200"
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController=TabController(length: 4, vsync: this);
  }

  Future<ui.Image> _getImage() {
    final Completer<ui.Image> completer = Completer<ui.Image>();
    final NetworkImage networkImage = NetworkImage('https://i.sstatic.net/lkd0a.png');
    final ImageStream imageStream = networkImage.resolve(ImageConfiguration());

    imageStream.addListener(
      ImageStreamListener(
            (ImageInfo info, bool _) {
          completer.complete(info.image);
        },
        onError: (error, stackTrace) {
          completer.completeError(error, stackTrace);
        },
      ),
    );

    return completer.future;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(color: AppColors.scaffoldBackgroundColor,centerTitle: false,elevation: 0,title: NormalHeadingText(size: 16,text: "Makko",color: Colors.black,),actions: [
        InkWell(onTap: (){
          Get.to(()=>NotificationScreen());
        },child: Icon(Icons.notifications)),
        SizedBox(width: 16,)
      ],),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
          Row(
            children: [
              Expanded(
                child: TabBar(unselectedLabelColor: Colors.grey,indicatorSize: TabBarIndicatorSize.label,isScrollable: true,labelStyle: TextStyle(color: Colors.black),controller: tabController,tabs: const [
                  Tab(child: SmallText(text: "All",)),
                  Tab(child: SmallText(text: "Photos",)),
                  Tab(child: SmallText(text: "Video",)),
                  Tab(child: SmallText(text: "Post",)),
                ]),
              ),
              InkWell(onTap: (){
                showModalBottomSheet(showDragHandle: true,context: context, builder: (builder)=>ContainerDecorated(color: Colors.white,child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(children: [
                        SmallText(text: "CHOOSE TOPIC"),
                        Spacer(),
                        SmallText(text: "2 selected  "),
                        SmallText(text: "CLEAR", size: 12,)
                      ],),
                    ),
                    Expanded(
                      child: ListView.builder(shrinkWrap: true,itemCount: list.length,itemBuilder: (itemBuilder,index){
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                          child: Row(children: [
                            SizedBox( height: 50, width: 50,child: ClipRRect(borderRadius: BorderRadius.circular(16),child: NetworkOrAssetImage(src: list[index],fit: BoxFit.cover,))),
                            SizedBox(width: 16,),
                            SmallText(text: "Technology and Innovation",fontWeight: FontWeight.w500,)
                          ],),
                        );
                      }),
                    ),
                  ],
                ),));
              },child: SizedBox(height: 24,width: 24,child: NetworkOrAssetImage(src: AppImagesConst.filter))),
              SizedBox(width: 16,)
            ],
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 16.0,left: 8,right: 8),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: NetworkOrAssetImage(
                        fit: BoxFit.fitWidth,
                        src: list[index],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 8),
                      child: InkWell(onTap: (){
                        Get.to(()=>MakkoUserProfileScreen());
                      },
                        child: ContainerDecorated(borderRadius: 20,child: Row(mainAxisSize: MainAxisSize.min,children: [
                          Icon(Icons.account_circle),
                          SizedBox(width: 4,),
                          SmallText(text: "Mark Specture",fontWeight: FontWeight.w500,),
                          SizedBox(width: 4,)
                        ],),),
                      ),
                    ),

                    Positioned(bottom: 8, right: 8,
                      child: Container(padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16), // Optional padding around the icons
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5), // Background color with opacity
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FaIcon(FontAwesomeIcons.heart, color: Colors.white,size: 16,),
                            SizedBox(width: 16),
                            FaIcon(FontAwesomeIcons.message, color: Colors.white,size: 16,),
                            SizedBox(width: 16),
                            Icon(Icons.send, color: Colors.white,size: 16,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],),
      ),
    );
  }
}

