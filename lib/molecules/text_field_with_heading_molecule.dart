import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'input_with_heading_molecule.dart';
import '../common_widget/textfield_atom.dart';

class TextFieldWithHeadingMolecule extends StatelessWidget {
  const TextFieldWithHeadingMolecule({super.key, this.controller, this.hintText, this.validator, this.inputFormatters, this.keyboardType, this.onChanged, this.heading, this.prefixIcon, this.mandatoryString, this.colorMandatoryString, this.suffixIcon,this.fontWeightHeading,this.maxLines});
  final TextEditingController? controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String? heading;
  final Widget? prefixIcon;
  final String? mandatoryString;
  final Color? colorMandatoryString;
  final Widget? suffixIcon;
  final FontWeight? fontWeightHeading;
  final int? maxLines;


  @override
  Widget build(BuildContext context) {
    return  InputWithHeadingMolecule(fontWeightHeading: fontWeightHeading,mandatoryString: mandatoryString,colorMandatoryString: colorMandatoryString,heading: heading??"", widget: TextFieldCommon(maxLines: maxLines,suffixIcon: suffixIcon,prefixIcon: prefixIcon,controller: controller,hintText: hintText??"",validator: validator,inputFormatters: inputFormatters,keyboardType: keyboardType,onChanged: onChanged,));
  }
}
