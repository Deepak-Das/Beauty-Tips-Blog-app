import 'package:beauty_tips_flutter/utils/ams.dart';
import 'package:beauty_tips_flutter/utils/color_manger.dart';
import 'package:beauty_tips_flutter/utils/font_size.dart';
import 'package:beauty_tips_flutter/utils/style_manger.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({Key? key}) : super(key: key);

  // var _pageController = CarouselController();

  var activeIndex = 0.obs;
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Ams().topAppBar(
              title: "Category",
              onPress: () {},
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _categoryBox(),
                            _categoryBox(),
                            _categoryBox(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _categoryBox(),
                            _categoryBox(),
                            _categoryBox(),
                          ],
                        ),
                      ),

                      // SizedBox(height: 10.h,),

                      SizedBox(height: 20.h),
                      Container(
                          child: CarouselSlider(
                        // carouselController: _pageController,  // connect the carousel controller to the indicator

                        options: CarouselOptions(
                          height: 200.h,
                          onPageChanged: (index, reason) {
                            activeIndex.value = index;
                          },
                          aspectRatio: 1.5,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                          autoPlay: true,
                          enableInfiniteScroll: true,
                        ),
                        items: List.generate(imgList.length,
                            (index) => _featureCard(img: imgList[index])),
                      )),
                      SizedBox(height: 10.h),

                      Obx(() {
                        return AnimatedSmoothIndicator(
                          activeIndex: activeIndex.value,
                          count: imgList.length,
                          effect: WormEffect(
                              activeDotColor: ColorManager.pink,
                              dotWidth: 6.w,
                              dotHeight: 6.w),
                        );
                      }),

                      SizedBox(height: 20.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Festival Special",
                            style: getBFStyle(
                                color: Colors.black, fontSize: 18.sp),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),

                      _article(),
                      SizedBox(
                        height: 10.h,
                      ),

                      _article(),
                      SizedBox(
                        height: 10.h,
                      ),

                      _article(),

                      SizedBox(
                        height: 20.h,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack _categoryBox() {
    return Stack(children: [
      Container(
        width: 90.w,
        height: 93.w,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    "https://lh3.googleusercontent.com/IkCkm4f8AJMbnJSPPq_2ErenkiydUEgFthtLPrRoyWoXcIbUCjaVX66e2clnl973nb6kxoZWeu3Hl7R5yIhUPHBCMg=h450-rw")),
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      Container(
        width: 90.w,
        height: 93.w,
        decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: const BorderRadius.all(Radius.circular(8))),
      ),
      Positioned(
          bottom: 6.h,
          left: 4.h,
          child: Text(
            "Make-up",
            style: getBFStyle(color: Colors.white, fontSize: 16.sp),
          ))
    ]);
  }

  _featureCard({required String img}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Stack(children: [
        Container(
          width: 300.w,
          // height: 200.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            // border: Border.all(color: Colors.black),
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  img,
                )),
          ),
        ),
        Container(
          width: 300.w,
          // height: 200.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              // border: Border.all(color: Colors.black),
              color: Colors.black26),
        ),
        Positioned(
            left: 8,
            bottom: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 280.w,
                  child: ReadMoreText(
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    "Ubi est varius hydra?",
                    style:
                        getBFStyle(color: Colors.white, fontSize: FontSize.s16),
                  ),
                ),
                SizedBox(
                  width: 280.w,
                  child: ReadMoreText(
                    "Aye! Pieces o' greed are forever weird.",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    style: getRFStyle(
                        color: Colors.grey.shade200, fontSize: FontSize.s16),
                    trimCollapsedText: "more...",
                  ),
                ),
                /*Text("Aye! Pieces o' greed are forever weird.",
                style: getRFStyle(
                    color: Colors.grey.shade200, fontSize: FontSize.s16)),*/
              ],
            ))
      ]),
    );
  }

  _article() {
    return Card(
      elevation: 4,
      child: Container(
        width: double.infinity,
        // color: Colors.pinkAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Ams().imageWidget("https://shorturl.at/hrsx7",
                width: 91.w, height: 83.w, fit: BoxFit.fill),
            Padding(
              padding: EdgeInsets.all(4.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 220.w,
                    child: Text(
                      maxLines: 1,
                      "Ubi est varius hydra?",
                      overflow: TextOverflow.ellipsis,
                      style: getBFStyle(
                          color: Colors.black, fontSize: FontSize.s16),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  /*SizedBox(
                    width: 220.w,
                    child: ReadMoreText(
                      trimLines: 3,
                      trimMode: TrimMode.Length,
                      colorClickableText: ColorManager.pink,
                      "Instead of marinating sauce with walnut, use one container fffsds",
                      style: getBFStyle(color: Colors.black, fontSize: 14.sp),
                      trimCollapsedText: "more...",
                      trimLength: 70,
                    ),
                  ),*/
                  SizedBox(
                    width: 220.w,
                    child: Text(
                      "Instead of marinating sauce with walnut, use one container kfja dkdj  fkjd kfjfkjdkfsa j",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
