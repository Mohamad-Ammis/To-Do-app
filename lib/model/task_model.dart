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
  @HiveField(7)
  bool isCompleted;

  TaskModel(
      {required this.title,
      required this.description,
      required this.endDate,
      required this.endTime,
      required this.priority,
      required this.color,
      this.isCompleted = false,
      required this.categories});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final TaskModel otherTask = other as TaskModel;
    return title == otherTask.title &&
        description == otherTask.description &&
        endDate == otherTask.endDate &&
        endTime == otherTask.endTime &&
        priority == otherTask.priority &&
        color == otherTask.color &&
        isCompleted == otherTask.isCompleted &&
        categories.length == otherTask.categories.length &&
        categories.every((cat) => otherTask.categories.contains(cat));
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        endDate.hashCode ^
        endTime.hashCode ^
        priority.hashCode ^
        color.hashCode ^
        isCompleted.hashCode ^
        categories.hashCode;
  }
}
