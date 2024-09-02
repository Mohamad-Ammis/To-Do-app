import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/model/category_model.dart';
import 'package:to_do_app/model/task_model.dart';

class CategoryPageController extends GetxController {
  int selectedColorIndex = 0;
  IconData selectedIcon = Icons.image_search_outlined;
  String title = '';
  List<CategoryModel> selectedCategories = [];
  bool showCategories = false;

  void toggleCategorySelection(CategoryModel category) {
    if (selectedCategories.contains(category)) {
      selectedCategories.remove(category);
    } else {
      selectedCategories.add(category);
    }
    update();
    log(selectedCategories.length.toString());
  }

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

  List<TaskModel> categoryTasks = [];
  List<TaskModel> getTasksByCategory(String title) {
    var taskBox = Hive.box<TaskModel>(Constans.kTasksBox);

    List<TaskModel> tasksWithCategory = taskBox.values.where((task) {
      return task.categories.contains(title);
    }).toList();

    tasksWithCategory.sort((a, b) {
      DateTime dateA = DateTime.parse(a.endDate);
      DateTime dateB = DateTime.parse(b.endDate);
      return dateA.compareTo(dateB);
    });

    debugPrint('tasksWithCategory: $tasksWithCategory');
    categoryTasks = tasksWithCategory;
    return tasksWithCategory;
  }
}
