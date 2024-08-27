import 'package:to_do_app/model/task_model.dart';

class FilterModel {
  final String title;
  List<TaskModel>Function() onTap;

  FilterModel({required this.title, required this.onTap});
}
