import 'package:flutter/material.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/button_single_atom.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/common_widget/dropdown_common.dart';
import 'package:modular_ui_package/molecules/input_with_heading_molecule.dart';
import 'package:modular_ui_package/molecules/text_field_with_heading_molecule.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';

class NewPostScreen extends StatelessWidget {
  const NewPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(title: "Add Post",height: 0,elevation: 0,color: AppColors.scaffoldBackgroundColor,),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPaddings.paddingAll16,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            NormalHeadingText(text: "Add post",letterSpacing: 2,),
            SizedBox(height: 16,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100,width: 100,
                  child: ContainerDecorated(child: Icon(Icons.add)
                  // NetworkOrAssetImage(src: "https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80",),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16,),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              ContainerDecorated(borderRadius: 10,color: AppColors.primary,paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 16,vertical: 8),child: SmallText(text: "Image",color: Colors.white,fontWeight: FontWeight.w500,)),
              SizedBox(width: 16,),
              ContainerDecorated(borderRadius: 10,paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 16,vertical: 8),child: SmallText(text: "Video",fontWeight: FontWeight.w500,)),
            ],),
            TextFieldWithHeadingMolecule(hintText: "Enter title",heading: "Title",),
            InputWithHeadingMolecule(heading: "Category", widget: DropdownCommon(list: ["Technology"],)),
            TextFieldWithHeadingMolecule(heading: "Tags",hintText: "Enter tags",),
            Wrap(
              children: [
                Chip(label: SmallText(text: "asdasdas",)),
                Chip(label: SmallText(text: "asdqweqw",)),
                Chip(label: SmallText(text: "asdweqw",)),
                Chip(label: SmallText(text: "aswqeqwed",)),
                Chip(label: SmallText(text: "aswqeqwed",)),
                Chip(label: SmallText(text: "aswqeqwed",)),
              ],
            )
          ],),
        ),
      ),
      persistentFooterButtons: [
        ButtonSingleAtom(widget: "SUBMIT",)
      ],
    );
  }
}
