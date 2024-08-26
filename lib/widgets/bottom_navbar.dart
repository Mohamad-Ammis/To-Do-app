import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/navigation_controller.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
        init: NavigationController(),
        builder: (controller) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Constans.kCardBorderRadius),
                  color: Constans.kCardBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white.withOpacity(.1),
                        offset: Offset(0, 20),
                        blurRadius: 40),
                    BoxShadow(
                        color: Colors.white.withOpacity(.15),
                        offset: Offset(0, -20),
                        blurRadius: 40)
                  ]),
              height: 70,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: controller.navbarItems.map((e) {
                    return GestureDetector(
                      onTap: () {
                        controller.selectedIndex =
                            controller.navbarItems.indexOf(e);
                        controller.update();
                      },
                      child: AnimatedContainer(
                        width: 60,
                        padding: EdgeInsets.only(bottom: 8),
                        duration: Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                            color: controller.selectedIndex ==
                                    controller.navbarItems.indexOf(e)
                                ? Colors.white.withOpacity(.05)
                                : Colors.transparent,
                            borderRadius: BorderRadius.only(
                                bottomRight:
                                    Radius.circular(Constans.kCardBorderRadius),
                                bottomLeft: Radius.circular(
                                    Constans.kCardBorderRadius))),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedBar(
                              isActive: controller.selectedIndex ==
                                      controller.navbarItems.indexOf(e)
                                  ? true
                                  : false,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Icon(
                              e.icon,
                              color: controller.selectedIndex ==
                                      controller.navbarItems.indexOf(e)
                                  ? Constans.kWhiteElementColor
                                  : Constans.kWhiteElementColor.withOpacity(.5),
                            ),
                            Text(
                              e.title,
                              style: TextStyle(
                                  color: controller.selectedIndex ==
                                          controller.navbarItems.indexOf(e)
                                      ? Constans.kWhiteElementColor
                                      : Constans.kWhiteElementColor
                                          .withOpacity(.5),
                                  fontFamily: Constans.kFontFamily,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w200),
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList()),
            ),
          );
        });
  }
}

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    super.key,
    required this.isActive,
  });
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: isActive ? 60 : 0,
      height: 4,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(Constans.kCardBorderRadius)),
    );
  }
}
