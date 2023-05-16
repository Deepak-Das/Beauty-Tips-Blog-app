import 'dart:io';

import 'package:beauty_tips_flutter/utils/style_manger.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart' hide DialogType;

import 'color_manger.dart';

class Ams {
  Widget topAppBar({required String title, required void Function() onPress}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: onPress,
                  child: Icon(
                    CupertinoIcons.list_bullet,
                    color: ColorManager.pink,
                    size: 35,
                  )),
              Text(
                title,
                style: TextStyle(fontSize: 21.sp),
              ),
              SizedBox(
                width: 35,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget searchTopAppBar(
      {required String title,
      required void Function() onPress,
      required void Function(String value) onSubmit}) {
    var flag = false.obs;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: onPress,
                  child: Icon(
                    CupertinoIcons.list_bullet,
                    color: ColorManager.pink,
                    size: 35,
                  )),
              Obx(() {
                if (flag.value) {
                  return Row(
                    children: [
                      // Spacer(flex: 1,),
                      SizedBox(
                        width: 250.w,
                        height: 50.h,
                        child: TextField(
                          onSubmitted: onSubmit,
                          maxLines: 1,
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                            hintText: "search here...",
                          ),
                          style:
                              getRFStyle(color: Colors.black, fontSize: 21.sp),
                        ),
                      ),
                    ],
                  );
                }
                return Text(
                  title,
                  style: TextStyle(fontSize: 21.sp),
                );
              }),
              Obx(() {
                if (flag.value) return SizedBox.shrink();
                return GestureDetector(
                  onTap: () => flag.value = !flag.value,
                  child: SizedBox(
                      width: 35.w,
                      child: Icon(
                        Icons.search,
                        size: 30,
                      )),
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  static ft(title) => toast(
        title,
        bgColor: ColorManager.black,
      );

  Widget imageWidget(String? url,
      {double? height, double? width, BoxFit? fit, Color? color}) {
    if (url.validate().startsWith('http')) {
      if (isMobile) {
        return CachedNetworkImage(
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
          ),
          imageUrl: '$url',
          height: height,
          width: width,
          fit: fit,
          color: color,
        );
      } else {
        return Image.network(url!,
            height: height, width: width, fit: BoxFit.fitHeight);
      }
    } else if (url!.contains("data")) {
      return Image.file(
        File(url!),
        fit: fit,
        width: width,
        height: height,
      );
    } else {
      return Image.asset(url!, height: height, width: width, fit: fit);
    }
  }

// AwesomeDialog showError({required String msg,required BuildContext context}) {
//   return  AwesomeDialog(
//     context: context,
//     animType: AnimType.scale,
//     dialogType: DialogType.error,
//     body: Center(child: Text(
//       msg,
//       style: TextStyle(fontStyle: FontStyle.italic),
//     ),),
//     title: 'Network Issue',
//     desc:   'please enable mobile network',
//     btnOkOnPress: () {},
//   );
// }
}
