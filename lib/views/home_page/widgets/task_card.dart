import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/task_controller.dart';
import 'package:to_do_app/model/task_model.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.model,
  });
  final TaskModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: MediaQuery.sizeOf(context).width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: Color(model.color),
        borderRadius: BorderRadius.circular(Constans.kCardBorderRadius),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10, color: Colors.black.withOpacity(.3))
                      ],
                      color: Constans.kWhiteElementColor,
                      borderRadius:
                          BorderRadius.circular(Constans.kCardBorderRadius)),
                  child: Text(
                    model.priority < 4
                        ? "High"
                        : model.priority < 7
                            ? "Medium"
                            : "Low",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: Constans.kFontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  model.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Constans.kWhiteElementColor,
                      fontFamily: Constans.kFontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      size: 16,
                      color: Colors.white.withOpacity(.5),
                    ),
                    Text(
                      "  ${DateFormat('MMM d, y').format(DateTime.parse(model.endDate))}",
                      style: TextStyle(
                          color: Colors.white.withOpacity(.5),
                          fontFamily: Constans.kFontFamily,
                          fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned.fill(
              child: GetBuilder<TaskController>(
                  init: TaskController(),
                  builder: (taskController) {
                    return Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          model.delete();
                          taskController.getTasks();
                          taskController.update();
                        },
                        child: Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(.3))
                              ],
                              color: Constans.kWhiteElementColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(
                                      Constans.kCardBorderRadius))),
                          child: Icon(
                            Icons.delete,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
