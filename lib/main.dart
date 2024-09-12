import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/controllers/theme_controller.dart';
import 'package:to_do_app/model/category_model.dart';
import 'package:to_do_app/model/task_model.dart';
import 'package:to_do_app/services/local_notification_service.dart';
import 'package:to_do_app/services/work_manger_service.dart';
import 'package:to_do_app/theme/dark_theme.dart';
import 'package:to_do_app/theme/light_theme.dart';
import 'package:to_do_app/views/home_page/home_page.dart';
import 'package:to_do_app/views/on_boarding/on_boarding_page.dart';

late SharedPreferences userInfo;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  userInfo = await SharedPreferences.getInstance();
  debugPrint('userInfo: ${userInfo}');
  await Future.wait(
      [LocalNotificationsService.init(), WorkMangerService().init()]);

  await Hive.initFlutter();
  Hive.registerAdapter<TaskModel>(TaskModelAdapter());
  await Hive.openBox<TaskModel>(Constans.kTasksBox);
  Hive.registerAdapter<CategoryModel>(CategoryModelAdapter());
  await Hive.openBox<CategoryModel>(Constans.kCategoryBox);
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

    final themeController = Get.put(ThemeController()); // استدعاء ThemeController
  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          theme: themeController.isDarkMode.value ? darkTheme : lightTheme,
          debugShowCheckedModeBanner: false,
          home: userInfo.getString('user_name') != null
              ? userInfo.getString('user_name') == ''
                  ? OnBoardingPage()
                  : HomePage()
              : OnBoardingPage(),
        ));
  }
}
