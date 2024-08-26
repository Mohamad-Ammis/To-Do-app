import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/add_task_controller.dart';
import 'package:to_do_app/utils/app_images.dart';
import 'package:to_do_app/widgets/custom_text_field.dart';

class AddTaskForm extends StatelessWidget {
  const AddTaskForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddTaskController>(
        init: AddTaskController(),
        builder: (controller) {
          return Form(
            key: controller.formKey,
            autovalidateMode: controller.autovalidateMode,
            child: Column(
              children: [
                Stack(
                  children: [
                    CustomTextField(
                      onChanged: (data) {
                        controller.taskTitle = data;
                      },
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
