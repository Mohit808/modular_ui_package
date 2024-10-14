import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/app_sizes.dart';
import 'border_atom.dart';

class TextFieldCommon extends TextFormField{
  TextFieldCommon({
    super.key,
    required String hintText,
    super.keyboardType,
    TextAlign? textAlign,
    Widget? prefixIcon,
    Widget? suffixIcon,
    bool? hideOutlineBorder,
    double? borderRadius,
    super.enabled,
    super.controller,
    super.validator,
    super.initialValue,
    super.autovalidateMode=AutovalidateMode.onUserInteraction,
    super.enableSuggestions=true,
    super.maxLength,
    super.inputFormatters,
    super.onChanged,
    super.onEditingComplete,
    super.focusNode,
    super.maxLines,
    super.textInputAction,
    bool isPassword=false
  }):super(
      textAlign: textAlign??TextAlign.start,
      obscureText: isPassword,

      onTapOutside: (value){
        FocusManager.instance.primaryFocus?.unfocus();
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      style: const TextStyle(fontSize: 12),
      decoration: InputDecoration(enabledBorder: hideOutlineBorder!=null?null:OutlineInputBorder(borderRadius: borderRadius!=null?BorderRadius.circular(borderRadius):BorderAtom.borderRadiusTextField,borderSide: BorderSide(color: Colors.grey.shade300)),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 12),
        contentPadding: const EdgeInsets.all(AppSizes.h_12),
        border:  hideOutlineBorder!=null?null:OutlineInputBorder(
          borderRadius:  borderRadius!=null?BorderRadius.circular(borderRadius):BorderAtom.borderRadiusTextField,
          borderSide: const BorderSide(
              width: AppSizes.w_0,
              style: BorderStyle.solid
          ),
        ),
      )
  );
}
