import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/profile_page_controller.dart';
import 'package:to_do_app/main.dart';
import 'package:to_do_app/services/image_picker_service.dart';
import 'package:to_do_app/utils/app_images.dart';

class ImageAndTasksSection extends StatefulWidget {
  const ImageAndTasksSection({super.key});

  @override
  State<ImageAndTasksSection> createState() => _ImageAndTasksSectionState();
}

class _ImageAndTasksSectionState extends State<ImageAndTasksSection> {
  final ImagePickerService _imagePickerService = ImagePickerService();
  // final controller = Get.put(ProfilePageController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<String?>(
          future: _imagePickerService.loadImage(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircleAvatar(
                  radius: 50, child: CircularProgressIndicator());
            }

            String? imagePath = snapshot.data;
            return GestureDetector(
              onTap: () async {
                String? newImagePath =
                    await _imagePickerService.pickImageFromGallery();
                if (newImagePath != null) {
                  setState(() {});
                }
              },
              child: CircleAvatar(
                backgroundColor: Constans.kWhiteElementColor,
                radius: 50,
                backgroundImage: (imagePath != null && imagePath.isNotEmpty)
                    ? FileImage(File(imagePath))
                    : AssetImage(Assets.imagesPers),
              ),
            );
          },
        ),
        const SizedBox(height: 10),
        Text(
          userInfo.getString('user_name').toString(),
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: Constans.kFontFamily,
            color: Constans.kWhiteElementColor.withOpacity(.86),
          ),
        ),
        const SizedBox(height: 20),
        GetBuilder<ProfilePageController>(
            init: ProfilePageController(),
            builder: (controller) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text('${controller.toDoTaskCount} Task left',
                        style: const TextStyle(
                          color: Constans.kWhiteElementColor,
                          fontFamily: Constans.kFontFamily,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text('${controller.completedTaskCount} Task done',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Constans.kWhiteElementColor,
                          fontFamily: Constans.kFontFamily,
                        )),
                  ),
                ],
              );
            }),
        const SizedBox(height: 30),
      ],
    );
  }
}
