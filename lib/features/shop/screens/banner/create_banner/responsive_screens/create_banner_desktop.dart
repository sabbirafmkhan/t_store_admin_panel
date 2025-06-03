import 'package:flutter/material.dart';
import 'package:t_store_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:t_store_admin_panel/features/shop/screens/banner/create_banner/widgets/create_banner_form.dart';
import 'package:t_store_admin_panel/routes/routes.dart';
import 'package:t_store_admin_panel/utils/constants/sizes.dart';

class CreateBannerDesktopScreen extends StatelessWidget {
  const CreateBannerDesktopScreen({super.key});

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
                heading: 'Create Banner',
                breadcrumbItems: [
                  TRoutes.banners,
                  'Create Banner',
                ],
              ),
              SizedBox(width: TSizes.spaceBtwSections),

              //Form
              CreateBannerForm(),
            ],
          ),
        ),
      ),
    );
  }
}
