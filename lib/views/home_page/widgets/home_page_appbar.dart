import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/home_page.controller.dart';
import 'package:to_do_app/services/image_picker_service.dart';
import 'package:to_do_app/utils/app_images.dart';

class HomePageAppbar extends StatefulWidget implements PreferredSizeWidget {
  const HomePageAppbar({
    super.key,
  });

  @override
  State<HomePageAppbar> createState() => _HomePageAppbarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 58);
}

class _HomePageAppbarState extends State<HomePageAppbar> {
  final ImagePickerService _imagePickerService = ImagePickerService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: AppBar(
          scrolledUnderElevation: 0,
          leading: GetBuilder<HomePageController>(
              init: HomePageController(),
              builder: (controller) {
                return IconButton(
                    onPressed: () {
                      controller.showFilter = !controller.showFilter;
                      controller.update();
                    },
                    icon: Icon(
                      controller.showFilter
                          ? Icons.filter_list
                          : Icons.filter_list_off,
                      color: Theme.of(context).colorScheme.secondary,
                    ));
              }),
          title: Text(
            'Home',
            style: TextStyle(
              fontFamily: Constans.kFontFamily,
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            FutureBuilder<String?>(
              future: _imagePickerService.loadImage(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircleAvatar(
                      radius: 30, child: CircularProgressIndicator());
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
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    radius: 30,
                    backgroundImage: (imagePath != null && imagePath.isNotEmpty)
                        ? FileImage(File(imagePath))
                        : AssetImage(Assets.imagesPers),
                  ),
                );
              },
            ),
            SizedBox(
              width: 10,
            )
          ],
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
      ),
    );
  }
}
