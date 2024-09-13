import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/home_page.controller.dart';
import 'package:to_do_app/controllers/task_controller.dart';
import 'package:to_do_app/model/task_model.dart';
import 'package:to_do_app/views/edit_note_page/widgets/edit_note_form.dart';
import 'package:to_do_app/views/edit_note_page/widgets/edit_task_appbar.dart';
import 'package:to_do_app/views/edit_note_page/widgets/edit_task_footer.dart';
import 'package:to_do_app/widgets/color_list_view.dart';
import 'package:to_do_app/widgets/custom_timer_picker/time_picker.dart';

class EditTaskPage extends StatelessWidget {
  EditTaskPage({super.key, required this.model});
  final TaskModel model;
  final TaskController taskController = Get.put(TaskController());
  final HomePageController homePageController = Get.put((HomePageController()));
  @override
  Widget build(BuildContext context) {
    // تحويل التاريخ من نص إلى DateTime
    DateTime taskEndDate = DateTime.parse(model.endDate);

    // تقسيم الوقت إلى ساعات ودقائق
    List<String> timeParts = model.endTime.split(':');
    int hours = int.parse(timeParts[0]);
    int minutes = int.parse(timeParts[1]);

    // دمج التاريخ مع الوقت
    DateTime taskEndDateTime = DateTime(
      taskEndDate.year,
      taskEndDate.month,
      taskEndDate.day,
      hours,
      minutes,
    );

    // الحصول على التاريخ والوقت الحاليين
    DateTime now = DateTime.now();

    return Scaffold(
      appBar: EditTaskAppbar(
        model: model,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
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
                  const SizedBox(height: 20),
                  Text(
                    'Choose your task Color',
                    style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(.9),
                        fontFamily: Constans.kFontFamily,
                        fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  ColorListView(
                    isEditPage: true,
                    selectedColorIndex:
                        Constans.kColors.indexOf(Color(model.color)),
                  ),
                  const SizedBox(height: 20),
                  EditTaskFooter(
                    model: model,
                  ),
                ],
              ),
            ),
            model.isCompleted
                ? const CustomButton(
                    margin: 0,
                    title: 'C O M P L E T E D',
                    color: Colors.green,
                    titleColor: Colors.white,
                  )
                : (taskEndDateTime.isAfter(now))
                    ? CustomButton(
                        margin: 0,
                        title: 'Mark as completed',
                        titleColor: Colors.black,
                        onTap: () {
                          model.isCompleted = true;
                          model.save();
                          taskController.getAllTasks();
                          homePageController.selectedIndex = 0;
                          Get.back();
                        },
                      )
                    : const CustomButton(
                        margin: 0,
                        title: 'Missed Task',
                        color: Colors.red,
                        titleColor: Colors.white,
                      )
          ],
        ),
      ),
    );
  }
}
