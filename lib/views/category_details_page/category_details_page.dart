import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/category_page_controller.dart';
import 'package:to_do_app/views/home_page/widgets/task_card.dart';

class CategoryDetailsPage extends StatelessWidget {
  const CategoryDetailsPage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Constans.kDarkBackgroundColor,
        title: Text(
          '$title Tasks',
          style: TextStyle(
              fontFamily: Constans.kFontFamily,
              color: Constans.kWhiteElementColor),
        ),
        centerTitle: true,
        scrolledUnderElevation: 0,
      ),
      backgroundColor: Constans.kDarkBackgroundColor,
      body: GetBuilder<CategoryPageController>(
          init: CategoryPageController(),
          builder: (controller) {
            return ListView.builder(
                itemCount: controller.categoryTasks.length,
                itemBuilder: (context, index) {
                  return TaskCard(model: controller.categoryTasks[index]);
                });
          }),
    );
  }
}
