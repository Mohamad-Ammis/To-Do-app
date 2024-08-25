import 'package:flutter/material.dart';
import 'package:to_do_app/constans.dart';

class HomePageAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: AppBar(
          scrolledUnderElevation: 0,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.filter_list,
                color: Constans.kWhiteElementColor,
              )),
          title: Text(
            'Home',
            style: TextStyle(
              fontFamily: Constans.kFontFamily,
              color: Constans.kWhiteElementColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            CircleAvatar(
              maxRadius: 42,
            )
          ],
          backgroundColor: Constans.kDarkBackgroundColor,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 58);
}
