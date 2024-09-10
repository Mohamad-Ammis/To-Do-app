
import 'package:flutter/material.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/utils/app_images.dart';

class OwnedBadets extends StatelessWidget {
  const OwnedBadets({
    super.key,
    required this.completedTaskCount,
  });

  final int completedTaskCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 20,
              width: 2,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Your Honors',
              style: TextStyle(
                  fontFamily: Constans.kFontFamily,
                  color: Constans.kWhiteElementColor.withOpacity(.86),
                  fontSize: 22),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            completedTaskCount >= 1000
                ? Image.asset(Assets.imagesPlace1medal, width: 70)
                : const SizedBox(),
            completedTaskCount >= 100
                ? Image.asset(Assets.imagesPlace2medal, width: 70)
                : const SizedBox(),
            completedTaskCount >= 10
                ? Image.asset(
                    Assets.imagesPlace3medal,
                    width: 70,
                  )
                : const SizedBox(),
          ],
        ),
      ],
    );
  }
}
