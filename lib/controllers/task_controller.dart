import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/model/task_model.dart';

class TaskController extends GetxController {
  addTask(TaskModel model) async {
    var taskBox = Hive.box<TaskModel>(Constans.kTasksBox);
    var status = await taskBox.add(model);
    debugPrint('status: ${status}');
  }

  List<TaskModel> tasks = [];

  getTasks() {
    var taskBox = Hive.box<TaskModel>(Constans.kTasksBox);
    DateTime today = DateTime.now();
    tasks = taskBox.values.where((task) {
      DateTime taskDate = DateTime.parse(task.endDate);
      return taskDate.isAfter(today) || taskDate.isAtSameMomentAs(today);
    }).toList();
    tasks.sort((a, b) {
      DateTime dateA = DateTime.parse(a.endDate);
      DateTime dateB = DateTime.parse(b.endDate);
      return dateA.compareTo(dateB);
    });

    debugPrint('tasks: $tasks');
  }

  List<TaskModel> tasksBeforeToday = [];
  getMissingTasks() {
    var taskBox = Hive.box<TaskModel>(Constans.kTasksBox);
    DateTime today = DateTime.now();

    tasks = taskBox.values.where((task) {
      DateTime taskDate = DateTime.parse(task.endDate);
      return taskDate.isBefore(today);
    }).toList();

    tasksBeforeToday.sort((a, b) {
      DateTime dateA = DateTime.parse(a.endDate);
      DateTime dateB = DateTime.parse(b.endDate);
      return dateA.compareTo(dateB);
    });

    for (var element in tasksBeforeToday) {
      debugPrint(element.endDate);
    }

    debugPrint('tasksBeforeToday: $tasksBeforeToday');
  }
  List<TaskModel> searchTasksList = [];

searchTasks(String searchText) {
  var taskBox = Hive.box<TaskModel>(Constans.kTasksBox);

  searchTasksList = taskBox.values.where((task) {
    return task.title.toLowerCase().contains(searchText.toLowerCase());
  }).toList();

  searchTasksList.sort((a, b) {
    DateTime dateA = DateTime.parse(a.endDate);
    DateTime dateB = DateTime.parse(b.endDate);
    return dateA.compareTo(dateB);
  });

  for (var element in searchTasksList) {
    debugPrint(element.title);
  }

  debugPrint('tasksWithTitleContaining: $searchTasksList');
}


  deleteTasksWithEmptyTitle() {
    var taskBox = Hive.box<TaskModel>(Constans.kTasksBox);

    // احصل على قائمة بالمهام التي عنوانها فارغ
    var tasksWithEmptyTitle =
        taskBox.values.where((task) => task.title.isEmpty).toList();

    // احذف كل مهمة ذات عنوان فارغ
    for (var task in tasksWithEmptyTitle) {
      task.delete(); // يحذف المهمة من Hive
    }

    debugPrint(
        '${tasksWithEmptyTitle.length} tasks with empty titles were deleted.');
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTasks();
  }
}

