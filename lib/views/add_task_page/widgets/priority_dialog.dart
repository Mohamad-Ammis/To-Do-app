import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/add_task_controller.dart';
import 'package:to_do_app/views/add_task_page/widgets/priority_gridview.dart';
import 'package:to_do_app/widgets/custom_timer_picker/time_picker.dart';

class PriorityDialog extends StatelessWidget {
  const PriorityDialog({
    super.key,
    required this.isEditingPage,
  });
  final bool isEditingPage;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddTaskController>(
        init: AddTaskController(),
        builder: (controller) {
          return AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.primary,
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.hardEdge,
            content: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(16)),
              padding: EdgeInsets.all(16),
              width: 300,
              height: MediaQuery.sizeOf(context).height * 0.5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Set your task priority",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontFamily: Constans.kFontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "1,2 is for important task and so on..",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontFamily: Constans.kFontFamily,
                        fontSize: 10),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: PriorityGridView(
                    isEditingPage: isEditingPage,
                  )),
                  CustomButton(
                    margin: 12,
                    color: Get.isDarkMode ? null : Colors.black,
                    title: 'S A V E',
                    onTap: () {
                      controller.setPriority = true;
                      debugPrint(
                          'controller.setPriority: ${controller.setPriority}');
                      controller.update();
                      Get.back();
                    },
                    titleColor: Get.isDarkMode ? Colors.black : Colors.white,
                  )
                ],
              ),
            ),
          );
        });
  }
}
