import 'package:flutter/cupertino.dart';

import '../../text_atoms/text_common.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key, this.center, this.msg});
  final dynamic center;
  final dynamic msg;
  @override
  Widget build(BuildContext context) {
    return center==null? HeadingText(text: msg??"No Data Found"): Center(child: HeadingText(text: msg??"No Data Found"),);
  }
}
