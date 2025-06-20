import 'package:flutter/material.dart';
import 'package:t_store_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:t_store_admin_panel/features/personalization/screens/settings/widgets/form.dart';
import 'package:t_store_admin_panel/features/personalization/screens/settings/widgets/image_meta.dart';
import 'package:t_store_admin_panel/utils/constants/sizes.dart';

class SettingsDesktopScreen extends StatelessWidget {
  const SettingsDesktopScreen({super.key});

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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Pic and Meta
                Expanded(child: ImageAndMeta()),
                SizedBox(width: TSizes.spaceBtwSections),

                // Form
                Expanded(
                  flex: 2,
                  child: SettingsForm(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
