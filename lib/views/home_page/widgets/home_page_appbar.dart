import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/home_page.controller.dart';

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
          leading: GetBuilder<HomePageController>(
              init: HomePageController(),
              builder: (controller) {
                return IconButton(
                    onPressed: () {
                      controller.showFilter = !controller.showFilter;
                      controller.update();
                    },
                    icon: Icon(
                      controller.showFilter
                          ? Icons.filter_list
                          : Icons.filter_list_off,
                      color: Constans.kWhiteElementColor,
                    ));
              }),
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
