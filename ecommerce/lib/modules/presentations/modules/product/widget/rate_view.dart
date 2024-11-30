import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/configs/app_colors.dart';
import '../../../widgets/text/app_text.dart';

class RatingView extends StatelessWidget {
  const RatingView({super.key});

  @override
  Widget build(BuildContext context) {
    final rateNotifier = ValueNotifier(3);
    return Row(children: [
      const AppText("Rating", fontWeight: FontWeight.w400, fontSize: 18),
      15.horizontalSpace,
      SizedBox(
        height: 20.h,
        child: ValueListenableBuilder(
            valueListenable: rateNotifier,
            builder: (context, value, child) => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () => rateNotifier.value = index + 1,
                      child: Icon(
                          value >= index + 1 ? Icons.star : Icons.star_border,
                          size: 26.sp,
                          color: AppColors.orange),
                    ))),
      )
    ]);
  }
}
