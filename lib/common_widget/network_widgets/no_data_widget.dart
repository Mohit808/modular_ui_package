import 'package:flutter/cupertino.dart';

import '../../text_atoms/text_common.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key, this.center, this.msg, this.paddingTop});
  final dynamic center;
  final dynamic msg;
  final double? paddingTop;
  @override
  Widget build(BuildContext context) {
    return center==null? HeadingText(text: msg??"No Data Found"): Padding(
      padding: EdgeInsets.only(top: paddingTop??8.0),
      child: Center(child: HeadingText(text: msg??"No Data Found"),),
    );
  }
}
