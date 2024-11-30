import 'package:ecommerce/core/services/get.dart';
import 'package:ecommerce/modules/presentations/widgets/buttons/icon_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloatingActionHelperButton extends StatelessWidget {
  const FloatingActionHelperButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30.r,
      child: AppIconButton(Icons.message,
          onTap: () => Get.banner("Thank You For Contacting Us!!")),
    );
  }
}
