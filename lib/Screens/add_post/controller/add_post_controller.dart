import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:beauty_tips_flutter/utils/FileObj.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

import '../../../utils/ams.dart';
import '../service/category_service.dart';
import '../service/model/BlogPost_model.dart';
import '../service/post_service.dart';

class AddPostController extends GetxController {
  var title = "Keep your skin healthy Lorem ipsum is a text !!!".obs;
  var post = "When the guru of solitude gains the joys of the monkey, the samadhi will know saint. To the gooey meatballs add caviar, chicken lard, coconut milk and divided strudel."
          "When the guru of solitude gains the joys of the monkey, the samadhi will know saint. To the gooey meatballs add caviar, chicken lard, coconut milk and divided strudel.\n\n"
          "When the guru of solitude gains the joys of the monkey, the samadhi will know saint. To the gooey meatballs add caviar, chicken lard, coconut milk and divided strudel."
      .obs;
  var readTime = "10 min read".obs;
  var credit = "Muskan Choudhary".obs;
  var likeCount = "1.5K".obs;
  var shareCount = "1.5K".obs;
  var catName = "SkinCare,Hygiene".obs;
  var catId = "".obs;
  var date = "12-june-2023".obs;
  var img = "https://shorturl.at/hrsx7".obs;
  bool isPublish=false;
  FileObj? imgFile;

  final _postService = Get.put(BlogPostService());
  final _catService = Get.put(CategoryService());

  setPublish(bool value) {
    isPublish = value;
  }
  setTitle(String value) {
    title.value = value;
  }

  setPost(String value) {
    post.value = value;
  }

  setCredit(String value) {
    credit.value = value;
  }

  setLike(String value) {
    likeCount.value = value;
  }

  setCatName(String value) {
    catName.value = value;
  }

  setShare(String value) {
    shareCount.value = value;
  }

  setDate(String value) {
    date.value = value;
  }

  setReadTime(String value) {
    date.value = value;
  }

  Future<FileObj> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
        withData: true,
        allowMultiple: false,
        allowedExtensions: ["png", "jpeg", "jpg"],
        type: FileType.custom);

    double sizeInMB = result != null ? result!.files[0].size / 1000000 : 0;
    var base64Str = "";
    var fileType = "";
    var path = "";
    Uint8List? bytes;

    if (result != null && sizeInMB <= 1.0) {
      bytes = result.files[0].bytes;
      base64Str = base64.encode(bytes!);
      fileType = result.files[0].extension ?? "";
      path = result.files[0].path ?? "";
      // print(base64Str);
      // Get.log(base64Str);
    } else if (result != null) {
      Ams.ft("file size must be under 4MB");
    }
    return imgFile = FileObj(base64Str, fileType, path, bytes);
  }

  savePost() async {
    await _postService.saveBlogPost(BlogPostModel(
      title: title.value,
      content: post.value,
      categories: List.of([catName.value]),
      shareCount: shareCount.value,
      readTime: readTime.value,
      isPublish: isPublish,
      likeCount: likeCount.value,
      imageFile: imgFile == null ? null : File(imgFile!.path),
    ));
  }
}
