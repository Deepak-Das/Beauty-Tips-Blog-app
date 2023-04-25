import 'package:beauty_tips_flutter/utils/ams.dart';
import 'package:beauty_tips_flutter/utils/color_manger.dart';
import 'package:beauty_tips_flutter/utils/style_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../generated/assets.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

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
                        Text(
                          "12-june-2023",
                          style:
                              getMFStyle(color: Colors.grey, fontSize: 12.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Ams().imageWidget("https://shorturl.at/hrsx7",
                        width: double.infinity,
                        height: 200.h,
                        fit: BoxFit.fill),
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
                            Text(
                              "Muskan Choudhary",
                              style: getSFStyle(
                                  color: Colors.grey, fontSize: 12.sp),
                            ),
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
                                Text(
                                  "1.5K",
                                  style: getBFStyle(
                                      color: Colors.grey, fontSize: 12.sp),
                                )
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
                                Text(
                                  "1.5K",
                                  style: getBFStyle(
                                      color: Colors.grey, fontSize: 12.sp),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Keep your skin healthy Lorem ipsum is a text !!!",
                      style: getMFStyle(color: Colors.black, fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "SkinCare,Hygiene",
                          style:
                              getSFStyle(color: Colors.grey, fontSize: 12.sp),
                        ),
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
                    Text(
                      "When the guru of solitude gains the joys of the monkey, the samadhi will know saint. To the gooey meatballs add caviar, chicken lard, coconut milk and divided strudel."
                      "When the guru of solitude gains the joys of the monkey, the samadhi will know saint. To the gooey meatballs add caviar, chicken lard, coconut milk and divided strudel.\n\n"
                      "When the guru of solitude gains the joys of the monkey, the samadhi will know saint. To the gooey meatballs add caviar, chicken lard, coconut milk and divided strudel.",
                      style: getRFStyle(color: Colors.black87, fontSize: 16.sp),
                    ),
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
