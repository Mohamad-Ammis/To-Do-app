
import 'package:flutter/material.dart';
import 'package:to_do_app/constans.dart';

class FilterCard extends StatelessWidget {
  const FilterCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: Constans.kCardBackgroundColor,
          borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Text(
          "Today",
          style: TextStyle(
            color: Constans.kWhiteElementColor,
            fontFamily: Constans.kFontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
