import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/add_task_controller.dart';
import 'package:to_do_app/helper/custom_toast_notification.dart';
import 'package:to_do_app/model/task_model.dart';

class AddTaskAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AddTaskAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Constans.kDarkBackgroundColor,
      title: Text(
        "Add Task",
        style: TextStyle(
            fontFamily: Constans.kFontFamily,
            color: Constans.kWhiteElementColor,
            fontWeight: FontWeight.bold,
            fontSize: 24),
      ),
      centerTitle: true,
      actions: [
        GetBuilder<AddTaskController>(
            init: AddTaskController(),
            builder: (controller) {
              return IconButton(
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      if (controller.setPriority &&
                          controller.setDate &&
                          controller.setTime) {
                        debugPrint('validate');
                        controller.addTask(TaskModel(
                            title: controller.taskTitle,
                            description: controller.taskDescription,
                            endDate: controller.selectedDate.toString(),
                            endTime:
                                '${controller.selectedHourIndex}:${controller.selectedMinuteIndex}',
                            priority: controller.selectedPriority,
                            color: Constans
                                .kColors[controller.selectedColorIndex].value));
                      } else {
                        showErrorSnackBar('Error Happened',
                                "Date,Time,Priority Fields are required")
                            .show(context);
                      }
                    } else {
                      controller.autovalidateMode = AutovalidateMode.always;
                      controller.update();
                    }
                  },
                  icon: Icon(
                    Icons.done,
                    color: Constans.kWhiteElementColor,
                  ));
            })
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 58);
}
