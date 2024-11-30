import 'package:ecommerce/core/configs/app_colors.dart';
import 'package:ecommerce/core/extensions/color_extensions.dart';
import 'package:ecommerce/core/extensions/textstyle_extensions.dart';
import 'package:ecommerce/core/services/get.dart';
import 'package:ecommerce/modules/presentations/widgets/text/app_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ExpandableTile extends StatelessWidget {
  const ExpandableTile(
      {super.key, required this.title, required this.description});
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final isExpanded = ValueNotifier(false);

    return Padding(
      padding: const EdgeInsets.all(4.0).r,
      child: GestureDetector(
        onTap: () {
          isExpanded.value = !isExpanded.value;
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: AppColors.primary.o3),
          child: ValueListenableBuilder(
            valueListenable: isExpanded,
            builder: (BuildContext context, dynamic value, Widget? child) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16).r,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(value ? Icons.arrow_drop_down : Icons.arrow_right),
                        AppText(title, fontSize: 18)
                      ],
                    ),
                    if (value)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 12)
                            .r,
                        child: HtmlWidget(description,
                            textStyle: Get.bodyMedium.w400),
                      )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
