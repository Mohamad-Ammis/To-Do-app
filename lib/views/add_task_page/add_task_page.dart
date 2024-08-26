import 'package:flutter/material.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/views/add_task_page/widgets/add_task_appbar.dart';
import 'package:to_do_app/views/add_task_page/widgets/add_task_form.dart';
import 'package:to_do_app/views/add_task_page/widgets/task_info_footer.dart';
import 'package:to_do_app/views/add_task_page/widgets/task_properties.dart';
import 'package:to_do_app/widgets/color_List_view.dart';


class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddTaskAppbar(),
      backgroundColor: Constans.kDarkBackgroundColor,
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddTaskForm(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Choose your task Color',
                style: TextStyle(
                    color: Constans.kWhiteElementColor.withOpacity(.9),
                    fontFamily: Constans.kFontFamily,
                    fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              ColorListView(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Add your task date , time , priority ',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Constans.kWhiteElementColor.withOpacity(.9),
                    fontFamily: Constans.kFontFamily,
                    fontSize: 16),
              ),
              TaskProperties(),
              SizedBox(
                height: 20,
              ),
              TaskInfoFooter()
            ],
          ),
        ),
      ),
    );
  }
}

