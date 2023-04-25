import 'package:get/get.dart';

class MyPageController extends GetxController{

  var tabIndex=0.obs;



  void changePage(int ind){
    tabIndex.value=ind;
  }
}