import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(centerTitle: false,title:"",height: 0,elevation: 0,color: AppColors.scaffoldBackgroundColor,),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPaddings.paddingAll16,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NormalHeadingText(text: "Chats",letterSpacing: 2,),
              SizedBox(height: 16,),
              ListView.builder(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemCount: 4, itemBuilder: (itemBuilder, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Row(children: [
                    SizedBox(height: 40,width: 40,child: ClipRRect(borderRadius: BorderRadius.circular(50),child: ImageCommon(src: "https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80",fit: BoxFit.cover,))),
                    SizedBox(width: 16,),
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmallText(text: "Ivan Brennan",fontWeight: FontWeight.w700,letterSpacing: 0.3,),
                              SmallText(text: "02:11PM",color: Colors.black54,size: 10,),
                            ],
                          ),
                          // SizedBox(height: 4,),
                          Row(
                            children: [
                              index!=0?SizedBox():FaIcon(Icons.done_all_rounded,size: 16,),
                              SmallText(text: "Hi there what are you doing?",color: index!=0?null:Colors.black54,),
                              Spacer(),

                              Container(padding: EdgeInsets.all(6),decoration: index==0?null:BoxDecoration(color: Colors.red,shape: BoxShape.circle),child: SmallText(text: "2", color: Colors.white,size: 10,)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],),
                );
              }),
            ],
          ),
        ),
      )
    );
  }
}
