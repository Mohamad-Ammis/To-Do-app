import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  String endDate;
  @HiveField(3)
  String endTime;
  @HiveField(4)
  int priority;
  @HiveField(5)
  int color;
  @HiveField(6)
  List<String> categories;

  TaskModel(
      {required this.title,
      required this.description,
      required this.endDate,
      required this.endTime,
      required this.priority,
      required this.color,
      required this.categories});
}
