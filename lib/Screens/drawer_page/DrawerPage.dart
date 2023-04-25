import 'package:beauty_tips_flutter/utils/style_manger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/ams.dart';
import '../../utils/color_manger.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // DrawerHeader(child: Ams().imageWidget("https://shorturl.at/hrsx7",width: double.infinity,height: 200.h,fit: BoxFit.fill))
          Ams().imageWidget("https://shorturl.at/hrsx7",
              width: double.infinity, height: 200.h, fit: BoxFit.fill),
          SizedBox(height: 20.h),
          ListTile(
            onTap: () {},
            leading: Icon(
              LineIcons.campground,
              color: ColorManager.pink,
              size: 30,
            ),
            title: Text(
              "Home",
              style: getBFStyle(color: Colors.black, fontSize: 18.sp),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.save_as,
              color: ColorManager.pink,
              size: 30,
            ),
            title: Text(
              "Save",
              style: getBFStyle(color: Colors.black, fontSize: 18.sp),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              LineIcons.heart,
              color: ColorManager.pink,
              size: 30,
            ),
            title: Text(
              "Liked",
              style: getBFStyle(color: Colors.black, fontSize: 18.sp),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              LineIcons.info,
              color: ColorManager.pink,
              size: 30,
            ),
            title: Text(
              "About",
              style: getBFStyle(color: Colors.black, fontSize: 18.sp),
            ),
          ),
        ],
      ),
    );
  }
}