import 'package:get/get.dart';
import 'package:modular_ui_package/makko_social/chat_screen.dart';
import 'package:modular_ui_package/makko_social/makko_home_screen.dart';
import 'package:modular_ui_package/makko_social/makko_profile_screen.dart';
import 'package:modular_ui_package/makko_social/makko_search_screen.dart';
import 'package:modular_ui_package/makko_social/makko_user_profile_screen.dart';
import 'package:modular_ui_package/makko_social/new_post_screen.dart';
import 'package:modular_ui_package/makko_social/social_feed_screen.dart';

class MokkoControllerDashboard extends GetxController {
  int selected=0;
  List list=[
    MakkoHomeScreen(),
    MakkoSearchScreen(),
    NewPostScreen(),
    ChatScreen(),
    SocialFeedScreen(),
    MakkoProfileScreen(),
  ];
}