import 'package:flutter/material.dart';

import '../../../text_atoms/text_common.dart';
import '../../../theme/app_colors.dart';

class AlreadyAccountWidget extends StatelessWidget {
  const AlreadyAccountWidget({super.key, this.off});
  final bool? off;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const NormalText(text: "Already Have An Account? ",fontWeight: FontWeight.w500,),
        InkWell(onTap: (){
          // if(off!=null){
          //   // Get.off(()=>LoginScreen());
          // }else{Get.to(()=>LoginScreen());}
        },child: NormalText(text: "Sign In",color: AppColors.primary,fontWeight: FontWeight.w500,)),
      ],
    );
  }
}
