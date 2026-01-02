import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/button_single_atom.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';
import 'package:modular_ui_package/utils/app_images.dart';

class MakkoUserProfileScreen extends StatefulWidget {
  const MakkoUserProfileScreen({super.key});

  @override
  State<MakkoUserProfileScreen> createState() => _MakkoUserProfileScreenState();
}

class _MakkoUserProfileScreenState extends State<MakkoUserProfileScreen> with SingleTickerProviderStateMixin{
  late TabController tabController;
  List list=[
    "https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp",
    "https://pixlr.com/images/index/product-image-one.webp",
    "https://images.ctfassets.net/hrltx12pl8hq/4f6DfV5DbqaQUSw0uo0mWi/6fbcf889bdef65c5b92ffee86b13fc44/shutterstock_376532611.jpg?fit=fill&w=600&h=1200",
    "https://pixlr.com/images/index/product-image-one.webp",
    "https://images.ctfassets.net/hrltx12pl8hq/4f6DfV5DbqaQUSw0uo0mWi/6fbcf889bdef65c5b92ffee86b13fc44/shutterstock_376532611.jpg?fit=fill&w=600&h=1200",
    "https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController=TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCommon(title: "",height: 0,color: Colors.white,elevation: 0,),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPaddings.paddingAll16,
          child: Column(children: [
            SizedBox(height: 100,width: 100,child: ContainerDecorated(borderRadius: 50,child: ClipRRect(borderRadius: BorderRadius.circular(50),child: ImageCommon( "https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80",)),)),
            const SizedBox(height: 10,),
            const HeadingText(text: "Coffiestories"),
            const SizedBox(height: 24,),

            // Row(children: [
            //   Expanded(child: ButtonSingleAtom(widget: "Follow",)),
            //   SizedBox(width: 16,),
            //   Expanded(child: ButtonSingleAtom(widget: "Message",)),
            // ],),
            // const SizedBox(height: 16,),

            Row(children: [
              customRow("Photos","102",index: 0,selected: 0),
              SizedBox(width: 16,),
              customRow("Videos","34",index: 1,selected:0),
              SizedBox(width: 16,),
              customRow("Posts", "12",index: 2,selected:0),
            ],),
            const SizedBox(height: 16,),

            Divider(height: 24,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,bottom: 4),
                  child: SmallText(text: "Photos",color: Colors.grey,),
                ),
              ],
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ClipRRect(borderRadius: BorderRadius.circular(16),
                  child: ImageCommon(boxFit: BoxFit.fitWidth, list[index],),
                );

                //   Padding(
                //   padding: const EdgeInsets.only(bottom: 16.0,),
                //   child: Stack(
                //     children: [
                //       ClipRRect(
                //         borderRadius: BorderRadius.circular(16),
                //         child: ImageCommon(
                //           fit: BoxFit.fitWidth,
                //           src: list[index],
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.only(left: 8.0,top: 8),
                //         child: ContainerDecorated(borderRadius: 20,child: Row(mainAxisSize: MainAxisSize.min,children: [
                //           Icon(Icons.account_circle),
                //           SizedBox(width: 4,),
                //           SmallText(text: "Mark",fontWeight: FontWeight.w500,),
                //           SizedBox(width: 4,)
                //         ],),),
                //       ),
                //
                //       Positioned(bottom: 8, right: 8,
                //         child: Container(padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16), // Optional padding around the icons
                //           decoration: BoxDecoration(
                //             color: Colors.black.withOpacity(0.5), // Background color with opacity
                //             borderRadius: BorderRadius.circular(20),
                //           ),
                //           child: Row(
                //             mainAxisSize: MainAxisSize.min,
                //             children: [
                //               FaIcon(FontAwesomeIcons.heart, color: Colors.white),
                //               SizedBox(width: 16),
                //               FaIcon(FontAwesomeIcons.message, color: Colors.white),
                //               SizedBox(width: 16),
                //               Icon(Icons.send, color: Colors.white),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // );
              }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 8,mainAxisSpacing: 8),
            )

            // Row(
            //   children: [
            //     Expanded(
            //       child: TabBar(unselectedLabelColor: Colors.grey,indicatorSize: TabBarIndicatorSize.label,isScrollable: true,labelStyle: TextStyle(color: Colors.black),controller: tabController,tabs: const [
            //         Tab(child: SmallText(text: "All",)),
            //         Tab(child: SmallText(text: "Photos",)),
            //         Tab(child: SmallText(text: "Video",)),
            //         Tab(child: SmallText(text: "Post",)),
            //       ]),
            //     ),
            //     InkWell(onTap: (){
            //       showModalBottomSheet(showDragHandle: true,context: context, builder: (builder)=>ContainerDecorated(color: Colors.white,child: Column(
            //         children: [
            //           const Padding(
            //             padding: EdgeInsets.symmetric(horizontal: 16.0),
            //             child: Row(children: [
            //               SmallText(text: "CHOOSE TOPIC"),
            //               Spacer(),
            //               SmallText(text: "2 selected  "),
            //               SmallText(text: "CLEAR", size: 12,)
            //             ],),
            //           ),
            //           Expanded(
            //             child: ListView.builder(shrinkWrap: true,itemCount: 1,itemBuilder: (itemBuilder,index){
            //               return Padding(
            //                 padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            //                 child: Row(children: [
            //                   SizedBox( height: 50, width: 50,child: ClipRRect(borderRadius: BorderRadius.circular(16),child: ImageCommon(" list[index]",))),
            //                   SizedBox(width: 16,),
            //                   SmallText(text: "Technology and Innovation",fontWeight: FontWeight.w500,)
            //                 ],),
            //               );
            //             }),
            //           ),
            //         ],
            //       ),));
            //     },child: SizedBox(height: 24,width: 24,child: ImageCommon( AppImagesConst.filter))),
            //     SizedBox(width: 16,)
            //   ],
            // ),

          ],),
        ),
      ),
    );
  }

  Widget customRow(text,value, {index,selected}){
    return Expanded(
      child: ContainerDecorated(color: selected==index?Colors.black:null,borderRadius: 16,paddingEdgeInsets: EdgeInsets.only(top: 8,bottom: 8,left: 8),
        child: Row(children: [
          const ContainerDecorated(elevation: 0,borderRadius: 8,color: Colors.white,child: Icon(Icons.filter_hdr_rounded,size: 16,),),
          const SizedBox(width: 8,),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SmallText(text: text,fontWeight: FontWeight.w500,color: selected==index?Colors.white:null,),
              SmallText(text: value,color: selected==index?Colors.white:null,),
            ],
          )
        ],),
      ),
    );
  }
}

