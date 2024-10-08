import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/add_task_controller.dart';
import 'package:to_do_app/controllers/edit_task_controller.dart';
import 'package:to_do_app/widgets/custom_date_picker/custom_table_calender.dart';
import 'package:to_do_app/widgets/custom_timer_picker/time_picker.dart';

class CustomDatePicker extends StatelessWidget {
  CustomDatePicker({
    super.key,
    required this.isEditingPage,
  });
  final bool isEditingPage;
  final editTaskController = Get.put(EditTaskController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddTaskController>(
        init: AddTaskController(),
        builder: (controller) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: Container(
              color: Theme.of(context).colorScheme.primary,
              width: MediaQuery.of(context).size.width,
              height: 450,
              child: Stack(
                children: [
                  CustomTableCalender(isEditingPage: isEditingPage),
                  Positioned.fill(
                      child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: CustomButton(
                            color: Theme.of(context).colorScheme.secondary,
                            titleColor: Theme.of(context).colorScheme.primary,
                            onTap: () {
                              controller.selectedDate;
                              debugPrint(
                                  'controller.selectedDate: ${controller.selectedDate}');
                              controller.setDate = true;
                              debugPrint(
                                  'controller.setDate: ${controller.setDate}');
                              controller.update();
                              Get.back();
                            },
                            title: 'S A V E')),
                  ))
                ],
              ),
            ),
          );
        });
  }
}
