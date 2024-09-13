import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/home_page.controller.dart';
import 'package:to_do_app/helper/custom_toast_notification.dart';
import 'package:to_do_app/model/task_model.dart';

class TaskController extends GetxController {
  addTask(TaskModel model, context) async {
    var taskBox = Hive.box<TaskModel>(Constans.kTasksBox);
    bool taskExist = checkIfTaskExist(model);
    if (taskExist) {
      showInfoSnackBar('Sorry', 'You already have task match this information')
          .show(context);
    } else {
      await taskBox.add(model);
    }
  }

  bool checkIfTaskExist(TaskModel model) {
    var taskBox = Hive.box<TaskModel>(Constans.kTasksBox);
    List<TaskModel> tasks = taskBox.values.toList();

    for (var task in tasks) {
      DateTime taskEndDateTime =
          _combineDateAndTime(task.endDate, task.endTime);
      DateTime modelEndDateTime =
          _combineDateAndTime(model.endDate, model.endTime);

      if (task.title == model.title &&
          taskEndDateTime.isAtSameMomentAs(modelEndDateTime) &&
          task.priority == model.priority) {
        debugPrint('Task already exists!');
        return true;
      }
    }
    debugPrint('Task does not exist.');
    return false;
  }

  DateTime _combineDateAndTime(String date, String time) {
    DateTime parsedDate = DateTime.parse(date);
    List<String> timeParts = time.split(':');
    int hours = int.parse(timeParts[0]);
    int minutes = int.parse(timeParts[1]);
    return DateTime(
        parsedDate.year, parsedDate.month, parsedDate.day, hours, minutes);
  }

  List<TaskModel> displayTasksList = [];
  List<TaskModel> tasks = [];

  List<TaskModel> getAllTasks() {
    var taskBox = Hive.box<TaskModel>(Constans.kTasksBox);

    List<TaskModel> allTasks = taskBox.values.where((task) {
      return task.title.isNotEmpty;
    }).toList();

    allTasks.sort((a, b) {
      DateTime dateTimeA = _combineDateAndTime(a.endDate, a.endTime);
      DateTime dateTimeB = _combineDateAndTime(b.endDate, b.endTime);
      return dateTimeA.compareTo(dateTimeB);
    });

    debugPrint('allTasks: $allTasks');
    displayTasksList = allTasks;
    update();
    return allTasks;
  }

  getToDoTasks() {
    var taskBox = Hive.box<TaskModel>(Constans.kTasksBox);
    DateTime now = DateTime.now();
    tasks = taskBox.values.where((task) {
      DateTime taskDateTime = _combineDateAndTime(task.endDate, task.endTime);
      return (taskDateTime.isAfter(now) ||
              taskDateTime.isAtSameMomentAs(now)) &&
          task.title.isNotEmpty &&
          task.isCompleted == false;
    }).toList();

    tasks.sort((a, b) {
      DateTime dateTimeA = _combineDateAndTime(a.endDate, a.endTime);
      DateTime dateTimeB = _combineDateAndTime(b.endDate, b.endTime);
      return dateTimeA.compareTo(dateTimeB);
    });

    debugPrint('tasks: $tasks');
    displayTasksList = tasks;
    return tasks;
  }

  List<TaskModel> tasksBeforeToday = [];

  getMissingTasks() {
    var taskBox = Hive.box<TaskModel>(Constans.kTasksBox);
    DateTime now = DateTime.now();

    tasksBeforeToday = taskBox.values.where((task) {
      DateTime taskDateTime = _combineDateAndTime(task.endDate, task.endTime);
      return taskDateTime.isBefore(now) && task.title.isNotEmpty;
    }).toList();

    tasksBeforeToday.sort((a, b) {
      DateTime dateTimeA = _combineDateAndTime(a.endDate, a.endTime);
      DateTime dateTimeB = _combineDateAndTime(b.endDate, b.endTime);
      return dateTimeA.compareTo(dateTimeB);
    });

    debugPrint('tasksBeforeToday: $tasksBeforeToday');
    displayTasksList = tasksBeforeToday;
    return tasksBeforeToday;
  }

  List<TaskModel> searchTasksList = [];
  final homeController = Get.put(HomePageController());

  searchTasks(String? searchText) {
    var taskBox = Hive.box<TaskModel>(Constans.kTasksBox);
    if (searchText == null || searchText.isEmpty) {
      searchTasksList =
          homeController.filtersList[homeController.selectedIndex].onTap();
    } else {
      searchTasksList = taskBox.values.where((task) {
        return task.title.toLowerCase().contains(searchText.toLowerCase()) &&
            task.title.isNotEmpty;
      }).toList();
    }

    searchTasksList.sort((a, b) {
      DateTime dateTimeA = _combineDateAndTime(a.endDate, a.endTime);
      DateTime dateTimeB = _combineDateAndTime(b.endDate, b.endTime);
      return dateTimeA.compareTo(dateTimeB);
    });

    debugPrint('searchTasksList: $searchTasksList');
    displayTasksList = searchTasksList;
    return searchTasksList;
  }

  deleteTasksWithEmptyTitle() {
    var taskBox = Hive.box<TaskModel>(Constans.kTasksBox);
    var tasksWithEmptyTitle =
        taskBox.values.where((task) => task.title.isEmpty).toList();

    for (var task in tasksWithEmptyTitle) {
      task.delete();
    }

    debugPrint(
        '${tasksWithEmptyTitle.length} tasks with empty titles were deleted.');
  }

  List<TaskModel> getHighPriorityTasks() {
    var taskBox = Hive.box<TaskModel>(Constans.kTasksBox);

    List<TaskModel> highPriorityTasks = taskBox.values.where((task) {
      return task.priority < 4 && task.title.isNotEmpty;
    }).toList();

    highPriorityTasks.sort((a, b) {
      DateTime dateTimeA = _combineDateAndTime(a.endDate, a.endTime);
      DateTime dateTimeB = _combineDateAndTime(b.endDate, b.endTime);
      return dateTimeA.compareTo(dateTimeB);
    });

    debugPrint('High Priority Tasks: $highPriorityTasks');
    displayTasksList = highPriorityTasks;
    return highPriorityTasks;
  }

  List<TaskModel> getMediumPriorityTasks() {
    var taskBox = Hive.box<TaskModel>(Constans.kTasksBox);

    List<TaskModel> mediumPriorityTasks = taskBox.values.where((task) {
      return task.priority >= 4 && task.priority < 7 && task.title.isNotEmpty;
    }).toList();

    mediumPriorityTasks.sort((a, b) {
      DateTime dateTimeA = _combineDateAndTime(a.endDate, a.endTime);
      DateTime dateTimeB = _combineDateAndTime(b.endDate, b.endTime);
      return dateTimeA.compareTo(dateTimeB);
    });

    debugPrint('Medium Priority Tasks: $mediumPriorityTasks');
    displayTasksList = mediumPriorityTasks;
    return mediumPriorityTasks;
  }

  List<TaskModel> getLowPriorityTasks() {
    var taskBox = Hive.box<TaskModel>(Constans.kTasksBox);

    List<TaskModel> lowPriorityTasks = taskBox.values.where((task) {
      return task.priority >= 7 && task.title.isNotEmpty;
    }).toList();

    lowPriorityTasks.sort((a, b) {
      DateTime dateTimeA = _combineDateAndTime(a.endDate, a.endTime);
      DateTime dateTimeB = _combineDateAndTime(b.endDate, b.endTime);
      return dateTimeA.compareTo(dateTimeB);
    });

    debugPrint('Low Priority Tasks: $lowPriorityTasks');
    displayTasksList = lowPriorityTasks;
    return lowPriorityTasks;
  }

  List<TaskModel> getCompletedTasks() {
    var taskbox = Hive.box<TaskModel>(Constans.kTasksBox);
    List<TaskModel> completedTasks = taskbox.values.where((task) {
      return task.isCompleted == true;
    }).toList();
    completedTasks.sort((a, b) {
      DateTime dateTimeA = _combineDateAndTime(a.endDate, a.endTime);
      DateTime dateTimeB = _combineDateAndTime(b.endDate, b.endTime);
      return dateTimeA.compareTo(dateTimeB);
    });

    debugPrint('completed Tasks: $completedTasks');
    displayTasksList = completedTasks;
    return completedTasks;
  }

  @override
  void onInit() {
    super.onInit();
    deleteTasksWithEmptyTitle();
    displayTasksList = getAllTasks();
  }
}
