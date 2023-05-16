import 'package:beauty_tips_flutter/utils/color_manger.dart';
import 'package:beauty_tips_flutter/utils/style_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'controller/add_post_controller.dart';

class PostInputBody extends StatefulWidget {
  PostInputBody({
    super.key,
  });

  @override
  State<PostInputBody> createState() => _PostInputBodyState();
}

class _PostInputBodyState extends State<PostInputBody> {
  var titleTxC = TextEditingController();

  var postTxC = TextEditingController();

  var dateTxC = TextEditingController();

  var creditTxC = TextEditingController();

  var likeTxC = TextEditingController();

  var shareTxC = TextEditingController();

  var catTxC = TextEditingController();

  var readTxC = TextEditingController();

  var dateFormat = DateFormat("yyyy-MM-dd");

  final AddPostController _controller = Get.find<AddPostController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: titleTxC,
          autocorrect: false,
          onChanged: _controller.setTitle,
          enableSuggestions: false,
          minLines: 1,
          maxLines: 2,
          style: getMFStyle(color: Colors.black, fontSize: 18.sp),
          decoration: const InputDecoration(
              border: OutlineInputBorder(), hintText: "Title"),
        ),
        SizedBox(
          height: 10.h,
        ),
        TextField(
          controller: postTxC,
          autocorrect: false,
          enableSuggestions: false,
          minLines: 10,
          maxLines: 2000,
          style: getRFStyle(color: Colors.black, fontSize: 16.sp),
          decoration: const InputDecoration(
              border: OutlineInputBorder(), hintText: "blog....."),
        ),
        SizedBox(
          height: 10.h,
        ),
        TextField(
          controller: dateTxC,
          autocorrect: false,
          readOnly: true,
          onTap: () {
            pickDate();
          },
          enableSuggestions: false,
          style: getRFStyle(color: Colors.black, fontSize: 16.sp),
          decoration: const InputDecoration(
              border: OutlineInputBorder(), hintText: "dd-mm-yyy"),
        ),
        SizedBox(
          height: 10.h,
        ),
        TextField(
          controller: creditTxC,
          autocorrect: false,
          onChanged: _controller.setCatName,
          enableSuggestions: false,
          style: getRFStyle(color: Colors.black, fontSize: 16.sp),
          decoration: const InputDecoration(
              border: OutlineInputBorder(), hintText: "Credit"),
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 150.w,
              height: 50.h,
              child: TextField(
                controller: likeTxC,
                autocorrect: false,
                onChanged: _controller.setLike,
                enableSuggestions: false,
                style: getRFStyle(color: Colors.black, fontSize: 16.sp),
                decoration:  InputDecoration(
                  contentPadding: EdgeInsets.all(8.0),
                    border: OutlineInputBorder(), hintText: "Like Count"),
              ),
            ),
            SizedBox(
              width: 150.w,
              height: 50.h,
              child: TextField(
                controller: shareTxC,
                autocorrect: false,
                onChanged: _controller.setShare,
                enableSuggestions: false,
                style: getRFStyle(color: Colors.black, fontSize: 16.sp),
                decoration:  InputDecoration(
                  contentPadding: EdgeInsets.all(8.0),
                    border: OutlineInputBorder(), hintText: "Share Count"),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),SizedBox(
          height: 10.h,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 150.w,
              height: 50.h,
              child: TextField(
                controller: catTxC,
                autocorrect: false,
                onChanged: _controller.setCatName,
                enableSuggestions: false,
                style: getRFStyle(color: Colors.black, fontSize: 16.sp),
                decoration:  InputDecoration(
                  contentPadding: EdgeInsets.all(8.0),
                    border: OutlineInputBorder(), hintText: "Category Name"),
              ),
            ),
            SizedBox(
              width: 150.w,
              height: 50.h,
              child: TextField(
                controller: readTxC,
                autocorrect: false,
                onChanged: _controller.setReadTime,
                enableSuggestions: false,
                style: getRFStyle(color: Colors.black, fontSize: 16.sp),
                decoration:  InputDecoration(
                  contentPadding: EdgeInsets.all(8.0),
                    border: OutlineInputBorder(), hintText: "Read Time"),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(

                onPressed: () {
              
            }, child: Text("Draft")),
            SizedBox(width: 10.w,),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(
                ColorManager.pink
              )),

                onPressed: () {

            }, child: Text("Publish"))
          ],
        )
      ],
    );
  }

  void pickDate () async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    String d = dateFormat.format(picked!);
    if (picked != null && d != dateTxC.text) {
      dateTxC.text = DateFormat("dd-MMM-yyyy").format(picked).toString();
      _controller.setDate(dateTxC.text);
    }
  }
}
