import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../utils/ams.dart';


class MyPageController extends GetxController {
  var connectivity=Connectivity().onConnectivityChanged;
  var tabIndex = 0.obs;

  var flagCv = false.obs;

  late BuildContext context;



  @override
  void onInit() async {
    super.onInit();
  }


  void changePage(int ind) {
    tabIndex.value = ind;
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }


}
