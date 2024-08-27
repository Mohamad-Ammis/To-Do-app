import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/navigation_controller.dart';
import 'package:to_do_app/widgets/bottom_navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<NavigationController>(
          init: NavigationController(),
          builder: (controller) {
            return Stack(
              children: [
                controller.screens[controller.selectedIndex],
                const CustomBottomNavbar()
              ],
            );
          }),
    );
  }
}
