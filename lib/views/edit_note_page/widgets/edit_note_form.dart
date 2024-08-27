import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/add_task_controller.dart';
import 'package:to_do_app/controllers/edit_task_controller.dart';
import 'package:to_do_app/controllers/form_controller.dart';
import 'package:to_do_app/model/task_model.dart';
import 'package:to_do_app/utils/app_images.dart';
import 'package:to_do_app/widgets/custom_text_field.dart';

class EditNoteForm extends StatelessWidget {
   EditNoteForm({
    super.key,
    required this.model,
  });
  final TaskModel model;
  final controller = Get.put(EditTaskController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditTaskController>(
        init: EditTaskController(),
        builder: (controller) {
          return Form(

            child: Column(
              children: [
                Stack(
                  children: [
                    CustomTextField(
                      onChanged: (data) {
                        controller.taskTitle = data;
                      },
                      initialValue: model.title,
                      hintText: 'Enter yout task title ...',
                      hintStyle: TextStyle(
                          color: Constans.kWhiteElementColor.withOpacity(.3),
                          fontFamily: Constans.kFontFamily),
                      textStyle: TextStyle(
                          color: Constans.kWhiteElementColor,
                          fontFamily: Constans.kFontFamily),
                      cursorColor: Constans.kWhiteElementColor,
                      label: null,
                      labelStyle: null,
                      filled: true,
                      fillColor: Constans.kCardBackgroundColor,
                      focusedBorderColor: Constans.kWhiteElementColor,
                      enabledBorderColor: Colors.transparent,
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image.asset(
                            Assets.imagesTarget,
                            width: 20,
                            height: 20,
                            color: Constans.kWhiteElementColor.withOpacity(.3),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    CustomTextField(
                      onChanged: (data) {
                        controller.taskDescription = data;
                      },
                      initialValue: model.description,
                      maxLines: 5,
                      hintText: 'Enter your task description ...',
                      hintStyle: TextStyle(
                          color: Constans.kWhiteElementColor.withOpacity(.3),
                          fontFamily: Constans.kFontFamily),
                      textStyle: TextStyle(
                          color: Constans.kWhiteElementColor,
                          fontFamily: Constans.kFontFamily),
                      cursorColor: Constans.kWhiteElementColor,
                      label: null,
                      labelStyle: null,
                      filled: true,
                      fillColor: Constans.kCardBackgroundColor,
                      focusedBorderColor: Constans.kWhiteElementColor,
                      enabledBorderColor: Colors.transparent,
                    ),
                    Positioned.fill(
                        child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 20, 0, 0),
                        child: Image.asset(
                          Assets.imagesTask,
                          width: 20,
                          height: 20,
                          color: Constans.kWhiteElementColor.withOpacity(.3),
                        ),
                      ),
                    )),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
