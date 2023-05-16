import 'package:beauty_tips_flutter/Screens/pages/pages_screen.dart';
import 'package:get/get.dart';

import '../Screens/pages/controller/page_bindig.dart';

class RouterHelper{

  static List<GetPage> pageList=[GetPage(name: "/", page: () =>  PageScreen(),binding: PageBinding())];
}