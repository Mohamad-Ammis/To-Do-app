import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationsService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    InitializationSettings settings = InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings());
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (details) {},
      onDidReceiveBackgroundNotificationResponse: backgroundHandler,
    );
  }

  static void showBasicNotification() {
    NotificationDetails details = NotificationDetails(
      android: AndroidNotificationDetails('id 1', 'basic'),
    );
    flutterLocalNotificationsPlugin.show(
      0,
      'title basic',
      'body',
      details,
    );
  }

  static void showReapetedNotification() {
    NotificationDetails details = NotificationDetails(
      android: AndroidNotificationDetails('id 1', 'repeated'),
    );
    flutterLocalNotificationsPlugin.periodicallyShow(
      1,
      'title repeated',
      'body',
      RepeatInterval.everyMinute,
      details,
    );
  }

  static Future<void> showScheduledNotification(
      {required String title,
      required DateTime date,
      required hour,
      required minute}) async {
    try {
      NotificationDetails details = NotificationDetails(
        android: AndroidNotificationDetails('id 2', 'Schduled'),
      );
      tz.initializeTimeZones();
      final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(currentTimeZone));
      final tz.TZDateTime scheduledDate = tz.TZDateTime(
          tz.local, date.year, date.month, date.day, hour, minute);

      if (scheduledDate.isBefore(tz.TZDateTime.now(tz.local))) {
        debugPrint('you will not receive notification for this task');
        return;
      }
      await flutterLocalNotificationsPlugin.zonedSchedule(
          2,
          '$title ',
          'your task time is end , let\'s finish another one',
          tz.TZDateTime(
              tz.local, date.year, date.month, date.day, hour, minute),
          details,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime);
    } on Exception catch (e) {
      debugPrint('e: ${e}');
    }
  }

  static Future<void> showDailyScheduledNotification() async {
    try {
      NotificationDetails details = NotificationDetails(
        android: AndroidNotificationDetails('id 3', 'Daily'),
      );
      tz.initializeTimeZones();
      log(tz.local.name);
      final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(currentTimeZone));
      log(tz.local.name);
      final currentTime = tz.TZDateTime.now(tz.local);
      var scheduledTime = tz.TZDateTime(
          tz.local, currentTime.year, currentTime.month, currentTime.day, 21);

      debugPrint('scheduledTime: ${scheduledTime}');
      debugPrint('currentTime: ${currentTime}');

      if (scheduledTime.isBefore(currentTime)) {
        scheduledTime = scheduledTime.add(Duration(days: 1));
      }

      debugPrint('Updated scheduledTime: ${scheduledTime}');

      await flutterLocalNotificationsPlugin.zonedSchedule(
        3,
        'Finish Your Task',
        'your task time is close to end, let\'s go and complete it',
        scheduledTime,
        details,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time, // لضمان جدولة يومية
      );
    } on Exception catch (e) {
      debugPrint('Error: ${e}');
    }
  }

  static Future<void> cancelNotification(id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}

void backgroundHandler(NotificationResponse details) {
  debugPrint('Notification received in background: ${details.payload}');
}
