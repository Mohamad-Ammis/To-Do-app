import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTaskController extends GetxController {
  int selectedPriority = -1;
  DateTime selectedDate = DateTime.now();
  int selectedHourIndex = 1;
  int selectedMinuteIndex = 0;
  bool setTime = false;
  bool setDate = false;
  bool setPriority = false;

  late final GlobalKey<FormState> formKey;
  late AutovalidateMode autovalidateMode;
  String taskTitle = '';
  String taskDescription = '';
  int selectedColorIndex=0;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    formKey = GlobalKey();
    autovalidateMode = AutovalidateMode.disabled;
  }
}
