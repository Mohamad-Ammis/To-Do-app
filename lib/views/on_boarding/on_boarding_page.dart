import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/main.dart';
import 'package:to_do_app/utils/app_images.dart';
import 'package:to_do_app/views/home_page/home_page.dart';
import 'package:to_do_app/widgets/custom_text_field.dart';
import 'package:to_do_app/widgets/custom_timer_picker/time_picker.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late GlobalKey<FormState> formKey;
  late AutovalidateMode autovalidateMode;
  String userName = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    formKey = GlobalKey();
    autovalidateMode = AutovalidateMode.disabled;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Assets.imagesOnBoarding,
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                const Color.fromARGB(80, 0, 0, 0), BlendMode.colorBurn),
          ),
        ),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                textAlign: TextAlign.center,
                'Turn chaos into clarity. Plan, prioritize, and track your tasks with our efficient to-do list app',
                style: TextStyle(
                    fontFamily: Constans.kFontFamily,
                    color: Colors.white.withOpacity(.8),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                  onChanged: (p0) {
                    userName = p0;
                  },
                  maxLines: 1,
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Your Name..',
                  hintStyle: TextStyle(color: Colors.black.withOpacity(.3)),
                  textStyle: TextStyle(color: Colors.black),
                  cursorColor: Constans.kDarkBackgroundColor,
                  filled: true,
                  fillColor: const Color.fromARGB(255, 192, 188, 188),
                  focusedBorderColor: Colors.black,
                  enabledBorderColor: Colors.red),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    debugPrint(userName);
                    userInfo.setString('user_name', userName);
                    Get.offAll(() => HomePage());
                  } else {
                    autovalidateMode = AutovalidateMode.onUserInteraction;
                    setState(() {});
                  }
                },
                title: 'Get started',
                margin: 0,
                color: const Color.fromARGB(255, 30, 133, 218),
                titleColor: Colors.white,
                height: 56,
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
