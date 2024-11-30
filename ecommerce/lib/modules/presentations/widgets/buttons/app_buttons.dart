import 'package:ecommerce/modules/presentations/widgets/progressindicators/app_progress_indicators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/textstyle_extensions.dart';
import '../../../../core/services/get.dart';
import '../text/app_text.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.buttonColor,
      this.radius = 10,
      this.textColor,
      this.height,
      this.width});
  final String text;
  final dynamic Function() onTap;
  final Color? buttonColor, textColor;
  final double radius;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    final border = BorderRadius.circular(radius).r;
    final isLoadingNotifier = ValueNotifier(false);
    return SizedBox(
      height: height?.h,
      width: width?.w,
      child: PlatformElevatedButton(
          onPressed: () async {
            isLoadingNotifier.value = true;
            await onTap.call();
            isLoadingNotifier.value = false;
          },
          color: buttonColor,
          material: (context, platform) => MaterialElevatedButtonData(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: buttonColor,
                  shape: RoundedRectangleBorder(borderRadius: border.r))),
          cupertino: (context, platform) => CupertinoElevatedButtonData(
              padding: EdgeInsets.zero,
              pressedOpacity: 0.7,
              originalStyle: true,
              borderRadius: border.r),
          child: ValueListenableBuilder(
              valueListenable: isLoadingNotifier,
              builder: (context, value, child) => value
                  ? AppProgressIndicator(color: Get.scaffoldBackgroundColor)
                  : AppText(text, style: Get.bodyMedium.white, maxLines: 1))),
    );
  }
}
