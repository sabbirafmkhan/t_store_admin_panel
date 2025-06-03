import 'package:flutter/material.dart';
import 'package:t_store_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:t_store_admin_panel/features/shop/screens/brand/create_brand/widgets/create_brand_form.dart';
import 'package:t_store_admin_panel/routes/routes.dart';
import 'package:t_store_admin_panel/utils/constants/sizes.dart';

class CreateBrandTabletScreen extends StatelessWidget {
  const CreateBrandTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Breadcrumbs
              TBreadcrumbWithHeading(
                returnToPreviousScreen: true,
                heading: 'Create Brand',
                breadcrumbItems: [TRoutes.brands, 'Create Brand'],
              ),
              SizedBox(height: TSizes.spaceBtwSections),

              // Form
              CreateBrandForm(),
            ],
          ),
        ),
      ),
    );
  }
}
