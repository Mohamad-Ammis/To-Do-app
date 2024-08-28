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
      {required DateTime date, required hour, required minute}) async {
    try {
      NotificationDetails details = NotificationDetails(
        android: AndroidNotificationDetails('id 2', 'Schduled'),
      );
      tz.initializeTimeZones();
      log(tz.local.name);
      log(tz.TZDateTime.now(tz.local).hour.toString());
      final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(currentTimeZone));
      log(tz.local.name);
      log(date.year.toString());
      log(date.month.toString());
      log(date.day.toString());
      log(hour.toString());
      log(minute.toString());
      final tz.TZDateTime scheduledDate = tz.TZDateTime(
          tz.local, date.year, date.month, date.day, hour, minute);

      if (scheduledDate.isBefore(tz.TZDateTime.now(tz.local))) {
        debugPrint('you will not receive notification for this task');
        return;
      }
      await flutterLocalNotificationsPlugin.zonedSchedule(
          2,
          'Finish Your Task',
          'your task time is close to end , let\'s go and complete it',
          tz.TZDateTime(
              tz.local, date.year, date.month, date.day, hour, minute),
          details,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime);
    } on Exception catch (e) {
      debugPrint('e: ${e}');
    }
  }

  static Future<void> cancelNotification(id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}

// الدالة التي يجب أن تكون في مستوى أعلى
void backgroundHandler(NotificationResponse details) {
  // معالجة التنبيه عند الاستلام في الخلفية
  debugPrint('Notification received in background: ${details.payload}');
}
