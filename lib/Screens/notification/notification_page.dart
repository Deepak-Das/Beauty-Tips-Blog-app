import 'package:beauty_tips_flutter/utils/ams.dart';
import 'package:beauty_tips_flutter/utils/color_manger.dart';
import 'package:beauty_tips_flutter/utils/style_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../drawer_page/DrawerPage.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({Key? key}) : super(key: key);

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerPage(),
      body: SafeArea(
        child: Column(
          children: [
            Ams().topAppBar(
              title: "Notification",
              onPress: () {
                scaffoldKey.currentState!.openDrawer();
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Card(
                        child: ListTile(
                          leading: Icon(Icons.notifications,size: 40.w,color: ColorManager.pink,),
                      title: Text(
                        "Harmony is not parallel in chaos, the great unknown, or heavens, but everywhere.",
                        style: getMFStyle(color: Colors.black, fontSize: 16.sp),
                      ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "14-06-2023",
                                style: getSFStyle(color: Colors.grey, fontSize: 12.sp),
                              ),
                            ],
                          ),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
