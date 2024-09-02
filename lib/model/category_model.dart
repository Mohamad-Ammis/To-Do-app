import 'package:hive/hive.dart';

part 'category_model.g.dart';

@HiveType(typeId: 1)
class CategoryModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  int color;
  @HiveField(2)
  int icon;
  CategoryModel({required this.title, required this.color, required this.icon});
}
