import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:get/get.dart';
import 'package:to_do_app/controllers/profile_page_controller.dart';

class LocalNotificationsService extends GetxService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static final ProfilePageController controller =
      Get.put(ProfilePageController());

  static Future<void> init() async {
    InitializationSettings settings = const InitializationSettings(
        android: AndroidInitializationSettings('@drawable/ic_notification'),
        iOS: DarwinInitializationSettings());
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (details) {},
      onDidReceiveBackgroundNotificationResponse: backgroundHandler,
    );
  }

  static void showBasicNotification() {
    if (!controller.notificationsEnabled.value) {
      log('notification service is disabled so notification dismiss automaticlly');
      return;
    }
    NotificationDetails details = const NotificationDetails(
      android: AndroidNotificationDetails('id 0', 'basic'),
    );
    flutterLocalNotificationsPlugin.show(
      0,
      'Basic Notification',
      'This is a basic notification',
      details,
    );
  }

  static void showReapetedNotification() {
    if (!controller.notificationsEnabled.value) {
      log('notification service is disabled so notification dismiss automaticlly');
      return;
    }
    NotificationDetails details = const NotificationDetails(
      android: AndroidNotificationDetails('id 1', 'repeated'),
    );
    flutterLocalNotificationsPlugin.periodicallyShow(
      1,
      'Repeated Notification',
      'This notification repeats every minute',
      RepeatInterval.everyMinute,
      details,
    );
  }

  static Future<void> showScheduledNotification({
    required String title,
    required DateTime date,
    required int hour,
    required int minute,
  }) async {
    if (!controller.notificationsEnabled.value) {
      log('notification service is disabled so notification dismiss automaticlly');
      return;
    }
    try {
      NotificationDetails details = const NotificationDetails(
        android: AndroidNotificationDetails('id 2', 'Scheduled'),
      );
      tz.initializeTimeZones();
      final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(currentTimeZone));
      final tz.TZDateTime scheduledDate = tz.TZDateTime(
          tz.local, date.year, date.month, date.day, hour, minute);

      if (scheduledDate.isBefore(tz.TZDateTime.now(tz.local))) {
        debugPrint('You will not receive notification for this task');
        return;
      }

      await flutterLocalNotificationsPlugin.zonedSchedule(
        2,
        title,
        'Your task time has ended, we hope you dont miss it',
        scheduledDate,
        details,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
    } catch (e) {
      debugPrint('Error scheduling notification: $e');
    }
  }

  static Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  static Future<void> showDailyScheduledNotification() async {
    log('showDailyScheduledNotification');
    if (!controller.notificationsEnabled.value) {
      log('notification service is disabled so notification dismiss automaticlly');
      return;
    }
    try {
      NotificationDetails details = const NotificationDetails(
        android: AndroidNotificationDetails('id 3', 'Daily'),
      );
      tz.initializeTimeZones();
      log(tz.local.name);
      final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(currentTimeZone));
      log(tz.local.name);
      final currentTime = tz.TZDateTime.now(tz.local);
      var scheduledTime = tz.TZDateTime(tz.local, currentTime.year,
          currentTime.month, currentTime.day, 23, 24);

      debugPrint('scheduledTime: $scheduledTime');
      debugPrint('currentTime: $currentTime');

      if (scheduledTime.isBefore(currentTime)) {
        scheduledTime = scheduledTime.add(const Duration(days: 1));
      }

      debugPrint('Updated scheduledTime: $scheduledTime');

      await flutterLocalNotificationsPlugin.zonedSchedule(
        3,
        'Have a productive dat',
        'write your task and work on it to have a productive day',
        scheduledTime,
        details,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
      );
    } on Exception catch (e) {
      debugPrint('Error: $e');
    }
  }
}

void backgroundHandler(NotificationResponse details) {
  debugPrint('Notification received in background: ${details.payload}');
}
