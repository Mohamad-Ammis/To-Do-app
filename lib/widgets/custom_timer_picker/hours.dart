import 'package:flutter/material.dart';
import 'package:to_do_app/constans.dart';

class HoursTile extends StatelessWidget {
  const HoursTile({super.key, required this.hours, required this.isSelected});
  final int hours;
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
            hours.toString(),
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
