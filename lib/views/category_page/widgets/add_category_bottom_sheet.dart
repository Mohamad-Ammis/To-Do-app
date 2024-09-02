import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/Models/configuration.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/category_page_controller.dart';
import 'package:to_do_app/views/category_page/widgets/category_color_listview.dart';
import 'package:to_do_app/widgets/custom_text_field.dart';
import 'package:to_do_app/widgets/custom_timer_picker/time_picker.dart';

class AddCategoryBottomSheet extends StatelessWidget {
  AddCategoryBottomSheet({
    super.key,
  });

  final CategoryPageController controller = Get.put(CategoryPageController());

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        showDragHandle: true,
        enableDrag: false,
        clipBehavior: Clip.hardEdge,
        backgroundColor: Constans.kDarkBackgroundColor,
        onClosing: () {},
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextField(
                      onChanged: (p0) {
                        controller.title = p0;
                      },
                      hintText: "Enter Category Name..",
                      hintStyle: TextStyle(color: Colors.white.withOpacity(.4)),
                      textStyle: TextStyle(
                          fontFamily: Constans.kFontFamily,
                          color: Constans.kWhiteElementColor),
                      cursorColor: Constans.kWhiteElementColor,
                      filled: true,
                      fillColor: Constans.kCardBackgroundColor,
                      focusedBorderColor: Colors.transparent,
                      enabledBorderColor: Colors.transparent),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Select category backgound color",
                    style: TextStyle(
                        fontFamily: Constans.kFontFamily,
                        color: Constans.kWhiteElementColor.withOpacity(.8)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CategoryColorListview(isEditPage: false),
                  SizedBox(
                    height: 15,
                  ),
                  GetBuilder<CategoryPageController>(
                      init: CategoryPageController(),
                      builder: (controller) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Select category Icon",
                              style: TextStyle(
                                  fontFamily: Constans.kFontFamily,
                                  color: Constans.kWhiteElementColor
                                      .withOpacity(.8)),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Constans.kCardBackgroundColor,
                                  shape: BoxShape.circle),
                              child: IconButton(
                                  onPressed: () async {
                                    IconPickerIcon? icon = await showIconPicker(
                                        context,
                                        configuration:
                                            SinglePickerConfiguration(
                                                iconPickerShape:
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(32)),
                                                backgroundColor: Constans
                                                    .kCardBackgroundColor,
                                                iconColor:
                                                    Constans.kWhiteElementColor,
                                                closeChild: Text(
                                                  "Close",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          Constans.kFontFamily,
                                                      color: Constans
                                                          .kWhiteElementColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )));
                                    if (icon != null) {
                                      controller.selectedIcon = icon.data;
                                      controller.update();
                                    }
                                  },
                                  icon: Icon(
                                    controller.selectedIcon,
                                    color: Constans.kWhiteElementColor,
                                  )),
                            )
                          ],
                        );
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    onTap: () {
                      controller.addCategory();
                      controller.getCategories();
                      Get.back();
                      controller.update();
                    },
                    height: 60,
                    margin: 0,
                    title: 'Add Category',
                    titleSize: 20,
                    titleColor: Colors.black,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          );
        });
  }
}
