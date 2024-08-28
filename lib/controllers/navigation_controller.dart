import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/model/navbar_model.dart';
import 'package:to_do_app/services/local_notification.dart';
import 'package:to_do_app/views/add_task_page/add_task_page.dart';
import 'package:to_do_app/views/home_page/widgets/home_page_body.dart';

class NavigationController extends GetxController {
  final List<NavbarModel> navbarItems = [
    NavbarModel(icon: Icons.home, title: 'Home'),
    NavbarModel(icon: Icons.calendar_month, title: 'Calender'),
    NavbarModel(icon: Icons.add_box_rounded, title: 'new'),
    NavbarModel(icon: Icons.notifications_none, title: 'notification'),
    NavbarModel(icon: Icons.person, title: 'profile'),
  ];
  int selectedIndex = 0;
  List<Widget> screens = [
    const HomePageBody(),
    Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              // LocalNotificationsService.showScheduledNotification();
            },
            child: Text('data')),
      ),
    ),
    AddTaskPage(),
    Container(
      color: Colors.black,
    ),
    Container(
      color: Colors.green,
    )
  ];
}
