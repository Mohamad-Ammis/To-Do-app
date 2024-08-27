import 'package:get/get.dart';
import 'package:to_do_app/controllers/task_controller.dart';
import 'package:to_do_app/model/filter_model.dart';

class HomePageController extends GetxController {
  int selectedIndex = 0;
  bool showFilter = false;
  List<FilterModel> filtersList = [
    FilterModel(
        title: 'All',
        onTap: () {
          final taskController = Get.put(TaskController());
          taskController.displayTasksList = taskController.getAllTasks();
          taskController.update();
          return taskController.displayTasksList;
        }),
    FilterModel(
        title: 'To Do',
        onTap: () {
          final taskController = Get.put(TaskController());
          taskController.displayTasksList = taskController.getToDoTasks();
          taskController.update();
          return taskController.displayTasksList;
        }),
    FilterModel(
        title: 'missing',
        onTap: () {
          final taskController = Get.put(TaskController());
          taskController.displayTasksList = taskController.getMissingTasks();
          taskController.update();
          return taskController.displayTasksList;
        }),
    FilterModel(
        title: 'Important',
        onTap: () {
          final taskController = Get.put(TaskController());
          taskController.getHighPriorityTasks();
          taskController.update();
          return taskController.displayTasksList;
        }),
    FilterModel(
        title: 'Normal',
        onTap: () {
          final taskController = Get.put(TaskController());
          taskController.displayTasksList =
              taskController.getMediumPriorityTasks();
          taskController.update();
          return taskController.displayTasksList;
        }),
    FilterModel(
        title: 'Un important',
        onTap: () {
          final taskController = Get.put(TaskController());
          taskController.displayTasksList =
              taskController.getLowPriorityTasks();
          taskController.update();
          return taskController.displayTasksList;
        }),
  ];
}
