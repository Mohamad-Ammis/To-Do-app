import 'package:flutter/material.dart';
import 'package:to_do_app/constans.dart';

class MinutesTile extends StatelessWidget {
  const MinutesTile(
      {super.key, required this.minutes, required this.isSelected});
  final int minutes;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0),
      child: AnimatedContainer(
        decoration: BoxDecoration(
            color:
                isSelected ? Colors.white.withOpacity(.1) : Colors.transparent,
            borderRadius: BorderRadius.circular(Constans.kCardBorderRadius)),
        duration: Duration(milliseconds: 300),
        child: Center(
          child: Text(
            minutes < 10 ? '0${minutes}' : minutes.toString(),
            style: TextStyle(
                fontFamily: Constans.kFontFamily,
                fontSize: 40,
                color: Constans.kWhiteElementColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
