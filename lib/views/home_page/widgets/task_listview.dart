import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/add_task_controller.dart';
import 'package:to_do_app/controllers/task_controller.dart';
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
              itemCount: controller.tasks.length + 1,
              itemBuilder: (context, index) {
                return index == controller.tasks.length
                    ? SizedBox(
                        height: 100,
                      )
                    : TaskCard(
                        model: controller.tasks[index],
                      );
              });
        });
  }
}
