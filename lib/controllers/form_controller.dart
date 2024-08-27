import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController{
   late final GlobalKey<FormState> formKey;
  late AutovalidateMode autovalidateMode;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    formKey = GlobalKey();
    autovalidateMode = AutovalidateMode.disabled;
  }
}
