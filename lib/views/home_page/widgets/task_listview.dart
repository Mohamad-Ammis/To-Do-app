import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/add_task_controller.dart';
import 'package:to_do_app/views/home_page/widgets/task_card.dart';

class TasksListView extends StatelessWidget {
  TasksListView({
    super.key,
  });
  final controller = Get.put(AddTaskController());
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: controller.tasks.length,
        itemBuilder: (context, index) {
          return index == 5
              ? SizedBox(
                  height: 100,
                )
              : TaskCard(model: controller.tasks[index],);
        });
  }
}
