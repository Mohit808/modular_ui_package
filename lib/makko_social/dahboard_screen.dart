import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/makko_social/mokko_controller_dashboard.dart';

class DahboardScreen extends StatelessWidget {
  const DahboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: MokkoControllerDashboard(),
      builder: (context) {
        return Scaffold(
          body: context.list[context.selected],

          bottomNavigationBar: BottomNavigationBar(onTap: (index){
            context.selected=index;
            context.update();
          },currentIndex: context.selected,showSelectedLabels: false,showUnselectedLabels: false,type: BottomNavigationBarType.fixed,items: [
            BottomNavigationBarItem(label: "Home",icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: "Search",icon: Icon(Icons.search)),
            BottomNavigationBarItem(label: "Add",icon: Icon(Icons.add_circle_rounded)),
            BottomNavigationBarItem(label: "msg",icon: Icon(Icons.sms)),
            BottomNavigationBarItem(label: "Feed",icon: Icon(Icons.feed)),
            BottomNavigationBarItem(label: "profile",icon: Icon(Icons.account_circle)),
          ],),
        );
      }
    );
  }
}
