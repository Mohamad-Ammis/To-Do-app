import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constans.dart';

ElegantNotification showSuccesSnackBar(title, message, {context}) {
  return ElegantNotification.success(
    animationCurve: Curves.bounceInOut,
    borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(8), topRight: Radius.circular(8)),
    toastDuration: 2.seconds,
    position: Alignment.topCenter,
    animation: AnimationType.fromTop,
    title: Text(
      title,
      style: const TextStyle(fontFamily: Constans.kFontFamily),
    ),
    description:
        Text(message, style: const TextStyle(fontFamily: Constans.kFontFamily)),
  );
}

ElegantNotification showErrorSnackBar(title, message) {
  return ElegantNotification.error(
    background: Constans.kCardBackgroundColor,
    animationCurve: Curves.bounceInOut,
    borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(8), topRight: Radius.circular(8)),
    toastDuration: 3.seconds,
    position: Alignment.topCenter,
    animation: AnimationType.fromTop,
    title: Text(
      title,
      style: const TextStyle(
          fontFamily: Constans.kFontFamily, color: Constans.kWhiteElementColor),
    ),
    description: Text(message,
        style: const TextStyle(
            fontFamily: Constans.kFontFamily,
            color: Constans.kWhiteElementColor)),
  );
}

ElegantNotification showInfoSnackBar(title, message) {
  return ElegantNotification.info(
    background: Constans.kCardBackgroundColor,
    animationCurve: Curves.bounceInOut,
    borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(8), topRight: Radius.circular(8)),
    toastDuration: 2.seconds,
    position: Alignment.topCenter,
    animation: AnimationType.fromTop,
    title: Text(
      title,
      style: const TextStyle(
          fontFamily: Constans.kFontFamily, color: Constans.kWhiteElementColor),
    ),
    description: Text(message,
        style: const TextStyle(
            fontFamily: Constans.kFontFamily,
            color: Constans.kWhiteElementColor)),
  );
}
