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

@pragma(
    'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void executeTask() {
  Workmanager().executeTask((task, inputData) {
    LocalNotificationsService.showDailyScheduledNotification();
    return Future.value(true);
  });
}
