import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditTaskController extends GetxController {
  int? selectedPriority;
  DateTime? selectedDate;
  int? selectedHourIndex;
  int? selectedMinuteIndex;
  String? taskTitle;
  String? taskDescription;
  int? selectedColorIndex;

  bool taskEdited = false;
  String? tempTitle;
  String? tempDescription;
}
