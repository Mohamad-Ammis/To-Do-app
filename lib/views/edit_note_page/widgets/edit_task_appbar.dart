import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/category_page_controller.dart';
import 'package:to_do_app/controllers/edit_task_controller.dart';
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
  final TaskModel model;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Constans.kDarkBackgroundColor,
      title: const Text(
        "Edit Task",
        style: TextStyle(
            fontFamily: Constans.kFontFamily,
            color: Constans.kWhiteElementColor,
            fontWeight: FontWeight.bold,
            fontSize: 24),
      ),
      centerTitle: true,
      actions: [
        GetBuilder<EditTaskController>(
            init: EditTaskController(),
            builder: (controller) {
              return IconButton(
                  onPressed: () {
                    model.title = controller.taskTitle ?? model.title;
                    model.description =
                        controller.taskDescription ?? model.description;
                    model.color = controller.selectedColorIndex != null
                        ? Constans.kColors[controller.selectedColorIndex!].value
                        : model.color;
                    model.endDate = controller.selectedDate != null
                        ? controller.selectedDate.toString()
                        : model.endDate;
                    model.endTime = controller.selectedMinuteIndex != null &&
                            controller.selectedHourIndex != null
                        ? ("${controller.selectedHourIndex}:${controller.selectedMinuteIndex}")
                        : model.endTime;
                    model.priority =
                        controller.selectedPriority ?? model.priority;
                    // List<String> categories = [];
                    // for (var i = 0;
                    //     i < categoryPageController.selectedCategories.length;
                    //     i++) {
                    //   categories.add(
                    //       categoryPageController.selectedCategories[i].title);
                    // }
                    // model.categories = categories;
                    model.save();
                    controller.selectedColorIndex = null;
                    controller.selectedDate = null;
                    controller.selectedHourIndex = null;
                    controller.selectedMinuteIndex = null;
                    controller.selectedPriority = null;
                    controller.taskTitle = null;
                    taskController.getAllTasks();
                    Get.offAll(const HomePage());
                  },
                  icon: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10, color: Colors.white.withOpacity(.3))
                      ],
                      shape: BoxShape.circle,
                      color: Constans.kCardBackgroundColor,
                    ),
                    child: const Icon(
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
  Size get preferredSize => const Size(double.infinity, 58);
}
