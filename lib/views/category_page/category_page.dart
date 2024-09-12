import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/category_page_controller.dart';
import 'package:to_do_app/views/category_page/widgets/add_category_bottom_sheet.dart';
import 'package:to_do_app/views/category_page/widgets/category_gridveiw.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({
    super.key,
  });

  final controller = Get.put(CategoryPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          'Categories',
          style: TextStyle(
              fontFamily: Constans.kFontFamily,
              color: Theme.of(context).colorScheme.secondary),
        ),
        centerTitle: true,
        scrolledUnderElevation: 0,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(blurRadius: 10, color: Colors.white.withOpacity(.3))
              ],
            ),
            child: IconButton(
                onPressed: () async {
                  await Get.bottomSheet(AddCategoryBottomSheet(),
                      enableDrag: false);
                },
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.secondary,
                )),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: CategoryGridview(
            showDeleteIcon: true,
          )),
        ],
      ),
    );
  }
}
