import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/category_page_controller.dart';
import 'package:to_do_app/controllers/task_controller.dart';
import 'package:to_do_app/model/category_model.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({
    super.key,
    required this.model,
    required this.showDeleteIcon,
  });
  final bool showDeleteIcon;
  final CategoryModel model;
  final CategoryPageController controller = Get.put(CategoryPageController());
  final taskController = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width / 3,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(.2), blurRadius: 10)
              ],
              color: Color(model.color),
              borderRadius: BorderRadius.circular(Constans.kCardBorderRadius)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                IconData(model.icon,
                    fontFamily: 'MaterialIcons'), 
                color: Colors.white,
                size: 35,
              ),
              Text(
                model.title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: Constans.kFontFamily),
              ),
            ],
          ),
        ),
        if (showDeleteIcon)
          Positioned.fill(
              child: Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () async {
                controller.deleteTasksWithCategory(model.title);
                await model.delete();
                controller.getCategories();
                controller.update();
                taskController.getAllTasks();
              },
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(.9)
                        : Colors.white,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(Constans.kCardBorderRadius),
                        bottomLeft:
                            Radius.circular(Constans.kCardBorderRadius))),
                child: const Icon(
                  Icons.delete_forever,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ))
      ],
    );
  }
}
