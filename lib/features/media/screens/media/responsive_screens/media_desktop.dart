import 'package:flutter/material.dart';
import 'package:t_store_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:t_store_admin_panel/utils/constants/sizes.dart';

class MediaDesktopScreen extends StatelessWidget {
  const MediaDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header:
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Breadcrumbs:
                  TBreadcrumbWithHeading(
                    heading: 'Media',
                    breadcrumbItems: [],
                    returnToPreviousScreen: true,
                  ),
                ],
              ),
              SizedBox(height: TSizes.spaceBtwSections),

              /// Upload Area:

              /// Media:
            ],
          ),
        ),
      ),
    );
  }
}
