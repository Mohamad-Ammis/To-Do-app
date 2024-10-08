import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart'; 
import 'package:to_do_app/controllers/task_controller.dart';
import 'package:to_do_app/services/local_notification_service.dart';

class ProfilePageController extends GetxController {
  final taskController = Get.put(TaskController());
  var notificationsEnabled = true.obs; 

  late int toDoTaskCount = 0;
  late int completedTaskCount = 0;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      toDoTaskCount = taskController.getToDoTasks().length;
      completedTaskCount = taskController.getCompletedTasks().length;

      await loadNotificationPreference();
      update();
    });
  }

  Future<void> saveNotificationPreference(bool isEnabled) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notificationsEnabled', isEnabled);
  }

  Future<void> loadNotificationPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    notificationsEnabled.value =
        prefs.getBool('notificationsEnabled') ?? true; 
  }

  void toggleNotifications(bool isEnabled) {
    notificationsEnabled.value = isEnabled;
    saveNotificationPreference(isEnabled); 

    if (isEnabled) {
      LocalNotificationsService.init();
    } else {
      LocalNotificationsService.cancelAllNotifications();
    }
  }
}
