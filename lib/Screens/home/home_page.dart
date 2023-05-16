import 'package:beauty_tips_flutter/Screens/pages/controller/page_controller.dart';
import 'package:beauty_tips_flutter/Screens/post/post_page.dart';
import 'package:beauty_tips_flutter/utils/color_manger.dart';
import 'package:beauty_tips_flutter/utils/style_manger.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../generated/assets.dart';
import '../../utils/ams.dart';
import '../drawer_page/DrawerPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();


  // var isConnection = false;
  //
  // @override
  // void initState() {
  //   startConnection();
  // }
  //
  // checkConnection() async {
  //   var checkConnectivity = await Connectivity().checkConnectivity();
  //   if (checkConnectivity != ConnectivityResult.none) {
  //     isConnection = true;
  //   } else {
  //     isConnection = false;
  //     showDialogBox();
  //   }
  // }
  //
  // startConnection() {
  //   Connectivity().onConnectivityChanged.listen((event) async {
  //     checkConnection();
  //   });
  // }
  //
  // showDialogBox(){
  //   showDialog(
  //     barrierDismissible: false,
  //     context: context, builder: (context) =>  CupertinoAlertDialog(
  //     title: const Text("No Internet"),
  //     content: const Text("Please check internet connection"),
  //     actions: [
  //       CupertinoButton(child: Text("Retry"), onPressed: () {
  //         Navigator.pop(context);
  //         checkConnection();
  //       },)
  //     ],
  //
  //   ),);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerPage(),
      body: SafeArea(
        child: Column(
          children: [
            Ams().topAppBar(
                title: "Home",
                onPress: () => {scaffoldKey.currentState!.openDrawer()}),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(10.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    _timeLine(),
                    SizedBox(
                      height: 10.h,
                    ),
                    _timeLine(),
                    SizedBox(
                      height: 10.h,
                    ),
                    _timeLine(),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _timeLine() {
    return GestureDetector(
      onTap: () {
        Get.to(() => PostPage());
      },
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10.0),
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      Assets.bookmark_star,
                      color: ColorManager.pink,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Ams().imageWidget("https://shorturl.at/hrsx7",
                  width: 310.w, height: 200.h, fit: BoxFit.fill),
              SizedBox(
                height: 8.h,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  "Wonderland is not the outer awareness of the lotus.",
                  softWrap: false,
                  maxLines: 2,
                  style: getBFStyle(color: Colors.black, fontSize: 18.sp),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 8.h,
                child: Divider(
                  thickness: 1,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  "Cocktail soup is just not the same without corn syrup and tasty clammy truffels.",
                  softWrap: false,
                  maxLines: 3,
                  style: getSFStyle(color: Colors.black, fontSize: 16.sp),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SkinCare",
                        style: getBFStyle(color: Colors.grey, fontSize: 12.sp),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        "10 min read",
                        style: getBFStyle(color: Colors.grey, fontSize: 12.sp),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Icon(
                            CupertinoIcons.heart_fill,
                            color: ColorManager.pink,
                            size: 30.w,
                          ),
                          Text(
                            "1.5K",
                            style:
                                getBFStyle(color: Colors.grey, fontSize: 12.sp),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.share,
                            color: ColorManager.pink,
                            size: 30.w,
                          ),
                          Text(
                            "1.5K",
                            style:
                                getBFStyle(color: Colors.grey, fontSize: 12.sp),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
