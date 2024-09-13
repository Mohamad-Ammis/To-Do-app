import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: isActive ? Colors.blue : Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8)),
      duration: const Duration(milliseconds: 300),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: isActive
                ? Get.isDarkMode
                    ? Theme.of(context).colorScheme.secondary
                    : Colors.white
                : !Get.isDarkMode
                    ? Colors.black
                    : Colors.white,
            fontFamily: Constans.kFontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
