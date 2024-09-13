import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'package:flutter_native_splash/flutter_native_splash.dart';
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
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  userInfo = await SharedPreferences.getInstance();
  await Future.wait(
      [LocalNotificationsService.init(), WorkMangerService().init()]);

  await Hive.initFlutter();
  Hive.registerAdapter<TaskModel>(TaskModelAdapter());
  await Hive.openBox<TaskModel>(Constans.kTasksBox);
  Hive.registerAdapter<CategoryModel>(CategoryModelAdapter());
  await Hive.openBox<CategoryModel>(Constans.kCategoryBox);

  runApp(MyApp());
  FlutterNativeSplash.remove(); 
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDarkMode = themeController.isDarkMode.value;
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, //app bar
        systemNavigationBarColor: isDarkMode
            ? Constans.kDarkBackgroundColor
            : lightTheme.colorScheme.surface,
        systemNavigationBarIconBrightness:
            isDarkMode ? Brightness.light : Brightness.dark,
        statusBarIconBrightness:
            isDarkMode ? Brightness.light : Brightness.dark,
      ));

      return GetMaterialApp(
        theme: isDarkMode ? darkTheme : lightTheme,
        debugShowCheckedModeBanner: false,
        home: userInfo.getString('user_name') == null &&
                userInfo.getString('user_name')!.isNotEmpty
            ? const HomePage()
            : const OnBoardingPage(), 
      );
    });
  }
}
