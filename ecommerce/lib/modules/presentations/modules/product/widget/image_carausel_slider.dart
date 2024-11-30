import 'package:ecommerce/modules/presentations/widgets/images/rectangular_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageCarauselSlider extends StatelessWidget {
  const ImageCarauselSlider(this.images, {super.key});
  final List<dynamic> images;

  @override
  Widget build(BuildContext context) {
    List<dynamic> imageList = [...images];
    imageList.removeAt(0);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 250.h,
          width: double.infinity,
          decoration: BoxDecoration(border: Border.all()),
          child: CommonRectangularImage(url: images[0], fit: BoxFit.cover),
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            itemCount: imageList.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8).r,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10).r,
                child: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: CommonRectangularImage(
                        url: imageList[index].toString())),
              );
            },
          ),
        ),
      ],
    );
  }
}
