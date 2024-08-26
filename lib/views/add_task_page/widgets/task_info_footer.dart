import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/add_task_controller.dart';

class TaskInfoFooter extends StatelessWidget {
  const TaskInfoFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddTaskController>(
        init: AddTaskController(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              controller.setDate
                  ? Text(
                      'Due Date : ${DateFormat('MMM d, y').format(controller.selectedDate)}',
                      style: TextStyle(
                          fontFamily: Constans.kFontFamily,
                          color: Constans.kWhiteElementColor.withOpacity(.9)))
                  : SizedBox(),
              SizedBox(
                height: 5,
              ),
              controller.setTime
                  ? Text(
                      'Due Time : ${controller.selectedHourIndex}:${controller.selectedMinuteIndex}',
                      style: TextStyle(
                          fontFamily: Constans.kFontFamily,
                          color: Constans.kWhiteElementColor.withOpacity(.9)))
                  : SizedBox(),
              SizedBox(
                height: 5,
              ),
              controller.setPriority
                  ? Text(
                      'Prioroty : ${controller.selectedPriority}',
                      style: TextStyle(
                          fontFamily: Constans.kFontFamily,
                          color: Constans.kWhiteElementColor.withOpacity(.9)),
                    )
                  : SizedBox(),
            ],
          );
        });
  }
}
