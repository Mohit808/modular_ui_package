import 'package:flutter/material.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';

import '../text_atoms/text_common.dart';
import 'border_atom.dart';

class DropdownCommon extends StatelessWidget {
  const DropdownCommon({super.key,  this.icon, this.list, this.hideOutlineBorder,this.hint, this.onSelected, this.validator, this.borderColor, this.borderRadius, this.selectedValue});
  final Icon? icon;
  final List? list;
  final bool? hideOutlineBorder;
  final String? hint;
  final Function(String)? onSelected;
  final String? Function(Object?)? validator;
  final Color? borderColor;
  final double? borderRadius;
  final dynamic selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(autovalidateMode: AutovalidateMode.onUserInteraction,validator: (value){
      if(value==null) return "Select field";
      return null;
    },icon: icon,hint: SmallText(text: hint??"Select",),decoration: InputDecoration(enabledBorder: hideOutlineBorder!=null?null:OutlineInputBorder(borderSide: BorderSide(color: borderColor?? Colors.grey.shade300),borderRadius: BorderRadius.circular(borderRadius?? BorderAtom.borderRadiusValue)),focusedBorder: hideOutlineBorder!=null?null:OutlineInputBorder(borderSide: BorderSide(width: 1,)),errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),contentPadding: EdgeInsets.symmetric(horizontal: 16),),value: selectedValue,items: list!.map((toElement) => DropdownMenuItem(value: toElement,child: SmallText(text: toElement,),)).toList(), onChanged: (onChanged){
      if(onSelected!=null){
        onSelected!.call(onChanged.toString());
      }
    });
  }
}
