
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/add_task_controller.dart';

class CustomTableCalender extends StatelessWidget {
  const CustomTableCalender({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddTaskController>(
        init: AddTaskController(),
        builder: (controller) {
          return TableCalendar(
            availableCalendarFormats: {CalendarFormat.month: 'Month'},
            headerStyle: HeaderStyle(
                decoration: BoxDecoration(
                  color: Constans.kWhiteElementColor.withOpacity(.9),
                ),
                titleTextStyle: TextStyle(fontFamily: Constans.kFontFamily),
                formatButtonTextStyle:
                    TextStyle(fontFamily: Constans.kFontFamily),
                headerMargin: EdgeInsets.only(bottom: 8)),
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: controller.selectedDate,
            selectedDayPredicate: (day) {
              return isSameDay(controller.selectedDate, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              controller.selectedDate = selectedDay;
              controller.update();
            },
            calendarStyle: const CalendarStyle(
              todayDecoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.transparent),
              defaultTextStyle: TextStyle(color: Colors.white),
              weekendTextStyle: TextStyle(color: Colors.white),
              selectedTextStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          );
        });
  }
}
