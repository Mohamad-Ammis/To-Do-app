import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/model/task_model.dart';

class AddTaskController extends GetxController {
  int selectedPriority = -1;
  DateTime selectedDate = DateTime.now();
  int selectedHourIndex = 1;
  int selectedMinuteIndex = 0;
  bool setTime = false;
  bool setDate = false;
  bool setPriority = false;

  late final GlobalKey<FormState> formKey;
  late AutovalidateMode autovalidateMode;
  String taskTitle = '';
  String taskDescription = '';
  int selectedColorIndex = 0;
  addTask(TaskModel model) async {
    var taskBox = Hive.box<TaskModel>(Constans.kTasksBox);
    var status = await taskBox.add(model);
    debugPrint('status: ${status}');
  }

  List<TaskModel> tasks = [];
  getTasks() {
    var taskBox = Hive.box<TaskModel>(Constans.kTasksBox);
    tasks = taskBox.values.toList();
    debugPrint('tasks: ${tasks}');
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    formKey = GlobalKey();
    autovalidateMode = AutovalidateMode.disabled;
    getTasks();
  }
}
