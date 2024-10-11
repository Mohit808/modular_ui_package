import 'package:flutter/material.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';

import '../text_atoms/text_common.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(title: const NormalHeadingText(size: 16,text: "Notification",color: Colors.black,letterSpacing: 1,),elevation: 0,color: AppColors.scaffoldBackgroundColor,),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(color: Colors.grey.shade300,
              child: Row(children: [
                Expanded(child: ContainerDecorated(color: Colors.white,colorBorder: Colors.grey.shade400,padding: 10,child: const Center(child: Row(mainAxisSize: MainAxisSize.min,
                  children: [
                    SmallText(text: "View all",fontWeight: FontWeight.w700,),
                    SizedBox(width: 8,),
                    ContainerDecorated(paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 2),child: SmallText(text: "10",fontWeight: FontWeight.w600,))
                  ],
                )))),
                Expanded(child: Center(child: SmallText(text: "Verified",fontWeight: FontWeight.w700,color: Colors.black54,))),
                Expanded(child: Center(child: SmallText(text: "Mentions",fontWeight: FontWeight.w700,color: Colors.black54,))),
              ],),
            ),
          ),
          ListView.builder(shrinkWrap: true,itemCount: 5,itemBuilder: (itemBuilder,index){
            return
            Padding(
              padding:AppPaddings.paddingAll16,
              child: Row(crossAxisAlignment: CrossAxisAlignment.start ,children: [
                Badge(child: ClipRRect(borderRadius: BorderRadius.circular(50),child: Image.network("https://play-lh.googleusercontent.com/X78O_ql0-9u37hm6IBpYxqBthrJRt8ylhlSnEZfPjKq_Ftwhhv2J2Xmx96QEa30WvScG",height: 40,width: 40,))),
                SizedBox(width: 16,),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start ,children: [
                    Row(children: [
                      SmallText(text: "Marco",fontWeight: FontWeight.w600,),
                      SmallText(text: " Requested access to ",),
                      SmallText(text: " Surface X",fontWeight: FontWeight.w600,),
                    ],),
                    SizedBox(height: 8,),

                    Row(children: [
                      SmallText(text: "Friday 3:04pm"),
                      SizedBox(width: 8,),
                      Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.black54),height: 4,width: 4,),
                      SizedBox(width: 8,),
                      SmallText(text: "Design"),
                      Spacer(),
                      SmallText(text: "2 hours ago"),
                    ],),
                    SizedBox(height: 12,),

                    ContainerDecorated(padding: 8,colorBorder: Colors.grey.shade300,child: SmallText(text: "Finished up the first crack at the new dashboard! looks great!",fontWeight: FontWeight.w500,)),

                    // Row(children: [
                    //   ContainerDecorated(paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 12,vertical: 6),color: Colors.white,colorBorder: Colors.grey.shade500,child: SmallText(text: "Decline",fontWeight: FontWeight.w600,)),
                    //   SizedBox(width: 16,),
                    //   ContainerDecorated(paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 12,vertical: 6),color: Colors.blue,colorBorder: Colors.blue,child: SmallText(text: "Accept",fontWeight: FontWeight.w600,color: Colors.white,)),
                    // ],),

                  ],),
                ),
              ],),
            );

            //   ListTile(dense: true,isThreeLine: true,
            //   leading: ClipRRect(borderRadius: BorderRadius.circular(50),child: Image.network("https://play-lh.googleusercontent.com/X78O_ql0-9u37hm6IBpYxqBthrJRt8ylhlSnEZfPjKq_Ftwhhv2J2Xmx96QEa30WvScG",height: 40,width: 40,)),
            //   title: Row(children: [
            //     SmallText(text: "Marco",fontWeight: FontWeight.w600,),
            //     SmallText(text: " Requested access to ",),
            //     SmallText(text: " Surface X",fontWeight: FontWeight.w600,),
            //   ],),
            //   subtitle: Column(children: [
            //     Row(children: [
            //       SmallText(text: "2 hours ago"),
            //       SizedBox(width: 8,),
            //       Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.black54),height: 4,width: 4,),
            //       SizedBox(width: 8,),
            //       SmallText(text: "Design"),
            //     ],),
            //     SizedBox(height: 8,),
            //     Row(children: [
            //       ContainerDecorated(paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 12,vertical: 6),color: Colors.white,colorBorder: Colors.grey.shade500,child: SmallText(text: "Decline",fontWeight: FontWeight.w600,)),
            //       SizedBox(width: 16,),
            //       ContainerDecorated(paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 12,vertical: 6),color: Colors.blue,colorBorder: Colors.blue,child: SmallText(text: "Accept",fontWeight: FontWeight.w600,color: Colors.white,)),
            //     ],)
            //   ],),
            //
            // );
          }),
        ],
      ),
    );
  }
}
