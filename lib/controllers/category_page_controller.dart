import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/model/category_model.dart';

class CategoryPageController extends GetxController {
  int selectedColorIndex = 0;
  IconData selectedIcon = Icons.image_search_outlined;
  String title = '';
  void addCategory() {
    var categoryBox = Hive.box<CategoryModel>(Constans.kCategoryBox);
    categoryBox.add(CategoryModel(
        title: title,
        color: Constans.kColors[selectedColorIndex].value,
        icon: selectedIcon.codePoint));
    selectedColorIndex = 0;
    selectedIcon = Icons.image_search_outlined;
    title = '';
  }

  List<CategoryModel> categoriesList = [];
  void getCategories() {
    var categoryBox = Hive.box<CategoryModel>(Constans.kCategoryBox);
    categoriesList = categoryBox.values.toList();
    debugPrint('categoriesList: ${categoriesList}');
  }

  @override
  void onInit() {
    super.onInit();
    getCategories();
  }
}
