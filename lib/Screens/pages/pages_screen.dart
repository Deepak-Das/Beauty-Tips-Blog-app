import 'package:beauty_tips_flutter/Screens/home/home_page.dart';
import 'package:beauty_tips_flutter/Screens/notification/notification_page.dart';
import 'package:beauty_tips_flutter/Screens/search/search_page.dart';
import 'package:beauty_tips_flutter/utils/color_manger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nb_utils/nb_utils.dart';

import '../category/category_page.dart';
import 'controller/page_controller.dart';

class PageScreen extends GetView<MyPageController> {
  const PageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return IndexedStack(
          index: controller.tabIndex.value,
          children: const [
            HomePage(),
            SearchPage(),
            CategoryPage(),
            NotificationPage()
          ],
        );
      }),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color:  Colors.grey.shade300,
              blurRadius: 9,
              offset: Offset(0, -3)
            )
          ]
        ),
        child: GNav(
            rippleColor: Colors.pink.shade100, // tab button ripple color when pressed

            tabBorderRadius: 6,
            curve: Curves.linear, // tab animation curves
            gap: 8, // the tab button gap between icon and text
            color: Colors.grey[700], // unselected icon color
            activeColor: ColorManager.pink, // selected icon and text color
            iconSize: 30, // tab button icon size
            tabBackgroundColor: Colors.pink.withOpacity(0.1), // selected tab background color
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            onTabChange: (value) {
              controller.changePage(value);
            },// navigation bar padding
            tabs: [
              GButton(
                icon: LineIcons.campground,
                text: 'Home',
              ),
              GButton(
                icon: LineIcons.searchengin,
                text: 'Search',
              ),
              GButton(
                icon: LineIcons.box_open,
                text: 'category',
              ),

              GButton(
                icon: LineIcons.bell,
                text: 'Notification',
              )
            ]
        ),
      ),
    );
  }
}
