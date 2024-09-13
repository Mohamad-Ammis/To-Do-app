import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/add_task_controller.dart';
import 'package:to_do_app/controllers/edit_task_controller.dart';

class CustomTableCalender extends StatelessWidget {
  CustomTableCalender({
    super.key,
    required this.isEditingPage,
  });
  final bool isEditingPage;
  final editTaskController = Get.put(EditTaskController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddTaskController>(
        init: AddTaskController(),
        builder: (controller) {
          return TableCalendar(
            availableCalendarFormats: const {CalendarFormat.month: 'Month'},
            headerStyle: HeaderStyle(
                decoration: BoxDecoration(
                  color: Get.isDarkMode
                      ? Constans.kCardBackgroundColor
                      : Colors.white,
                ),
                titleTextStyle: TextStyle(
                    fontFamily: Constans.kFontFamily,
                    color: Get.isDarkMode ? Colors.white : Colors.black),
                formatButtonTextStyle:
                    const TextStyle(fontFamily: Constans.kFontFamily),
                headerMargin: const EdgeInsets.only(bottom: 8)),
            firstDay: DateTime.now(),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: controller.selectedDate,
            selectedDayPredicate: (day) {
              return isSameDay(controller.selectedDate, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              controller.selectedDate = selectedDay;
              if (isEditingPage) {
                editTaskController.selectedDate = selectedDay;
                editTaskController.update();
              }
              controller.update();
            },
            calendarStyle: CalendarStyle(
              todayDecoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.transparent),
              defaultTextStyle:
                  TextStyle(color: Theme.of(context).colorScheme.secondary),
              weekendTextStyle:
                  TextStyle(color: Theme.of(context).colorScheme.secondary),
              disabledTextStyle: const TextStyle(color: Colors.red),
              selectedTextStyle: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
              selectedDecoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
            ),
          );
        });
  }
}
