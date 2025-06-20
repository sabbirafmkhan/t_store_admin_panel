import 'package:flutter/material.dart';
import 'package:t_store_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:t_store_admin_panel/features/personalization/screens/settings/widgets/form.dart';
import 'package:t_store_admin_panel/features/personalization/screens/settings/widgets/image_meta.dart';
import 'package:t_store_admin_panel/utils/constants/sizes.dart';

class SettingsMobileScreen extends StatelessWidget {
  const SettingsMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Breadcrumbs
            TBreadcrumbWithHeading(
              heading: 'Profile',
              breadcrumbItems: ['Profile'],
            ),
            SizedBox(height: TSizes.spaceBtwSections),

            // Body
            Column(
              children: [
                // Profile Pic and Meta
                ImageAndMeta(),
                SizedBox(width: TSizes.spaceBtwSections),

                // Form
                SettingsForm(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
