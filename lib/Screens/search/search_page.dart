import 'package:beauty_tips_flutter/utils/ams.dart';
import 'package:beauty_tips_flutter/utils/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../drawer_page/DrawerPage.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: scaffoldKey,
        drawer: DrawerPage(),
        body: SafeArea(
          child: Column(children: [
            Ams().searchTopAppBar(
              title: "Search",
              onPress: () {
                scaffoldKey.currentState!.openDrawer();
              },
              onSubmit: (value) {
                print(value);
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            Stack(alignment: Alignment.bottomLeft, children: [
              const Divider(
                height: 1,
                thickness: 2,
                color: Colors.grey,
              ),
              TabBar(
                  labelColor: Colors.pink,
                  unselectedLabelColor: Colors.grey,
                  // isScrollable: true,
                  indicatorColor: ColorManager.pink,
                  dividerColor: Colors.grey,
                  tabs: [
                    Text("ALL"),
                    Text("ALL"),
                  ]),
            ]),
          ]),
        ),
      ),
    );
  }
}
