import 'package:beauty_tips_flutter/Screens/add_post/post_input_body.dart';
import 'package:beauty_tips_flutter/utils/ams.dart';
import 'package:beauty_tips_flutter/utils/color_manger.dart';
import 'package:beauty_tips_flutter/utils/style_manger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../generated/assets.dart';
import 'controller/add_post_controller.dart';

class AddPostPage extends StatelessWidget {
  AddPostPage({Key? key}) : super(key: key);

  final AddPostController _controller = Get.put(AddPostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Ams().topAppBar(
              title: "Post",
              onPress: () {},
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            width: 15.w,
                            Assets.bookmark_star,
                            color: Colors.black,
                          ),
                        ),
                        Obx(() {
                          return Text(
                            _controller.date.value,
                            style:
                                getMFStyle(color: Colors.grey, fontSize: 12.sp),
                          );
                        }),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Stack(alignment: Alignment.center, children: [
                      Obx(() {
                        return Ams().imageWidget(_controller.img.value,
                            width: double.infinity,
                            height: 200.h,
                            fit: BoxFit.fill);
                      }),
                      CupertinoButton(
                        color: Colors.grey.shade200.withOpacity(0.5),
                        child: Text(
                          "Upload",
                          style: getRFStyle(
                              color: Colors.white.withOpacity(.5),
                              fontSize: 16.sp),
                        ),
                        onPressed: () async {
                          var pickFile = await _controller.pickFile();
                          _controller.img.value = pickFile.url;
                          print(pickFile.url.toString());
                        },
                      )
                    ]),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: ColorManager.pink,
                              size: 8.w,
                            ),
                            SizedBox(width: 6.w),
                            Obx(() {
                              return Text(
                                _controller.credit.value,
                                style: getSFStyle(
                                    color: Colors.grey, fontSize: 12.sp),
                              );
                            }),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Icon(
                                  LineIcons.heart_1,
                                  color: ColorManager.pink,
                                  size: 25.w,
                                ),
                                Obx(() {
                                  return Text(
                                    _controller.likeCount.value,
                                    style: getBFStyle(
                                        color: Colors.grey, fontSize: 12.sp),
                                  );
                                })
                              ],
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.share,
                                  color: Colors.black54,
                                  size: 25.w,
                                ),
                                Obx(() {
                                  return Text(
                                    _controller.shareCount.value,
                                    style: getBFStyle(
                                        color: Colors.grey, fontSize: 12.sp),
                                  );
                                })
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Obx(() {
                      return Text(
                        _controller.title.value,
                        style: getMFStyle(color: Colors.black, fontSize: 18.sp),
                      );
                    }),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() {
                          return Text(
                            _controller.catName.value,
                            style:
                                getSFStyle(color: Colors.grey, fontSize: 12.sp),
                          );
                        }),
                        Text(
                          "10 min read",
                          style:
                              getSFStyle(color: Colors.grey, fontSize: 12.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Obx(() {
                      return Text(
                        _controller.post.value,
                        style:
                            getRFStyle(color: Colors.black87, fontSize: 16.sp),
                      );
                    }),
                    SizedBox(
                      height: 60.h,
                      width: double.infinity,
                      child: const Divider(
                        thickness: 5,
                      ),
                    ),
                    PostInputBody(),
                    SizedBox(
                      height: 40.h,
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
}

