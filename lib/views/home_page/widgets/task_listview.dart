import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/add_task_controller.dart';
import 'package:to_do_app/controllers/task_controller.dart';
import 'package:to_do_app/views/add_task_page/add_task_page.dart';
import 'package:to_do_app/views/edit_note_page/edit_note_page.dart';
import 'package:to_do_app/views/edit_note_page/widgets/edit_note_form.dart';
import 'package:to_do_app/views/edit_note_page/widgets/edit_task_footer.dart';
import 'package:to_do_app/views/home_page/widgets/task_card.dart';

class TasksListView extends StatelessWidget {
  TasksListView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(
        init: TaskController(),
        builder: (controller) {
          return ListView.builder(
              itemCount: controller.displayTasksList.length + 1,
              itemBuilder: (context, index) {
                return index == controller.displayTasksList.length
                    ? SizedBox(
                        height: 100,
                      )
                    : GestureDetector(
                        onTap: () {
                          Get.to(() => EditTaskPage(
                                model: controller.displayTasksList[index],
                              ));
                        },
                        child: TaskCard(
                          model: controller.displayTasksList[index],
                        ),
                      );
              });
        });
  }
}
