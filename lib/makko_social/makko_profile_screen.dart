import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/utils/app_images.dart';

class MakkoProfileScreen extends StatelessWidget {
  const MakkoProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(title: "",height: 0,color: Colors.white,elevation: 0,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            ContainerDecorated(borderRadius: 40,child: NetworkOrAssetImage(src: AppImagesConst.user,),),
            SizedBox(height: 10,),
            HeadingText(text: "Coffiestories"),
            SizedBox(height: 4,),
            SmallText(text: "coffie@icloud.com"),
            SizedBox(height: 16,),
            ContainerDecorated(color: Colors.black,borderRadius: 20,paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 16,vertical: 8),child: NormalText(text: "Edit profile",color: Colors.white,)),
            SizedBox(height: 48,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: SmallText(text: "Inventories",color: Colors.black54,),
                ),
              ],
            ),
            SizedBox(height: 8,),
            ContainerDecorated(borderRadius: 16,child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                commonRow(Icons.filter_hdr_rounded,"My Images"),
                // SizedBox(height: 16,),
                Divider(height: 32,),
                commonRow(Icons.slow_motion_video,"My Videos"),
              ],),
            ),),


            SizedBox(height: 24,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: SmallText(text: "Preferences",color: Colors.black54,),
                ),
              ],
            ),
            SizedBox(height: 8,),
            ContainerDecorated(borderRadius: 16,child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                commonRow(Icons.notifications_none,"Push Notifications",
                    action: SizedBox(height: 6,child: CupertinoSwitch(value: true, onChanged: (onChanged){}))
                ),
                Divider(height: 32,),
                commonRow(Icons.deblur_outlined,"Face ID",action: SizedBox(height: 6,child: CupertinoSwitch(value: true, onChanged: (onChanged){}))),
                Divider(height: 32,),
                commonRow(Icons.keyboard,"PIN Code"),
              ],),
            ),),



            SizedBox(height: 24,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: SmallText(text: "Help",color: Colors.black54,),
                ),
              ],
            ),
            SizedBox(height: 8,),
            ContainerDecorated(borderRadius: 16,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                commonRow(Icons.support,"About Us"),
                Divider(height: 32,),
                commonRow(Icons.support_agent,"Support"),
                Divider(height: 32,),
                commonRow(Icons.privacy_tip_outlined,"Terms and Conditions"),
                Divider(height: 32,),
                commonRow(Icons.local_police_outlined,"Privacy Policy"),
              ],),
            ),),
            SizedBox(height: 24,),
            Divider(height: 32,),
            ContainerDecorated(borderRadius: 16,child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                  ContainerDecorated(elevation: 2,borderRadius: 8,color: Colors.red.shade50,child: Icon(Icons.exit_to_app_rounded,size: 16,color: Colors.red,),),
                  SizedBox(width: 16,),
                  SmallText(text: "Logout",fontWeight: FontWeight.w600,color: Colors.red,)
                ],)
            )),
          ],),
        ),
      ),
    );
  }
  Widget commonRow(icon,text,{action}){
    return Row(children: [
      ContainerDecorated(elevation: 2,borderRadius: 8,color: Colors.white,child: Icon(icon,size: 16,),),
      SizedBox(width: 8,),
      SmallText(text: text),
      Spacer(),
      action??Icon(Icons.arrow_forward,color: Colors.grey,size: 18,)
    ],);
  }
}
