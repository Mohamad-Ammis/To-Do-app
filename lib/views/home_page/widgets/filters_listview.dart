import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/home_page.controller.dart';
import 'package:to_do_app/controllers/task_controller.dart';
import 'package:to_do_app/views/home_page/widgets/filter_card.dart';

class FiltersListView extends StatelessWidget {
  FiltersListView({
    super.key,
  });
  final taskController = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
        init: HomePageController(),
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.filtersList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  controller.selectedIndex = index;
                  controller.update();
                  controller.filtersList[index].onTap();
                  debugPrint('**************');
                  taskController.update();
                },
                child: FilterCard(
                  title: controller.filtersList[index].title,
                  isActive: controller.selectedIndex == index,
                ),
              );
            },
            scrollDirection: Axis.horizontal,
          );
        });
  }
}
