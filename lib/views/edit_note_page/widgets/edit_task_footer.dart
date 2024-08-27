import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/add_task_controller.dart';
import 'package:to_do_app/controllers/edit_task_controller.dart';
import 'package:to_do_app/model/task_model.dart';

class EditTaskFooter extends StatelessWidget {
  const EditTaskFooter({
    super.key, required this.model,
  });
  final TaskModel model;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditTaskController>(
        init: EditTaskController(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Due Date : ${controller.selectedDate!=null? DateFormat('MMM d, y').format(controller.selectedDate!):DateFormat('MMM d, y').format(DateTime.parse(model.endDate))}',
                  style: TextStyle(
                      fontFamily: Constans.kFontFamily,
                      color: Constans.kWhiteElementColor.withOpacity(.9))),
              SizedBox(
                height: 5,
              ),
              Text(
                  controller.selectedHourIndex!=null?'Due Time : ${controller.selectedHourIndex}:${controller.selectedMinuteIndex}':"Due Time : ${model.endTime}",
                  style: TextStyle(
                      fontFamily: Constans.kFontFamily,
                      color: Constans.kWhiteElementColor.withOpacity(.9))),
              SizedBox(
                height: 5,
              ),
              Text(
                'Prioroty : ${controller.selectedPriority??model.priority}',
                style: TextStyle(
                    fontFamily: Constans.kFontFamily,
                    color: Constans.kWhiteElementColor.withOpacity(.9)),
              )
            ],
          );
        });
  }
}
