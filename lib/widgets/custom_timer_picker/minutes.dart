import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constans.dart';

class MinutesTile extends StatelessWidget {
  const MinutesTile(
      {super.key, required this.minutes, required this.isSelected});
  final int minutes;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: AnimatedContainer(
        decoration: BoxDecoration(
            color: isSelected
                ? Get.isDarkMode
                    ? Colors.white.withOpacity(.1)
                    : Colors.black
                : Colors.transparent,
            borderRadius: BorderRadius.circular(Constans.kCardBorderRadius)),
        duration: const Duration(milliseconds: 300),
        child: Center(
          child: Text(
            minutes < 10 ? '0$minutes' : minutes.toString(),
            style: TextStyle(
                fontFamily: Constans.kFontFamily,
                fontSize: 40,
                color: isSelected
                    ? Get.isDarkMode
                        ? Theme.of(context).colorScheme.secondary
                        : Colors.white
                    : Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
