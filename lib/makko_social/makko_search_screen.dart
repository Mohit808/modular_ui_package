import 'package:flutter/material.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/common_widget/network_widgets/no_data_widget.dart';
import 'package:modular_ui_package/common_widget/textfield_atom.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';

class MakkoSearchScreen extends StatelessWidget {
  const MakkoSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(title: "",height: 0,elevation: 0,color: Colors.white,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFieldCommon(borderRadius: 16,hintText: "Search by user name",
              suffixIcon: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ContainerDecorated(elevation: 3,color: Colors.green,borderRadius: 40,child: Icon(Icons.search,color: Colors.white,)),
              ],
            ),),
            SizedBox(height: 16,),

            // NoDataWidget(center: true,msg: 'No Result found for "" ',),
            ListView.builder(shrinkWrap: true,itemCount: 3,itemBuilder: (itemBuilder,index){
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(children: [
                  ContainerDecorated(borderRadius: 40,color: Colors.white,colorBorder: Colors.grey.shade300,padding: 2,
                    child: CircleAvatar(backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80"),),
                  ),
                  SizedBox(width: 16,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallText(text: "Amit yadav",fontWeight: FontWeight.w700,),
                      SizedBox(height: 4,),
                      SmallText(text: "coffie@icloud.com",color: Colors.black54,),
                    ],
                  ),
                  Spacer(),
                  ContainerDecorated(colorBorder: Colors.grey.shade300,color: Colors.white,borderRadius: 20,child: Icon(Icons.arrow_forward,size: 16,color: Colors.grey,))
                ],),
              );
            }),
          ],
        ),
      ),
    );
  }
}
