import 'package:flutter/material.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/model/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.model,
  });

  final CategoryModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

