import 'package:beauty_tips_flutter/Screens/pages/pages_screen.dart';
import 'package:beauty_tips_flutter/utils/color_manger.dart';
import 'package:beauty_tips_flutter/utils/router_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';


import 'Screens/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360,800),
      builder:(context , child) => GetMaterialApp(
        title: 'Beauty & Tips',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.blueGrey,
          textTheme: GoogleFonts.jacquesFrancoisTextTheme(
            Theme.of(context).textTheme
          ),
          useMaterial3: false,
        ),
        debugShowCheckedModeBanner: false,
        getPages: RouterHelper.pageList,
        initialRoute: "/",

      ),
    );
  }
}


