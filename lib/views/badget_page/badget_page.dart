import 'package:flutter/material.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/utils/app_images.dart';
import 'package:to_do_app/views/badget_page/widgets/badget_card.dart';
import 'package:to_do_app/views/badget_page/widgets/owned_badgets.dart';

class BadgetsPage extends StatelessWidget {
  const BadgetsPage({super.key, required this.completedTaskCount});
  final int completedTaskCount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        foregroundColor:
            Theme.of(context).colorScheme.secondary.withOpacity(.86),
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text(
          'Badgets',
          style: TextStyle(
              fontFamily: Constans.kFontFamily, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (completedTaskCount >= 10)
              OwnedBadets(completedTaskCount: completedTaskCount),
            BadgetCard(
                title: 'be Productive',
                subTitle: 'complete 10 task to get this badgets',
                progress: completedTaskCount.toDouble(),
                hard: 0.1,
                medalImage: Assets.imagesPlace3medal),
            BadgetCard(
                title: 'Productive Hero',
                subTitle: 'complete 100 task to get this badgets',
                progress: completedTaskCount.toDouble(),
                hard: 0.01,
                medalImage: Assets.imagesPlace2medal),
            BadgetCard(
                title: 'Productive Boss',
                subTitle: 'complete 1000 task to get this badgets',
                progress: completedTaskCount.toDouble(),
                hard: 0.001,
                medalImage: Assets.imagesPlace1medal),
          ],
        ),
      ),
    );
  }
}
