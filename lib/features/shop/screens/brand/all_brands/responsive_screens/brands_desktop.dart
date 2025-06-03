import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:t_store_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:t_store_admin_panel/common/widgets/data_table/table_header.dart';
import 'package:t_store_admin_panel/features/shop/screens/brand/all_brands/table/data_table.dart';
import 'package:t_store_admin_panel/routes/routes.dart';
import 'package:t_store_admin_panel/utils/constants/sizes.dart';

class BrandsDesktopScreen extends StatelessWidget {
  const BrandsDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Breadcrumbs:
              const TBreadcrumbWithHeading(
                heading: 'Brands',
                breadcrumbItems: ['Brands'],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Table Body:
              // show loader
              TRoundedContainer(
                child: Column(
                  children: [
                    // Table Header
                    TTableHeader(
                      buttonText: 'Create New Brand',
                      onPressed: () => Get.toNamed(TRoutes.createBrand),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    // Table:
                    const BrandTable(),
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
