import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/add_task_controller.dart';
import 'package:to_do_app/controllers/edit_task_controller.dart';
import 'package:to_do_app/widgets/custom_timer_picker/hours.dart';
import 'package:to_do_app/widgets/custom_timer_picker/minutes.dart';

class CustomTimerPicker extends StatefulWidget {
  const CustomTimerPicker({super.key, required this.isEditingPage});
  final bool isEditingPage;
  @override
  State<CustomTimerPicker> createState() => _CustomTimerPickerState();
}

class _CustomTimerPickerState extends State<CustomTimerPicker> {
  late FixedExtentScrollController hoursController;
  late FixedExtentScrollController minutesController;
  final timerController = Get.put(AddTaskController());
  @override
  void initState() {
    super.initState();

    // Initialize controllers with initial values centered
    hoursController = FixedExtentScrollController(initialItem: 12);
    minutesController = FixedExtentScrollController(initialItem: 30);
    timerController.selectedMinuteIndex = 30;
    timerController.selectedHourIndex = 12;
  }

  @override
  void dispose() {
    hoursController.dispose();
    minutesController.dispose();
    super.dispose();
  }

  final editTaskController = Get.put(EditTaskController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GetBuilder<AddTaskController>(
          init: AddTaskController(),
          builder: (taskController) {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              'Hours',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontFamily: Constans.kFontFamily,
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 70,
                                child: ListWheelScrollView.useDelegate(
                                  controller: hoursController,
                                  onSelectedItemChanged: (index) {
                                    taskController.selectedHourIndex = index;
                                    if (widget.isEditingPage) {
                                      editTaskController.selectedHourIndex =
                                          index;
                                      editTaskController.update();
                                    }
                                    taskController.update();
                                  },
                                  itemExtent: 50,
                                  perspective: 0.005,
                                  diameterRatio: 1.2,
                                  physics: const FixedExtentScrollPhysics(),
                                  childDelegate: ListWheelChildBuilderDelegate(
                                    childCount: 24,
                                    builder: (context, index) {
                                      return HoursTile(
                                        hours: index,
                                        isSelected:
                                            taskController.selectedHourIndex ==
                                                index,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              'Minutes',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontFamily: Constans.kFontFamily,
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 70,
                                child: ListWheelScrollView.useDelegate(
                                  controller: minutesController,
                                  onSelectedItemChanged: (value) {
                                    taskController.selectedMinuteIndex = value;
                                    if (widget.isEditingPage) {
                                      editTaskController.selectedMinuteIndex =
                                          value;
                                      editTaskController.update();
                                    }

                                    taskController.update();
                                  },
                                  itemExtent: 50,
                                  perspective: 0.005,
                                  diameterRatio: 1.2,
                                  physics: const FixedExtentScrollPhysics(),
                                  childDelegate: ListWheelChildBuilderDelegate(
                                    childCount: 60,
                                    builder: (context, index) {
                                      return MinutesTile(
                                        minutes: index,
                                        isSelected: taskController
                                                .selectedMinuteIndex ==
                                            index,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  color: Get.isDarkMode ? null : Colors.black,
                  titleColor: Get.isDarkMode ? Colors.black : Colors.white,
                  onTap: () {
                    debugPrint('hours ${taskController.selectedHourIndex}');
                    debugPrint('minutes ${taskController.selectedMinuteIndex}');
                    taskController.setTime = true;
                    debugPrint(
                        'taskController.setTime : ${taskController.setTime}');
                    taskController.update();
                    Get.back();
                  },
                  title: 'S A V E',
                )
              ],
            );
          },
        ),
        Positioned(
          top: 10,
          right: 10,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop(); 
            },
            child: Icon(
              Icons.close,
              color: Theme.of(context).colorScheme.secondary,
              size: 24,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    required this.title,
    this.color,
    this.titleColor,
    this.height,
    this.margin,
    this.titleSize,
  });
  final void Function()? onTap;
  final String title;
  final Color? titleColor;
  final double? titleSize;
  final Color? color;
  final double? height;
  final double? margin;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(margin ?? 20),
        height: height ?? 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(Constans.kCardBorderRadius),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontFamily: Constans.kFontFamily,
                fontWeight: FontWeight.bold,
                fontSize: titleSize ?? 20,
                color: titleColor),
          ),
        ),
      ),
    );
  }
}
