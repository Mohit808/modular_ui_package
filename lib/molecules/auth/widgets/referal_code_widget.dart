import 'package:flutter/material.dart';

import '../../../common_widget/textfield_atom.dart';
import '../../../text_atoms/text_common.dart';
import '../../../theme/app_colors.dart';

class TermsWidget extends StatelessWidget {
  const TermsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      Row(crossAxisAlignment: CrossAxisAlignment.start,children: [
        SizedBox(height: 24,width: 24,child: Checkbox(value: true, onChanged: (onChanged){})),
        const SizedBox(width: 16,),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                const TextSpan( text: 'By continuing, you agree to accept our ',style: TextStyle(fontSize: 12)),
                TextSpan( text: 'Privacy Policy', style: TextStyle(color: AppColors.primary,fontSize: 12),),
                const TextSpan( text: ' & ',style: TextStyle(fontSize: 12)),
                TextSpan( text: 'Terms of Services.', style: TextStyle(color: AppColors.primary,fontSize: 12),),
              ],
            ),
          ),
        ),
      ],),

    ],);
  }
}
