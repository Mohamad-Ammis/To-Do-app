import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/model/navbar_model.dart';
import 'package:to_do_app/views/add_task_page/add_task_page.dart';
import 'package:to_do_app/views/category_page/category_page.dart';
import 'package:to_do_app/views/home_page/widgets/home_page_body.dart';
import 'package:to_do_app/views/profile_page/profile_page.dart';

class NavigationController extends GetxController {
  final List<NavbarModel> navbarItems = [
    NavbarModel(icon: Icons.home, title: 'Home'),
    NavbarModel(icon: Icons.category_rounded, title: 'Category'),
    NavbarModel(icon: Icons.add, title: 'add'),
    NavbarModel(icon: Icons.person, title: 'profile'),
  ];
  int selectedIndex = 0;
  List<Widget> screens = [
    const HomePageBody(),
    CategoryPage(),
    const AddTaskPage(),
    const ProfilePage()
  ];
}
