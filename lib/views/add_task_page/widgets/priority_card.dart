import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/add_task_controller.dart';
import 'package:to_do_app/utils/app_images.dart';

class PriorityCard extends StatelessWidget {
  PriorityCard({
    super.key,
    required this.priority,
  });
  final int priority;
  final controller = Get.put(AddTaskController());
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: controller.selectedPriority == priority
              ? Get.isDarkMode
                  ? Color(0xFF8687E7)
                  : Colors.blueAccent
              : Color(0xFF272727)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Assets.imagesFlag),
          Text(
            priority.toString(),
            style: TextStyle(
                color: Get.isDarkMode
                    ? Theme.of(context).colorScheme.secondary
                    : Colors.white,
                fontFamily: Constans.kFontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ],
      ),
    );
  }
}
