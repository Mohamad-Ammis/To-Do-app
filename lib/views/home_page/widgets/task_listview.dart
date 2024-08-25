
import 'package:flutter/material.dart';
import 'package:to_do_app/views/home_page/widgets/task_card.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return TaskCard();
        });
  }
}
