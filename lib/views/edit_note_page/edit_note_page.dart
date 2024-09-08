import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/model/task_model.dart';
import 'package:to_do_app/views/edit_note_page/widgets/edit_note_form.dart';
import 'package:to_do_app/views/edit_note_page/widgets/edit_task_appbar.dart';
import 'package:to_do_app/views/edit_note_page/widgets/edit_task_footer.dart';
import 'package:to_do_app/widgets/color_List_view.dart';
import 'package:to_do_app/widgets/custom_timer_picker/time_picker.dart';

class EditTaskPage extends StatelessWidget {
  const EditTaskPage({super.key, required this.model});
  final TaskModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EditTaskAppbar(
        model: model,
      ),
      backgroundColor: Constans.kDarkBackgroundColor,
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EditNoteForm(model: model),
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
                  ColorListView(
                    isEditPage: true,
                    selectedColorIndex:
                        Constans.kColors.indexOf(Color(model.color)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Text(
                  //   'Add your task date , time , priority ',
                  //   overflow: TextOverflow.ellipsis,
                  //   style: TextStyle(
                  //       color: Constans.kWhiteElementColor.withOpacity(.9),
                  //       fontFamily: Constans.kFontFamily,
                  //       fontSize: 16),
                  // ),
                  // EditTaskProperties(),
                  SizedBox(
                    height: 20,
                  ),
                  EditTaskFooter(
                    model: model,
                  ),
                  // GetBuilder<CategoryPageController>(
                  //     init: CategoryPageController(),
                  //     builder: (controller) {
                  //       return TaskCategorySection(isEditPage: true, model:model);
                  //     })
                ],
              ),
            ),
            model.isCompleted
                ? CustomButton(
                    margin: 0,
                    title: 'C O M P L E T E D',
                    color: Colors.green,
                    titleColor: Constans.kWhiteElementColor,
                  )
                : DateTime.parse(model.endDate).isAfter(DateTime.now())
                    ? CustomButton(
                        margin: 0,
                        title: 'Mark as completed',
                        onTap: () {
                          model.isCompleted = true;
                          model.save();
                          Get.back();
                        },
                      )
                    : CustomButton(
                        margin: 0,
                        title: 'Missed Task',
                        color: Colors.red,
                        titleColor: Constans.kWhiteElementColor,
                      )
          ],
        ),
      ),
    );
  }
}
