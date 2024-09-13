import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/home_page.controller.dart';
import 'package:to_do_app/controllers/navigation_controller.dart';
import 'package:to_do_app/controllers/task_controller.dart';
import 'package:to_do_app/views/home_page/widgets/filters_listview.dart';
import 'package:to_do_app/views/home_page/widgets/home_page_appbar.dart';
import 'package:to_do_app/views/home_page/widgets/home_page_searh_card.dart';
import 'package:to_do_app/views/home_page/widgets/task_listview.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({
    super.key,
  });

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  final NavigationController navigationController =
      Get.put(NavigationController());
  final HomePageController homePageController = Get.put(HomePageController());
  @override
  void initState() {
    super.initState();
    homePageController.filtersList[homePageController.selectedIndex].onTap();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: const HomePageAppbar(),
      body: Column(
        children: [
          HomePageSearchBar(),
          const SizedBox(
            height: 10,
          ),
          GetBuilder<HomePageController>(
              init: HomePageController(),
              builder: (controller) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  height: controller.showFilter ? 40 : 0,
                  child: FiltersListView(),
                );
              }),
          const SizedBox(
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
