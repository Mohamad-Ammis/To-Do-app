import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constans.dart';

class BadgetCard extends StatelessWidget {
  const BadgetCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.progress,
    required this.hard,
    required this.medalImage,
  });
  final String title;
  final String subTitle;
  final double progress;
  final double hard;
  final String medalImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(Constans.kCardBorderRadius)),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey.withOpacity(.7),
                      color: Colors.blue,
                      value: progress * hard,
                      strokeWidth: 5.0,
                    ),
                  ),
                  Text(
                    progress * hard < 1
                        ? '${((progress * 100) * hard).toStringAsFixed(1)}%'
                        : '100%',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontFamily: Constans.kFontFamily,
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      subTitle,
                      maxLines: 2,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontFamily: Constans.kFontFamily,
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(.86),
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                medalImage,
                width: 60,
              )
            ],
          ),
        ),
        if ((progress * hard) < 1.0)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.background.withOpacity(.7),
                  borderRadius:
                      BorderRadius.circular(Constans.kCardBorderRadius)),
              child: Center(
                child: Icon(Icons.lock,
                    color: Get.isDarkMode ? Colors.white : Colors.black),
              ),
            ),
          )
      ],
    );
  }
}
