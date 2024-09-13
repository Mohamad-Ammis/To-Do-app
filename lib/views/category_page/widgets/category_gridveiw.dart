import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/category_page_controller.dart';
import 'package:to_do_app/views/category_details_page/category_details_page.dart';
import 'package:to_do_app/views/category_page/widgets/category_card.dart';

class CategoryGridview extends StatelessWidget {
  const CategoryGridview({
    super.key,
    required this.showDeleteIcon,
  });
  final bool showDeleteIcon;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryPageController>(
        init: CategoryPageController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
                itemCount: controller.categoriesList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      String title = controller.categoriesList[index].title;
                      controller.getTasksByCategory(title);
                      Get.to(() => CategoryDetailsPage(
                            title: title,
                          ));
                    },
                    child: CategoryCard(
                      model: controller.categoriesList[index],
                      showDeleteIcon: showDeleteIcon,
                    ),
                  );
                }),
          );
        });
  }
}
