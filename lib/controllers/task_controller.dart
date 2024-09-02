import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/home_page.controller.dart';
import 'package:to_do_app/model/task_model.dart';

class TaskController extends GetxController {
  addTask(TaskModel model) async {
    var taskBox = Hive.box<TaskModel>(Constans.kTasksBox);

    var status = await taskBox.add(model);
    debugPrint('status: ${status}');
  }

  List<TaskModel> displayTasksList = [];
  List<TaskModel> tasks = [];
  List<TaskModel> getAllTasks() {
    var taskBox = Hive.box<TaskModel>(Constans.kTasksBox);

    List<TaskModel> allTasks = taskBox.values.where((task) {
      return task.title.isNotEmpty;
    }).toList();

    allTasks.sort((a, b) {
      DateTime dateA = DateTime.parse(a.endDate);
      DateTime dateB = DateTime.parse(b.endDate);
      return dateA.compareTo(dateB);
    });

    debugPrint('allTasks: $allTasks');
    displayTasksList = allTasks;
    for (var i = 0; i < allTasks.length; i++) {
      debugPrint("task categories${allTasks[i].categories}");
    }
    return allTasks;
  }

  getToDoTasks() {
    var taskBox = Hive.box<TaskModel>(Constans.kTasksBox);
    DateTime today = DateTime.now();
    tasks = taskBox.values.where((task) {
      DateTime taskDate = DateTime.parse(task.endDate);
      return (taskDate.isAfter(today) || taskDate.isAtSameMomentAs(today)) &&
          task.title.isNotEmpty;
    }).toList();

    tasks.sort((a, b) {
      DateTime dateA = DateTime.parse(a.endDate);
      DateTime dateB = DateTime.parse(b.endDate);
      return dateA.compareTo(dateB);
    });

    debugPrint('tasks: $tasks');
    displayTasksList = tasks;
    return tasks;
  }

  List<TaskModel> tasksBeforeToday = [];

  getMissingTasks() {
    var taskBox = Hive.box<TaskModel>(Constans.kTasksBox);
    DateTime today = DateTime.now();

    tasksBeforeToday = taskBox.values.where((task) {
      DateTime taskDate = DateTime.parse(task.endDate);
      return taskDate.isBefore(today) && task.title.isNotEmpty;
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
      DateTime dateA = DateTime.parse(a.endDate);
      DateTime dateB = DateTime.parse(b.endDate);
      return dateA.compareTo(dateB);
    });

    for (var element in searchTasksList) {
      debugPrint(element.title);
    }

    debugPrint('tasksWithTitleContaining: $searchTasksList');
    displayTasksList = searchTasksList;
    return searchTasksList;
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

  List<TaskModel> getHighPriorityTasks() {
    var taskBox = Hive.box<TaskModel>(Constans.kTasksBox);

    List<TaskModel> highPriorityTasks = taskBox.values.where((task) {
      return task.priority < 4 && task.title.isNotEmpty;
    }).toList();

    highPriorityTasks.sort((a, b) {
      DateTime dateA = DateTime.parse(a.endDate);
      DateTime dateB = DateTime.parse(b.endDate);
      return dateA.compareTo(dateB);
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
      DateTime dateA = DateTime.parse(a.endDate);
      DateTime dateB = DateTime.parse(b.endDate);
      return dateA.compareTo(dateB);
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
      DateTime dateA = DateTime.parse(a.endDate);
      DateTime dateB = DateTime.parse(b.endDate);
      return dateA.compareTo(dateB);
    });

    debugPrint('Low Priority Tasks: $lowPriorityTasks');
    displayTasksList = lowPriorityTasks;
    return lowPriorityTasks;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    deleteTasksWithEmptyTitle();
    displayTasksList = getAllTasks();
  }
}
