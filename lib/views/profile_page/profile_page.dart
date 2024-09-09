import 'dart:io';
import 'package:flutter/material.dart';
import 'package:to_do_app/constans.dart';
import 'package:to_do_app/services/image_picker_service.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ImagePickerService _imagePickerService = ImagePickerService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black, // خلفية سوداء
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // الصورة الشخصية (الافاتار)
              FutureBuilder<String?>(
                future: _imagePickerService.loadImage(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircleAvatar(
                        radius: 50,
                        child:
                            CircularProgressIndicator()); // مؤشر تحميل أثناء انتظار الصورة
                  }

                  String? imagePath = snapshot.data;
                  return GestureDetector(
                    onTap: () async {
                      String? newImagePath =
                          await _imagePickerService.pickImageFromGallery();
                      if (newImagePath != null) {
                        setState(() {}); // تحديث واجهة المستخدم بعد حفظ الصورة
                      }
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: (imagePath != null &&
                              imagePath.isNotEmpty)
                          ? FileImage(File(imagePath))
                          : NetworkImage('https://your-profile-image-url.com')
                              as ImageProvider, // الصورة المخزنة أو الافتراضية
                    ),
                  );
                },
              ),
              SizedBox(height: 10),
              // اسم المستخدم
              Text(
                'Mohamad Ammis',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: Constans.kFontFamily,
                  color: Constans.kWhiteElementColor.withOpacity(.86),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // المهام المتبقية
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text('10 Task left',
                        style: TextStyle(
                          color: Constans.kWhiteElementColor,
                          fontFamily: Constans.kFontFamily,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text('5 Task done',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Constans.kWhiteElementColor,
                          fontFamily: Constans.kFontFamily,
                        )),
                  ),
                ],
              ),
              SizedBox(height: 30),
              // إعدادات التطبيق
              CustomProfileListTile(
                icon: Icons.settings,
                title: 'App Settings',
              ),
              Divider(
                color: Colors.grey,
                thickness: 0.5,
                indent: 20,
                endIndent: 20,
              ),
              CustomProfileListTile(
                icon: Icons.info,
                title: 'About US',
              ),
              CustomProfileListTile(
                icon: Icons.question_answer,
                title: 'FAQ',
              ),
              CustomProfileListTile(
                icon: Icons.support_agent,
                title: 'Support US',
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title: Text('Log out', style: TextStyle(color: Colors.red)),
                onTap: () {
                  // تسجيل الخروج
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomProfileListTile extends StatelessWidget {
  const CustomProfileListTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });
  final IconData icon;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(
          icon,
          color: Constans.kWhiteElementColor.withOpacity(.6),
        ),
        title: Text(title,
            style: TextStyle(
                color: Constans.kWhiteElementColor,
                fontFamily: Constans.kFontFamily)),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Constans.kWhiteElementColor.withOpacity(.6),
        ),
        onTap: onTap);
  }
}
