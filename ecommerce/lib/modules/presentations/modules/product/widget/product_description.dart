import 'package:ecommerce/core/extensions/textstyle_extensions.dart';
import 'package:ecommerce/core/services/get.dart';
import 'package:ecommerce/modules/domain/entities/product/product.dart';
import 'package:ecommerce/modules/presentations/modules/product/widget/color_view.dart';
import 'package:ecommerce/modules/presentations/modules/product/widget/counter_widget.dart';
import 'package:ecommerce/modules/presentations/modules/product/widget/price_view.dart';
import 'package:ecommerce/modules/presentations/widgets/text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/buttons/app_icon_text_button.dart';
import 'rate_view.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          AppText(product.brand.name),
          const Spacer(),
          Icon(Icons.favorite_outline, size: 28.sp),
          10.horizontalSpace,
          const AppIconTextButton(icon: Icons.share, title: "Share")
        ]),
        AppText(product.title, style: Get.bodySmall.w400.px18),
        const RatingView(),
        PriceView(product: product),
        ColorView(product.colorAttributes),
        AppText("Select Quantity"),
        CounterButton()
      ],
    );
  }
}
