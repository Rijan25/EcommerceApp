import 'package:ecommerce/core/extensions/int_extensions.dart';
import 'package:ecommerce/core/extensions/textstyle_extensions.dart';
import 'package:ecommerce/core/services/get.dart';
import 'package:ecommerce/modules/presentations/modules/product/Widget/image_carausel_slider.dart';
import 'package:ecommerce/modules/presentations/modules/product/providers/provider_future_provider.dart';
import 'package:ecommerce/modules/presentations/modules/product/widget/product_description.dart';
import 'package:ecommerce/modules/presentations/widgets/buttons/app_buttons.dart';
import 'package:ecommerce/modules/presentations/widgets/error_handler/error_button.dart';
import 'package:ecommerce/modules/presentations/widgets/text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/expandable_tile.dart';
import '../widget/floating_action_button.dart';

class ProductDetail extends ConsumerWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchProduct = ref.watch(productProvider);

    return Scaffold(
      appBar:
          AppBar(title: AppText('ORIFLAME SWEDEN', style: Get.bodyMedium.px18)),
      floatingActionButton: const FloatingActionHelperButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10).r,
        child: SizedBox(
          height: 40.h,
          child: AppButton(
              onTap: () async {
                await Future.delayed(2.seconds);
                Get.snackbar("Added To Card Successfully", color: Colors.teal);
              },
              text: "Add To Cart"),
        ),
      ),
      body: fetchProduct.when(
        error: (error, stackTrace) {
          return ErrorButton(provider: productProvider);
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
        data: (product) {
          return ListView(
            padding: const EdgeInsets.all(10).r,
            shrinkWrap: true,
            children: [
              ImageCarauselSlider(product.images),
              ProductDescription(product: product),
              ExpandableTile(
                  title: 'Product Description',
                  description: product.description),
              ExpandableTile(
                  title: 'Product Ingredient', description: product.ingredient),
              ExpandableTile(
                  title: 'How To Use?', description: product.howToUse),
            ],
          );
        },
      ),
    );
  }
}
