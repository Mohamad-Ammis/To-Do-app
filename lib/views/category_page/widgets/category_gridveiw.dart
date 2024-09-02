import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/category_page_controller.dart';
import 'package:to_do_app/views/category_page/widgets/category_card.dart';

class CategoryGridview extends StatelessWidget {
  const CategoryGridview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryPageController>(
        init: CategoryPageController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
                itemCount: controller.categoriesList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return CategoryCard(
                    model: controller.categoriesList[index],
                  );
                }),
          );
        });
  }
}

