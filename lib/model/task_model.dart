import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject{
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String endDate;
  @HiveField(3)
  final String endTime;
  @HiveField(4)
  final int priority;
  @HiveField(5)
  final int color;

  TaskModel({required this.title, required this.description, required this.endDate, required this.endTime, required this.priority, required this.color});
}
