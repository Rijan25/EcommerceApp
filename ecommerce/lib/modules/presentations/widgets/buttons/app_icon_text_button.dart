import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../text/app_text.dart';

class AppIconTextButton extends StatelessWidget {
  const AppIconTextButton(
      {super.key, this.onTap, required this.icon, required this.title});

  final void Function()? onTap;
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey.shade100,
            borderRadius: BorderRadius.circular(5).r),
        child: Padding(
          padding: const EdgeInsets.all(8.0).r,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [Icon(icon), AppText(title)],
          ),
        ),
      ),
    );
  }
}