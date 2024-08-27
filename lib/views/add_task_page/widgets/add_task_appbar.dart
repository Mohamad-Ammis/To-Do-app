import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/add_task_controller.dart';
import 'package:to_do_app/controllers/navigation_controller.dart';
import 'package:to_do_app/controllers/task_controller.dart';
import 'package:to_do_app/helper/custom_toast_notification.dart';
import 'package:to_do_app/model/task_model.dart';

class AddTaskAppbar extends StatelessWidget implements PreferredSizeWidget {
  AddTaskAppbar({
    super.key,
  });
  final taskController = Get.put(TaskController());
  final navigationController = Get.put(NavigationController());
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
                        taskController.addTask(TaskModel(
                            title: controller.taskTitle,
                            description: controller.taskDescription,
                            endDate: controller.selectedDate.toString(),
                            endTime:
                                '${controller.selectedHourIndex}:${controller.selectedMinuteIndex}',
                            priority: controller.selectedPriority,
                            color: Constans
                                .kColors[controller.selectedColorIndex].value));
                        navigationController.selectedIndex = 0;
                        taskController.getTasks();
                        taskController.update();
                        navigationController.update();
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
                  icon: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10, color: Colors.white.withOpacity(.3))
                      ],
                      shape: BoxShape.circle,
                      color: Constans.kCardBackgroundColor,
                    ),
                    child: Icon(
                      Icons.done,
                      color: Constans.kWhiteElementColor,
                    ),
                  ));
            })
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 58);
}
