import 'package:flutter/material.dart';
import 'package:to_do_app/constans.dart';

class CustomProfileListTile extends StatelessWidget {
  const CustomProfileListTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap, this.trailing,
  });
  final IconData icon;
  final String title;
  final void Function()? onTap;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(
          icon,
          color: Constans.kWhiteElementColor.withOpacity(.6),
          size: 20,
        ),
        title: Text(title,
            style: const TextStyle(
                color: Constans.kWhiteElementColor,
                fontFamily: Constans.kFontFamily)),
        trailing:trailing?? Icon(
          Icons.arrow_forward_ios,
          color: Constans.kWhiteElementColor.withOpacity(.6),
        ),
        onTap: onTap);
  }
}
