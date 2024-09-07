import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/category_page_controller.dart';
import 'package:to_do_app/model/category_model.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({
    super.key,
    required this.model,
  });

  final CategoryModel model;
  final CategoryPageController controller = Get.put(CategoryPageController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width / 3,
          decoration: BoxDecoration(
              color: Color(model.color),
              borderRadius: BorderRadius.circular(Constans.kCardBorderRadius)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                IconData(model.icon, fontFamily: 'MaterialIcons'),
                color: Colors.white,
                size: 35,
              ),
              Text(
                model.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: Constans.kFontFamily),
              ),
            ],
          ),
        ),
        Positioned.fill(
            child: Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () async {
              await model.delete();
              controller.getCategories();
              controller.update();
            },
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Constans.kWhiteElementColor.withOpacity(.9),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Constans.kCardBorderRadius),
                      bottomLeft: Radius.circular(Constans.kCardBorderRadius))),
              child: Icon(
                Icons.delete_forever,
                size: 20,
              ),
            ),
          ),
        ))
      ],
    );
  }
}
