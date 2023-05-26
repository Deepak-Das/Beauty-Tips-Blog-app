import 'package:beauty_tips_flutter/utils/ams.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uuid/uuid.dart';

import 'model/BlogPost_model.dart';

class BlogPostService {
  Future<void> saveBlogPost(BlogPostModel postModel) async {



    EasyLoading.show(status: "saving...");
    // Step 1: Upload the image to Firebase Storage

    var postId=const Uuid().v1();

    postModel.postId=postId;


    final storage = FirebaseStorage.instance;
    final imageRef =
        storage.ref().child('blog_images').child(DateTime.now().toString());
    final uploadTask = imageRef.putFile(postModel.imageFile!);
    final imageDownloadUrl = await (await uploadTask).ref.getDownloadURL();

    // Step 2: Save blog post data to Firestore

    final firestore = FirebaseFirestore.instance;
    final blogPostCollection = firestore.collection('blog_posts');

    await blogPostCollection.add(postModel.toJson(imageUrl: imageDownloadUrl)).then((value) => EasyLoading.dismiss());
    // EasyLoading.dismiss();
  }

  Future<void> editBlogPost(BlogPostModel postModel) async {
    final firestore = FirebaseFirestore.instance;
    final blogPostCollection = firestore.collection('blog_posts');

    final document = blogPostCollection.doc(postModel.postId);

    // Step 1: Update the image if a new one is provided
    if (postModel.imageFile != null) {
      final storage = FirebaseStorage.instance;
      final imageRef =
          storage.ref().child('blog_images').child(DateTime.now().toString());
      final uploadTask = imageRef.putFile(postModel.imageFile!);
      final imageDownloadUrl = await (await uploadTask).ref.getDownloadURL();

      await document.update({'image_url': imageDownloadUrl});
    }

    // Step 2: Update the rest of the blog post data
    await document.update(postModel.toJson());
  }

  Future<List<BlogPostModel>> getBlogPosts(
      {int limit = 10, DocumentSnapshot? startAfter}) async {
    final firestore = FirebaseFirestore.instance;
    final blogPostCollection = firestore.collection('blog_posts');

    var query =
        blogPostCollection.orderBy('timestamp', descending: true).limit(limit);

    if (startAfter != null) {
      query = query.startAfterDocument(startAfter);
    }

    final querySnapshot = await query.get();

    final List<BlogPostModel> blogPosts = [];
    for (final document in querySnapshot.docs) {
      final blogPost = BlogPostModel.fromJson(document.data());
      blogPosts.add(blogPost);
    }

    return blogPosts;
  }

  Future<List<BlogPostModel>> getDraftBlogPosts(
      {int limit = 10, DocumentSnapshot? startAfter}) async {
    final firestore = FirebaseFirestore.instance;
    final blogPostCollection = firestore.collection('blog_posts');

    var query =
        blogPostCollection.where('isPublish',isEqualTo: false).limit(limit);

    if (startAfter != null) {
      query = query.startAfterDocument(startAfter);
    }

    final querySnapshot = await query.get();

    final List<BlogPostModel> blogPosts = [];
    for (final document in querySnapshot.docs) {
      final blogPost = BlogPostModel.fromJson(document.data());
      blogPosts.add(blogPost);
    }

    return blogPosts;
  }

  Future<List<BlogPostModel>> getBlogPostsByTitle(
      {required String title}) async {

    if(title=="") return List.empty();

    final firestore = FirebaseFirestore.instance;
    final blogPostCollection = firestore.collection('blog_posts');

    var query =
        blogPostCollection.where('title',isEqualTo: title);



    final querySnapshot = await query.get();

    final List<BlogPostModel> blogPosts = [];
    for (final document in querySnapshot.docs) {
      final blogPost = BlogPostModel.fromJson(document.data());
      print(document.data().toString());
      Get.log("doc: ${document.data()}");
      blogPosts.add(blogPost);
    }

    return blogPosts;
  }

  Future<List<BlogPostModel>> getPublishBlogPosts(
      {int limit = 10, DocumentSnapshot? startAfter}) async {
    final firestore = FirebaseFirestore.instance;
    final blogPostCollection = firestore.collection('blog_posts');

    var query =
        blogPostCollection.where('isPublish',isEqualTo: true).limit(limit);

    if (startAfter != null) {
      query = query.startAfterDocument(startAfter);
    }

    final querySnapshot = await query.get();

    final List<BlogPostModel> blogPosts = [];
    for (final document in querySnapshot.docs) {
      final blogPost = BlogPostModel.fromJson(document.data());
      blogPosts.add(blogPost);
    }

    return blogPosts;
  }
}
