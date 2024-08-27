import 'package:flutter/material.dart';
import 'package:to_do_app/constans.dart';

class FilterCard extends StatelessWidget {
  const FilterCard({
    super.key,
    required this.isActive,
    required this.title,
  });
  final bool isActive;
  final String title;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: isActive ? Colors.blue : Constans.kCardBackgroundColor,
          borderRadius: BorderRadius.circular(8)),
      duration: Duration(milliseconds: 300),
      child: Center(
        child: Text(
          title,
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
