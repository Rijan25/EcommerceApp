import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/services/get.dart';
import '../../../../domain/entities/product/product.dart';
import '../../../widgets/text/app_text.dart';

class PriceView extends StatelessWidget {
  const PriceView({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      AppText("Rs. ${product.price}", style: Get.bodyLarge),
      10.horizontalSpace,
      AppText(
          "Rs. ${(product.price + (product.offPercent / 100) * product.price).ceil()}",
          style: Get.bodyLarge.copyWith(
              decoration: TextDecoration.lineThrough, // Adds the strikethrough
              decorationThickness: 2.sp)),
      10.horizontalSpace,
      OutlinedButton(
          onPressed: () {}, child: AppText("${product.offPercent}% off"))
    ]);
  }
}