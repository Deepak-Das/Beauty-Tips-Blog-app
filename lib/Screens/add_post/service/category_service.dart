import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'model/cat_model.dart';

class CategoryService {
  final _categoryCollection =
      FirebaseFirestore.instance.collection('categories');

  var categoriesData = <CategoryModel>[].obs;

  Future<void> saveCategory(CategoryModel category) async {
    EasyLoading.show(status: "Saving");
    await _categoryCollection.add(category.toJson()).then((value) {
      EasyLoading.dismiss();
    });
  }

  Future<void> editCategory(CategoryModel category) async {
    final document = _categoryCollection.doc(category.categoryId);
    await document.update(category.toJson());
  }

  Future<List<CategoryModel>> getCategories() async {
    final snapshot = await _categoryCollection.get();
    final categories = snapshot.docs
        .map((doc) => CategoryModel.fromJson(doc.id, doc.data()))
        .toList();
    return categoriesData.value=categories;
  }
}
