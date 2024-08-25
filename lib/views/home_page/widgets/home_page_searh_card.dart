
import 'package:flutter/material.dart';
import 'package:to_do_app/constans.dart';

class HomePageSearchBar extends StatelessWidget {
  const HomePageSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
          color: Constans.kCardBackgroundColor,
          borderRadius: BorderRadius.circular(Constans.kCardBorderRadius)),
      width: MediaQuery.sizeOf(context).width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Constans.kWhiteElementColor,
          ),
          Expanded(
              child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
                disabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                focusedErrorBorder:
                    OutlineInputBorder(borderSide: BorderSide.none),
                hintText: 'Search here .....',
                hintStyle: TextStyle(
                    color: Constans.kWhiteElementColor.withOpacity(.4),
                    fontFamily: Constans.kFontFamily)),
            cursorColor: Colors.white,
          ))
        ],
      ),
    );
  }
}
