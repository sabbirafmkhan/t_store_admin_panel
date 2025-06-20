import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:t_store_admin_panel/utils/constants/sizes.dart';

class SettingsForm extends StatelessWidget {
  const SettingsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TRoundedContainer(
          padding: const EdgeInsets.symmetric(
              vertical: TSizes.lg, horizontal: TSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('App Settings',
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: TSizes.spaceBtwSections),

              // App Name
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'App Name',
                  label: Text('App Name'),
                  prefixIcon: Icon(Iconsax.user),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),

              // Tax and Shipping
              Row(
                children: [
                  // Tax
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Tax %',
                        label: Text('Tax Rate (%)'),
                        prefixIcon: Icon(Iconsax.tag),
                      ),
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),

                  // Shipping
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Shipping Cost',
                        label: Text('Shipping Cost (\$)'),
                        prefixIcon: Icon(Iconsax.ship),
                      ),
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),

                  // Free Shipping after
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Free Shipping after (\$)',
                        label: Text('Free Shipping Threshold (\$)'),
                        prefixIcon: Icon(Iconsax.ship),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields * 2),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Update App Settings'),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
