import 'package:get/get.dart';

class AddTaskController extends GetxController {
  int selectedPriority = 1;
  DateTime selectedDate = DateTime.now();
  int selectedHourIndex = 1;
  int selectedMinuteIndex = 0;
  String taskTitle = '';
  String taskDescription = '';
  int selectedColorIndex = 0;
  bool setTime = false;
  bool setDate = false;
  bool setPriority = false;

 
}
