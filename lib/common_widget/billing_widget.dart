import 'package:flutter/material.dart';
import '../text_atoms/text_common.dart';
import 'container_decorated.dart';

class BillingWidget extends StatelessWidget {
  const BillingWidget({super.key,this.mrpTotal, this.itemSaving, this.totalPayable});
  final dynamic mrpTotal;
  final dynamic itemSaving;
  final dynamic totalPayable;

  @override
  Widget build(BuildContext context) {
    return ContainerDecorated(borderRadius: 15,padding: 8,color: Colors.white,child: Column(children: [
      customRow( const SmallText(text: "MRP Total",fontWeight: FontWeight.w500,), SmallText(text: "₹$mrpTotal",fontWeight: FontWeight.w500)),
      const Divider(),
      customRow(const SmallText(text: "Item Saving",fontWeight: FontWeight.w500), SmallText(text: "-$itemSaving",color: Colors.green,fontWeight: FontWeight.w500)),
      if(false)const Divider(),
      if(false)customRow(const SmallText(text: "Handling Fee (incl GST)",fontWeight: FontWeight.w500), const SmallText(text: "₹5",fontWeight: FontWeight.w500,)),
      if(false)const Divider(),
      true?SizedBox():customRow(const Expanded(flex: 3,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmallText(text: "Delivery Partner Fee",fontWeight: FontWeight.w500,textDecoration: TextDecoration.underline,),
            SizedBox(height: 4,),
            SmallText(text: "Pay only ₹16.0 as Delivery Fee by ordering above 199",fontWeight: FontWeight.w500,color: Colors.grey,),
          ],
        ),
      ), const Flexible(flex: 1,child: SmallText(text: "₹30",fontWeight: FontWeight.w500,))),

      false?SizedBox():const Divider(),
      customRow(const SmallText(text: "To Pay",fontWeight: FontWeight.w500),  Row(
        children: [
          SmallText(text: "₹$mrpTotal",fontWeight: FontWeight.w400,textDecoration: TextDecoration.lineThrough,color: Colors.grey,),
          const SizedBox(width: 8,),
          SmallText(text: "₹$totalPayable",fontWeight: FontWeight.w700,),
        ],
      )),


    ],),);
  }
  customRow(heading,value){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
        heading,
        value
      ],),
    );
  }
}
