import 'package:ecommerce/core/extensions/string_extensions.dart';
import 'package:ecommerce/core/extensions/textstyle_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/services/get.dart';
import '../../../../domain/entities/product/color_attributes.dart';
import '../../../widgets/text/app_text.dart';
import '../providers/color_notifier.dart';

class ColorView extends ConsumerWidget {
  const ColorView(this.colorAttributes, {super.key});
  final List<ColorAttributes> colorAttributes;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedColor =
        ref.watch(colorSelectionProvider) ?? colorAttributes[0];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      AppText("Color (${selectedColor.name})", style: Get.bodySmall.px18),
      SizedBox(
          height: 50.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: colorAttributes.length,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      ref.read(colorSelectionProvider.notifier).state =
                          colorAttributes[index];
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2).r,
                      child: CircleAvatar(
                          backgroundColor: Get.primaryColor,
                          child: Padding(
                            padding: selectedColor == colorAttributes[index]
                                ? const EdgeInsets.all(2.0).r
                                : EdgeInsets.zero,
                            child: CircleAvatar(
                              backgroundColor:
                                  colorAttributes[index].colorValue.color,
                            ),
                          )),
                    ),
                  )))
    ]);
  }
}
