import 'package:flutter/material.dart';

import '../text_atoms/text_common.dart';

class DropdownCommon extends StatelessWidget {
  const DropdownCommon({super.key,  this.icon, this.list, this.hideOutlineBorder,this.hint, this.onSelected, this.validator});
  final Icon? icon;
  final List? list;
  final bool? hideOutlineBorder;
  final String? hint;
  final Function(String)? onSelected;
  final String? Function(Object?)? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(autovalidateMode: AutovalidateMode.onUserInteraction,validator: (value){
      if(value==null) return "Select field";
      return null;
    },icon: icon,hint: SmallText(text: hint??"Select",),decoration: InputDecoration(enabledBorder: hideOutlineBorder!=null?null:OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),focusedBorder: hideOutlineBorder!=null?null:OutlineInputBorder(borderSide: BorderSide(width: 1)),contentPadding: EdgeInsets.symmetric(horizontal: 16),),value: null,items: list!.map((toElement) => DropdownMenuItem(value: toElement,child: SmallText(text: toElement,),)).toList(), onChanged: (onChanged){
      if(onSelected!=null){
        onSelected!.call(onChanged.toString());
      }
    });
  }
}
