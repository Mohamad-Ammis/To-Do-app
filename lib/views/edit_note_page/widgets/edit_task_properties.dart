import 'package:flutter/material.dart';
import 'package:to_do_app/utils/app_images.dart';
import 'package:to_do_app/views/add_task_page/widgets/priority_dialog.dart';
import 'package:to_do_app/widgets/custom_date_picker/custom_date_picker.dart';
import 'package:to_do_app/widgets/custom_timer_picker/time_picker.dart';

class EditTaskProperties extends StatelessWidget {
  const EditTaskProperties({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CustomDatePicker(
                    isEditingPage: true,
                  );
                },
              );
            },
            icon: Icon(
              Icons.calendar_month_outlined,
              color: Theme.of(context).colorScheme.secondary.withOpacity(.5),
              size: 30,
            )),
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  contentPadding: EdgeInsets.zero,
                  content: const SizedBox(
                    width: 300,
                    height: 450,
                    child: CustomTimerPicker(
                      isEditingPage: true,
                    ),
                  ),
                );
              },
            );
          },
          icon: Icon(
            Icons.timer_sharp,
            color: Theme.of(context).colorScheme.secondary.withOpacity(.5),
            size: 30,
          ),
        ),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return const PriorityDialog(
                  isEditingPage: true,
                );
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(Assets.imagesFlag),
          ),
        )
      ],
    );
  }
}
