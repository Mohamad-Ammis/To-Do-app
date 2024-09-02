import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/category_page_controller.dart';
import 'package:to_do_app/views/add_task_page/widgets/add_task_appbar.dart';
import 'package:to_do_app/views/add_task_page/widgets/add_task_form.dart';
import 'package:to_do_app/views/add_task_page/widgets/task_info_footer.dart';
import 'package:to_do_app/views/add_task_page/widgets/task_properties.dart';
import 'package:to_do_app/views/category_page/widgets/category_card.dart';
import 'package:to_do_app/widgets/color_List_view.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddTaskAppbar(),
      backgroundColor: Constans.kDarkBackgroundColor,
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddTaskForm(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Choose your task Color',
                style: TextStyle(
                    color: Constans.kWhiteElementColor.withOpacity(.9),
                    fontFamily: Constans.kFontFamily,
                    fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              ColorListView(
                isEditPage: false,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Add your task date , time , priority ',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Constans.kWhiteElementColor.withOpacity(.9),
                    fontFamily: Constans.kFontFamily,
                    fontSize: 16),
              ),
              TaskProperties(),
              SizedBox(
                height: 20,
              ),
              TaskInfoFooter(),
              SizedBox(
                height: 20,
              ),
              GetBuilder<CategoryPageController>(
                  init: CategoryPageController(),
                  builder: (controller) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Select Your Task Categoty ',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Constans.kWhiteElementColor
                                      .withOpacity(.9),
                                  fontFamily: Constans.kFontFamily,
                                  fontSize: 16),
                            ),
                            IconButton(
                                onPressed: () {
                                  controller.showCategories =
                                      !controller.showCategories;
                                  controller.update();
                                },
                                icon: Icon(
                                  controller.showCategories
                                      ? Icons.arrow_circle_up_rounded
                                      : Icons.arrow_drop_down_circle,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                        if (controller.showCategories)
                          SizedBox(
                            height: 20,
                          ),
                        if (controller.showCategories)
                          Container(child: SelectCategoryGrid()),
                        SizedBox(
                          height: 85,
                        )
                      ],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class SelectCategoryGrid extends StatelessWidget {
  const SelectCategoryGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: GetBuilder<CategoryPageController>(
        init: CategoryPageController(),
        builder: (controller) {
          return GridView.builder(
            itemCount: controller.categoriesList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final isSelected = controller.selectedCategories
                  .contains(controller.categoriesList[index]);

              return GestureDetector(
                onTap: () {
                  controller.toggleCategorySelection(
                      controller.categoriesList[index]);
                },
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: CategoryCard(
                        model: controller.categoriesList[index],
                      ),
                    ),
                    Positioned(
                      top: 4,
                      left: 4,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white)),
                        child: Icon(
                          Icons.done,
                          color: isSelected ? Colors.white : Colors.transparent,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
