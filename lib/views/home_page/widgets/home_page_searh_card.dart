import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/task_controller.dart';

class HomePageSearchBar extends StatelessWidget {
  HomePageSearchBar({
    super.key,
  });
  final controller = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(Constans.kCardBorderRadius)),
      width: MediaQuery.sizeOf(context).width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.secondary,
          ),
          Expanded(
              child: TextField(
            style: TextStyle(
                fontFamily: Constans.kFontFamily,
                color: Theme.of(context).colorScheme.secondary),
            onChanged: (value) {
              controller.displayTasksList = controller.searchTasks(value);
              controller.update();
            },
            decoration: InputDecoration(
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                enabledBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                errorBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                disabledBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                focusedErrorBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                hintText: 'Search here .....',
                hintStyle: TextStyle(
                    color:
                        Theme.of(context).colorScheme.secondary.withOpacity(.4),
                    fontFamily: Constans.kFontFamily)),
            cursorColor: Colors.white,
          ))
        ],
      ),
    );
  }
}
