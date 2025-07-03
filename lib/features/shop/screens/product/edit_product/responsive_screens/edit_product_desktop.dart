import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:t_store_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:t_store_admin_panel/features/shop/controller/product/product_images_controller.dart';
import 'package:t_store_admin_panel/features/shop/screens/product/create_product/widget/product_additional_images.dart';
import 'package:t_store_admin_panel/features/shop/screens/product/create_product/widget/product_attributes.dart';
import 'package:t_store_admin_panel/features/shop/screens/product/create_product/widget/product_brand.dart';
import 'package:t_store_admin_panel/features/shop/screens/product/create_product/widget/product_categories.dart';
import 'package:t_store_admin_panel/features/shop/screens/product/create_product/widget/product_stock_and_pricing.dart';
import 'package:t_store_admin_panel/features/shop/screens/product/create_product/widget/product_thumbnail_image.dart';
import 'package:t_store_admin_panel/features/shop/screens/product/create_product/widget/product_title_and_description.dart';
import 'package:t_store_admin_panel/features/shop/screens/product/create_product/widget/product_type_widget.dart';
import 'package:t_store_admin_panel/features/shop/screens/product/create_product/widget/product_variation.dart';
import 'package:t_store_admin_panel/features/shop/screens/product/create_product/widget/product_visibility_widget.dart';
import 'package:t_store_admin_panel/features/shop/screens/product/edit_product/widget/product_bottom_navigation_buttons.dart';
import 'package:t_store_admin_panel/routes/routes.dart';
import 'package:t_store_admin_panel/utils/constants/sizes.dart';
import 'package:t_store_admin_panel/utils/device/device_utility.dart';

import 'package:t_store_admin_panel/features/shop/models/product_model.dart';

class EditProductDesktopScreen extends StatelessWidget {
  const EditProductDesktopScreen({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductImagesController());
    return Scaffold(
      bottomNavigationBar: EditProductBottomNavigationButtons(product: product),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Breadcrumbs:
              const TBreadcrumbWithHeading(
                heading: 'Edit Product',
                returnToPreviousScreen: true,
                breadcrumbItems: [TRoutes.products, 'Edit Product'],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Create Product:
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: TDeviceUtils.isTabletScreen(context) ? 2 : 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // basic information
                        const ProductTitleAndDescription(),
                        const SizedBox(height: TSizes.spaceBtwSections),

                        // Stock & pricing:
                        TRoundedContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Heading
                              Text(
                                'Stock & Pricing',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              const SizedBox(height: TSizes.spaceBtwItems),

                              // Product type
                              const ProductTypeWidget(),
                              const SizedBox(
                                  height: TSizes.spaceBtwInputFields),

                              // Stock:
                              const ProductStockAndPricing(),
                              const SizedBox(height: TSizes.spaceBtwSections),

                              // Attributes
                              const ProductAttributes(),
                              const SizedBox(height: TSizes.spaceBtwSections),
                            ],
                          ),
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections),

                        // variation
                        const ProductVariation(),
                      ],
                    ),
                  ),
                  const SizedBox(width: TSizes.defaultSpace),

                  // Sidebar:
                  Expanded(
                    child: Column(
                      children: [
                        // Product Thumbnail:
                        const ProductThumbnailImage(),
                        const SizedBox(height: TSizes.spaceBtwSections),

                        // Product Images:
                        TRoundedContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'All Product Images',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              const SizedBox(height: TSizes.spaceBtwItems),
                              ProductAdditionalImages(
                                additionalProductImagesURLs:
                                    RxList<String>.empty(),
                                onTapToAddImages: () {},
                                onTapToRemoveImage: (index) {},
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections),

                        // Product Brand:
                        const ProductBrand(),
                        const SizedBox(height: TSizes.spaceBtwSections),

                        // Product Categories:
                        const ProductCategories(),
                        const SizedBox(height: TSizes.spaceBtwSections),

                        // Product Visibility:
                        const ProductVisibilityWidget(),
                        const SizedBox(height: TSizes.spaceBtwSections),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
