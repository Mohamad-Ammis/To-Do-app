import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/category_page_controller.dart';
import 'package:to_do_app/controllers/edit_task_controller.dart';
import 'package:to_do_app/controllers/home_page.controller.dart';
import 'package:to_do_app/controllers/task_controller.dart';
import 'package:to_do_app/model/task_model.dart';
import 'package:to_do_app/views/home_page/home_page.dart';

class EditTaskAppbar extends StatelessWidget implements PreferredSizeWidget {
  EditTaskAppbar({
    super.key,
    required this.model,
  });
  final taskController = Get.put(TaskController());
  final controller = Get.put(EditTaskController());
  final CategoryPageController categoryPageController =
      Get.put(CategoryPageController());
  final HomePageController homePageController = Get.put(HomePageController());
  final TaskModel model;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: Text(
        "Edit Task",
        style: TextStyle(
            fontFamily: Constans.kFontFamily,
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold,
            fontSize: 24),
      ),
      centerTitle: true,
      actions: model.isCompleted ||
              !DateTime.parse(model.endDate).isAfter(DateTime.now())
          ? null
          : [
              GetBuilder<EditTaskController>(
                  init: EditTaskController(),
                  builder: (controller) {
                    return IconButton(
                        onPressed: () {
                          model.title = controller.taskTitle ?? model.title;
                          model.description =
                              controller.taskDescription ?? model.description;
                          model.color = controller.selectedColorIndex != null
                              ? Constans
                                  .kColors[controller.selectedColorIndex!].value
                              : model.color;
                          model.endDate = controller.selectedDate != null
                              ? controller.selectedDate.toString()
                              : model.endDate;
                          model.endTime = controller.selectedMinuteIndex !=
                                      null &&
                                  controller.selectedHourIndex != null
                              ? ("${controller.selectedHourIndex}:${controller.selectedMinuteIndex}")
                              : model.endTime;
                          model.priority =
                              controller.selectedPriority ?? model.priority;
                          model.save();
                          controller.selectedColorIndex = null;
                          controller.selectedDate = null;
                          controller.selectedHourIndex = null;
                          controller.selectedMinuteIndex = null;
                          controller.selectedPriority = null;
                          controller.taskTitle = null;
                          taskController.getAllTasks();
                          taskController.update();
                          // Get.off(HomePage());
                          Get.back();
                          // homePageController.selectedIndex = 0;
                          // Get.offAll(const HomePage());
                        },
                        icon: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.white.withOpacity(.3))
                            ],
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: Icon(
                            Icons.done,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ));
                  })
            ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 58);
}
