
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class BlogPostModel {
  String? postId;
  String title;
  String content;
  List<String> categories;
  String likeCount;
  String shareCount;
  bool isPublish;
  String readTime;
  File? imageFile;
  String? imageUrl;
  String? date;

  BlogPostModel({
    this.postId,
    required this.title,
    required this.content,
    required this.categories,
    required this.likeCount,
    required this.shareCount,
    required this.readTime,
    required this.isPublish,
    this.date,
    this.imageFile,
    this.imageUrl,
  });

  factory BlogPostModel.fromJson(Map<String, dynamic> json) {
    Timestamp serverTimestamp = json['timestamp'];
    return BlogPostModel(
      postId: json['postId'],
      title: json['title'],
      content: json['content'],
      categories: List<String>.from(json['categories']),
      likeCount: json['like_count'],
      shareCount: json['share_count'],
      readTime: json['read_time'],
      isPublish: json['isPublish'],
      imageUrl: json['image_url'],
      date: DateFormat("dd-MMM-yyyy").format(serverTimestamp.toDate()),
    );
  }

  Map<String, dynamic> toJson({String? imageUrl}) {
    return {
      'title': title,
      'content': content,
      'categories': categories,
      'like_count': likeCount,
      'share_count': shareCount,
      'read_time':readTime,
      'isPublish':isPublish,
      'image_url': imageUrl ?? this.imageUrl,
      'timestamp': FieldValue.serverTimestamp(),
    };
  }
}
