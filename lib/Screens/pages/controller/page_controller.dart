import 'package:get/get.dart';

class MyPageController extends GetxController{

  var tabIndex=1.obs;



  void changePage(int ind){
    tabIndex.value=ind;
  }
}