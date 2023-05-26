import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/ams.dart';
import '../../utils/style_manger.dart';
import '../add_post/service/model/BlogPost_model.dart';
import '../add_post/service/post_service.dart';

// Your existing code...

class PreviewTab extends StatefulWidget {
  @override
  _PreviewTabState createState() => _PreviewTabState();
}

class _PreviewTabState extends State<PreviewTab>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post View'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            const Tab(text: 'Draft'),
            const Tab(text: 'Publish'),
            const Tab(text: 'PostByTitle'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [AllPostsTab(), PublishPost(), PostByTitle()],
      ),
    );
  }
}

class PostByTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with your logic to fetch all posts from Firestore

    // Fetch all posts
    var _postService = Get.put(BlogPostService());

    var title = TextEditingController();

    var allPosts = <BlogPostModel>[].obs;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          TextField(
            textInputAction: TextInputAction.search,
            onSubmitted: (value) async {
              allPosts.value = await _postService.getBlogPostsByTitle(title: title.text);
            },
            controller: title,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: "search title..."),
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: StreamBuilder(
              stream: allPosts.stream,
              builder: (context, sn) {
                // if (sn.connectionState == ConnectionState.waiting ||
                //     sn.connectionState == ConnectionState.active) {
                //   EasyLoading.show(status: "loading...");
                // } else {
                //   EasyLoading.dismiss();
                //   if (!sn.hasData) {
                //     return const Center(
                //       child: Text("NO Data"),
                //     );
                //   }
                //   allPosts.value = sn.data!;
                // }

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: allPosts.value.length,
                    itemBuilder: (context, index) {
                      final BlogPostModel post = allPosts.value[index];
                      return _article(
                          imgUrl: post.imageUrl!,
                          title: post.title,
                          content: post.content,
                          date: post.date!);
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class AllPostsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with your logic to fetch all posts from Firestore

    // Fetch all posts
    var _postService = Get.put(BlogPostService());

    List<BlogPostModel> allPosts = [];

    return FutureBuilder(
      future: _postService.getDraftBlogPosts(),
      builder: (context, sn) {
        if (sn.connectionState == ConnectionState.waiting ||
            sn.connectionState == ConnectionState.active) {
          EasyLoading.show(status: "loading...");
        } else {
          EasyLoading.dismiss();
          if (!sn.hasData) {
            return const Center(
              child: Text("NO Data"),
            );
          }
          allPosts = sn.data!;
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: allPosts.length,
            itemBuilder: (context, index) {
              final BlogPostModel post = allPosts[index];
              return _article(
                  imgUrl: post.imageUrl!,
                  title: post.title,
                  content: post.content,
                  date: post.date!);
            },
          ),
        );
      },
    );
  }
}

class PublishPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with your logic to fetch posts by category from Firestore
    List<BlogPostModel> allPosts = []; // Fetch posts by category
    var _postService = Get.put(BlogPostService());

    return FutureBuilder(
      future: _postService.getPublishBlogPosts(),
      builder: (context, sn) {
        if (sn.connectionState == ConnectionState.waiting ||
            sn.connectionState == ConnectionState.active) {
          EasyLoading.show(status: "loading...");
        } else {
          EasyLoading.dismiss();
          if (!sn.hasData) {
            return const Center(
              child: Text("NO Data"),
            );
          }
          allPosts = sn.data!;
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: allPosts.length,
            itemBuilder: (context, index) {
              final BlogPostModel post = allPosts[index];
              return _article(
                  imgUrl: post.imageUrl!,
                  title: post.title,
                  content: post.content,
                  date: post.date!);
            },
          ),
        );
      },
    );
  }
}

_article({required String imgUrl,
  required String title,
  required String content,
  String? date}) {
  return Card(
    elevation: 4,
    child: Container(
      width: double.infinity,
      // color: Colors.pinkAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Ams().imageWidget(
            imgUrl,
            width: 80.w,
            height: 100.h,
            fit: BoxFit.fill,
          ),
          // SizedBox(width: 10.w,),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: getMFStyle(color: Colors.black, fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 4.w,
                    ),
                    Text(
                      content,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: getRFStyle(color: Colors.black, fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 4.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          date.toString(),
                          style: getMFStyle(
                              color: Colors.black54, fontSize: 14.sp),
                        )
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    ),
  );
}
