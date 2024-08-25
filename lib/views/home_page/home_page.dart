import 'package:flutter/material.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/views/home_page/widgets/filters_listview.dart';
import 'package:to_do_app/views/home_page/widgets/home_page_appbar.dart';
import 'package:to_do_app/views/home_page/widgets/home_page_searh_card.dart';
import 'package:to_do_app/views/home_page/widgets/task_card.dart';
import 'package:to_do_app/views/home_page/widgets/task_listview.dart';

class HomePage extends StatelessWidget {
  const HomePage({
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14),
            height: 40,
            child: FiltersListView(),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: TasksListView(),
          )
        ],
      ),
    );
  }
}
