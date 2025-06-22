import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:t_store_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:t_store_admin_panel/common/widgets/data_table/table_header.dart';
import 'package:t_store_admin_panel/common/widgets/loaders/loader_animation.dart';
import 'package:t_store_admin_panel/features/shop/controller/category/category_controller.dart';
import 'package:t_store_admin_panel/features/shop/screens/category/all_categories/table/data_table.dart';
import 'package:t_store_admin_panel/routes/routes.dart';
import 'package:t_store_admin_panel/utils/constants/sizes.dart';

class CategoriesDesktopScreen extends StatelessWidget {
  const CategoriesDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Breadcrumbs:
              const TBreadcrumbWithHeading(
                heading: 'Categories',
                breadcrumbItems: ['Categories'],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Table Body:
              // show loader
              TRoundedContainer(
                child: Column(
                  children: [
                    // Table Header
                    TTableHeader(
                      buttonText: 'Create New Category',
                      onPressed: () => Get.toNamed(TRoutes.createCategory),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    // Table:
                    Obx(
                      () {
                        if (controller.isLoading.value) {
                          return const TLoaderAnimation();
                        }

                        return const CategoryTable();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
