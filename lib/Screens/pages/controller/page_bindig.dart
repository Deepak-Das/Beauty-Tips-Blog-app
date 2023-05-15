import 'package:beauty_tips_flutter/Screens/pages/controller/page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PageBinding implements Bindings{



  @override
  void dependencies() {
    Get.lazyPut<MyPageController>(() => MyPageController());
  }
}