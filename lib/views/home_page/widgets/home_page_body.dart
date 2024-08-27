import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/home_page.controller.dart';
import 'package:to_do_app/views/home_page/widgets/filters_listview.dart';
import 'package:to_do_app/views/home_page/widgets/home_page_appbar.dart';
import 'package:to_do_app/views/home_page/widgets/home_page_searh_card.dart';
import 'package:to_do_app/views/home_page/widgets/task_listview.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constans.kDarkBackgroundColor,
      appBar: HomePageAppbar(),
      body: Column(
        children: [
          HomePageSearchBar(),
          SizedBox(
            height: 10,
          ),
          GetBuilder<HomePageController>(
              init: HomePageController(),
              builder: (controller) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  height: controller.showFilter ? 40 : 0,
                  child: FiltersListView(),
                );
              }),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: TasksListView(),
          ),
        ],
      ),
    );
  }
}
