
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/add_task_controller.dart';
import 'package:to_do_app/views/add_task_page/widgets/priority_card.dart';

class PriorityGridView extends StatelessWidget {
  const PriorityGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddTaskController>(
        init: AddTaskController(),
        builder: (controller) {
          return GridView.builder(
              itemCount: 10,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8),
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      controller.selectedPriority = index + 1;
                      debugPrint('controller.selectedPriority: ${controller.selectedPriority}');
                      controller.update();
                    },
                    child: PriorityCard(
                      priority: index + 1,
                    ));
              });
        });
  }
}
