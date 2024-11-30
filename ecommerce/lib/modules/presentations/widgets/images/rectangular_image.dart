import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/configs/app_colors.dart';

class CommonRectangularImage extends StatelessWidget {
  const CommonRectangularImage(
      {super.key, required this.url, this.fit = BoxFit.contain});
  final String url;
  final BoxFit fit;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(12).w),
        child: Hero(
            tag: url.toString(),
            child: CachedNetworkImage(
                imageUrl: url,
                fit: fit,
                placeholder: (context, url) => SizedBox.square(
                    dimension: 170.w,
                    ),
                errorWidget: (context, url, error) =>
                    const SizedBox.shrink())));
  }
}