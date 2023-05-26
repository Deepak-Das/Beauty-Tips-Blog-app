import 'package:beauty_tips_flutter/Screens/add_post/service/category_service.dart';
import 'package:beauty_tips_flutter/Screens/add_post/service/model/cat_model.dart';
import 'package:beauty_tips_flutter/utils/color_manger.dart';
import 'package:beauty_tips_flutter/utils/style_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../utils/ams.dart';
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
  var catNameTxC = TextEditingController();

  var catId = "".obs;

  var readTxC = TextEditingController();

  var dateFormat = DateFormat("yyyy-MM-dd");

  final AddPostController _controller = Get.find<AddPostController>();
  final CategoryService _categoryService = Get.find<CategoryService>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _categoryService.getCategories();
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "required";
              } else
                return null;
            },
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
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "required";
              } else
                return null;
            },
            controller: postTxC,
            onChanged: _controller.setPost,
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
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "required";
              } else
                return null;
            },
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
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "required";
              } else
                return null;
            },
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
          Container(width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 200.w,
                  child: Obx(() {
                    return DropdownButtonFormField(
                      value: catId.value == "" ? null : catId.value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "select Category",
                        hintStyle: getRFStyle(color: Colors.grey, fontSize: 16.sp)
                      ),
                      items: List.generate(
                          _categoryService.categoriesData?.length ?? 0,
                              (index) =>
                              DropdownMenuItem(
                                child: Text(
                                    _categoryService.categoriesData![index].name,style: getMFStyle(color: Colors.black, fontSize: 16.sp),),
                                value: _categoryService.categoriesData![index]
                                    .categoryId,
                              )),
                      onChanged: (value) {
                        catId.value = value!;
                      },
                    );
                  }),
                ),
                ElevatedButton.icon(
                    style: ButtonStyle(
                        minimumSize: MaterialStatePropertyAll<Size>(
                            Size(80.w, 60.h)
                        )
                    ),
                    onPressed: () {
                      _AddCate(context: context);
                    },
                    icon: Icon(Icons.add, size: 40.w,),
                    label: Text("Add",
                      style: getSFStyle(color: Colors.white, fontSize: 18.sp),))
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 150.w,
                // height: 50.h,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "required";
                    } else
                      return null;
                  },
                  controller: likeTxC,
                  autocorrect: false,
                  onChanged: _controller.setLike,
                  enableSuggestions: false,
                  style: getRFStyle(color: Colors.black, fontSize: 16.sp),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8.0),
                      border: OutlineInputBorder(),
                      hintText: "Like Count"),
                ),
              ),
              SizedBox(
                width: 150.w,
                // height: 50.h,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "required";
                    } else
                      return null;
                  },
                  controller: shareTxC,
                  autocorrect: false,
                  onChanged: _controller.setShare,
                  enableSuggestions: false,
                  style: getRFStyle(color: Colors.black, fontSize: 16.sp),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8.0),
                      border: OutlineInputBorder(),
                      hintText: "Share Count"),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 150.w,
                // height: 50.h,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "required";
                    } else
                      return null;
                  },
                  controller: readTxC,
                  autocorrect: false,
                  onChanged: _controller.setReadTime,
                  enableSuggestions: false,
                  style: getRFStyle(color: Colors.black, fontSize: 16.sp),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8.0),
                      border: OutlineInputBorder(),
                      hintText: "Read Time"),
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
                    if (_formKey.currentState!.validate()) {
                      if (_controller.imgFile == null ||
                          _controller.img.value ==
                              "https://shorturl.at/hrsx7") {
                        Ams.ft("image required");
                        return;
                      }
                      _controller.setPublish(false);
                      _controller.savePost();
                    }
                  },
                  child: Text("Draft")),
              SizedBox(
                width: 10.w,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStatePropertyAll<Color>(ColorManager.pink)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_controller.imgFile == null ||
                          _controller.img.value ==
                              "https://shorturl.at/hrsx7") {
                        Ams.ft("image required");
                        return;
                      }
                      _controller.setPublish(true);

                      _controller.savePost();
                    }
                  },
                  child: Text("Publish"))
            ],
          )
        ],
      ),
    );
  }

  void pickDate() async {
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

  void _AddCate({required BuildContext context}) {
    showDialog(
        context: context,
        builder: (contet) {
          return AlertDialog(
            title: Text("Add Category"),
            content: TextFormField(
              controller: catNameTxC,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Category Name")
              ),),
            actions: [
              TextButton(
                  onPressed: () {

                    _categoryService.saveCategory(CategoryModel(name: catNameTxC.text));
                    _categoryService.getCategories();

                    Get.back();

                  },
                  child: Text("Submit",
                      style: TextStyle(color: ColorManager.pink))),
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("Cancel")),
            ]
            ,
          );
        });
  }



}

