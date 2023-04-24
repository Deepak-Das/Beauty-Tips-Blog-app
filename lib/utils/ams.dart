import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

import 'color_manger.dart';

class Ams {

  Widget topAppBar({required String title, required void Function() onPress}) {

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h,horizontal:15.w),

      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onPress,
                  child: Icon(CupertinoIcons.list_bullet,color: ColorManager.pink,size: 35,)),
              Text(title ,style: TextStyle(fontSize: 21.sp),),
              SizedBox(width: 35,)
            ],
          ),
        ),
      ),
    );
  }

  static ft(title) => toast(title, bgColor: ColorManager.black,);


  Widget imageWidget(String? url,  {double? height,double? width, BoxFit? fit,Color? color}) {
    if (url.validate().startsWith('http')) {
      if (isMobile) {
        return CachedNetworkImage(
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error,),
          imageUrl: '$url',
          height: height,
          width: width,
          fit: fit,
          color: color,
        );
      } else {
        return Image.network(url!, height: height, width: width, fit: BoxFit.fitHeight);
      }
    } else {
      return Image.asset(url!, height: height, width: width, fit: fit);
    }
  }


}

