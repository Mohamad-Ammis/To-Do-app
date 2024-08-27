import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/add_task_controller.dart';
import 'package:to_do_app/controllers/edit_task_controller.dart';
import 'package:to_do_app/widgets/color_item.dart';

class ColorListView extends StatefulWidget {
  const ColorListView({
    super.key,
    this.selectedColorIndex, required this.isEditPage,
  });
  final int? selectedColorIndex;
  final bool isEditPage;
  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  late int currentIndex;
  final editTaskController = Get.put(EditTaskController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = widget.selectedColorIndex ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddTaskController>(
        init: AddTaskController(),
        builder: (controller) {
          return SizedBox(
            height: 56,
            child: ListView.builder(
              itemCount: Constans.kColors.length,
              itemBuilder: (contexg, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: GestureDetector(
                    onTap: () {
                      currentIndex = index;
                      controller.selectedColorIndex = index;
                      if (widget.isEditPage) {
                        editTaskController.selectedColorIndex = index;
                      }
                      debugPrint(
                          'controller.selectedColorIndex: ${controller.selectedColorIndex}');
                      setState(() {});
                    },
                    child: ColorItem(
                      color: Constans.kColors[index],
                      isActive: currentIndex == index,
                    ),
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          );
        });
  }
}
