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
    tasks = taskBox.values.toList();
    for (var element in tasks) {
      debugPrint(element.endDate);
    }
    debugPrint('tasks: ${tasks}');
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTasks();
  }
}
