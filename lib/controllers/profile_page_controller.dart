import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/task_controller.dart';

class ProfilePageController extends GetxController {
  final taskController = Get.put(TaskController());
  late int toDoTaskCount = 0;
  late int completedTaskCount = 0;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      toDoTaskCount = taskController.getToDoTasks().length;
      completedTaskCount = taskController.getCompletedTasks().length;
      update();
    });
  }
}
