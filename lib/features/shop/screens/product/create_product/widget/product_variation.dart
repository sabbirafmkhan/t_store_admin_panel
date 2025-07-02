import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:t_store_admin_panel/common/widgets/images/image_uploader.dart';
import 'package:t_store_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:t_store_admin_panel/features/shop/controller/product/create_product_controller.dart';
import 'package:t_store_admin_panel/features/shop/controller/product/product_images_controller.dart';
import 'package:t_store_admin_panel/features/shop/controller/product/product_variations_controller.dart';
import 'package:t_store_admin_panel/features/shop/models/product_variation_model.dart';
import 'package:t_store_admin_panel/utils/constants/colors.dart';
import 'package:t_store_admin_panel/utils/constants/enums.dart';
import 'package:t_store_admin_panel/utils/constants/image_strings.dart';
import 'package:t_store_admin_panel/utils/constants/sizes.dart';

class ProductVariation extends StatelessWidget {
  const ProductVariation({super.key});

  @override
  Widget build(BuildContext context) {
    final variationController = Get.put(ProductVariationController());

    return Obx(
      () => CreateProductController.instance.productType.value ==
              ProductType.variable
          ? TRoundedContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Variations Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Product Variations',
                          style: Theme.of(context).textTheme.headlineSmall),
                      TextButton(
                        onPressed: () =>
                            variationController.removeVariations(context),
                        child: const Text('Remove Variations'),
                      ),
                    ],
                  ),

                  const SizedBox(height: TSizes.spaceBtwItems),

                  // Variations List
                  if (variationController.productVariations.isNotEmpty)
                    ListView.separated(
                      itemCount: variationController.productVariations.length,
                      shrinkWrap: true,
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: TSizes.spaceBtwItems),
                      itemBuilder: (_, index) {
                        final variation =
                            variationController.productVariations[index];
                        return _buildVariationTile(
                            context, index, variation, variationController);
                      },
                    )
                  else
                    _buildNoVariationsMessage(),
                ],
              ),
            )
          : const SizedBox.shrink(),
    );
  }

  // Helper method to build a variation tile
  Widget _buildVariationTile(
    BuildContext context,
    int index,
    ProductVariationModel variation,
    ProductVariationController variationController,
  ) {
    return ExpansionTile(
      backgroundColor: TColors.lightGrey,
      collapsedBackgroundColor: TColors.lightGrey,
      childrenPadding: const EdgeInsets.all(TSizes.md),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
      ),
      title: Text(
        variation.attributeValues.entries
            .map((entry) => '${entry.key}: ${entry.value}')
            .join(', '),
      ),
      children: [
        // Upload Variation Image
        Obx(
          () => TImageUploader(
            right: 0,
            left: null,
            imageType: variation.image.value.isNotEmpty
                ? ImageType.network
                : ImageType.asset,
            image: variation.image.value.isNotEmpty
                ? variation.image.value
                : TImages.defaultImage,
            onIconButtonPressed: () => ProductImagesController.instance
                .selectVariationImage(variation),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),

        // Variation Stock, and Pricing
        Row(
          children: [
            Expanded(
              child: TextFormField(
                onChanged: (value) => variation.stock = int.parse(value),
                decoration: const InputDecoration(
                  labelText: 'Stock',
                  hintText: 'Add Stock, only numbers are allowed',
                ),
                controller: variationController.stockControllerLists[index]
                    [variation],
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            Expanded(
              child: TextFormField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$')),
                ], // <TextInputFormatter>[]
                onChanged: (value) => variation.price = double.parse(value),
                decoration: const InputDecoration(
                  labelText: 'Price',
                  hintText: 'Price with up-to 2 decimals',
                ),
                controller: variationController.priceControllerLists[index]
                    [variation],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            Expanded(
              child: TextFormField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$')),
                ], // <TextInputFormatter>[]
                onChanged: (value) => variation.salePrice = double.parse(value),
                controller: variationController.salePriceControllerLists[index]
                    [variation],
                decoration: const InputDecoration(
                  labelText: 'Discounted Price',
                  hintText: 'Price with up-to 2 decimals',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),

        // Variation Description
        TextFormField(
          onChanged: (value) => variation.description = value,
          controller: variationController.descriptionControllerLists[index]
              [variation],
          decoration: const InputDecoration(
              labelText: 'Description',
              hintText: 'Add description of this variation...'),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }

  // Helper method to build message when there are no variations
  Widget _buildNoVariationsMessage() {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TRoundedImage(
              width: 200,
              height: 200,
              imageType: ImageType.asset,
              image: TImages.defaultVariationImageIcon,
            ),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems),
        Text('There are no Variations added for this product'),
      ],
    );
  }
}
