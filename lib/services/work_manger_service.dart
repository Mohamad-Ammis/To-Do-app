import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/model/category_model.dart';
import 'package:to_do_app/model/task_model.dart';
import 'package:to_do_app/services/local_notification_service.dart';
import 'package:workmanager/workmanager.dart';

class WorkMangerService {
  //init service

  void registerTask() async {
    await Workmanager().registerPeriodicTask(
        'id 1', 'show Scheduled Notification',
        frequency: const Duration(days: 1));
  }

  Future<void> init() async {
    await Workmanager().initialize(
        executeTask, // The top level function, aka callbackDispatcher
        isInDebugMode:
            true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
        );
    //register task
    registerTask();
  }

  //cancel
  void cancelTask(uniqueName) {
    Workmanager().cancelByUniqueName(uniqueName);
  }
}

@pragma('vm:entry-point') 
void executeTask() {
  Workmanager().executeTask((task, inputData) async {
    // تهيئة Hive وفتح الصناديق المطلوبة هنا
    await Hive.initFlutter();
    Hive.registerAdapter<TaskModel>(TaskModelAdapter());
    await Hive.openBox<TaskModel>(Constans.kTasksBox);
    Hive.registerAdapter<CategoryModel>(CategoryModelAdapter());
    await Hive.openBox<CategoryModel>(Constans.kCategoryBox);
    
    // الآن يمكنك عرض الإشعار
    await LocalNotificationsService.showDailyScheduledNotification();
    
    return Future.value(true);
  });
}