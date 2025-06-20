import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:t_store_admin_panel/utils/constants/sizes.dart';
import 'package:t_store_admin_panel/utils/validators/validation.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    // The outermost Column of ProfileForm doesn't strictly need mainAxisSize.min
    // because it's wrapped by an Expanded in ProfileDesktopScreen, which provides
    // finite vertical constraints. However, applying it is generally safer for
    // columns that aren't meant to fill all available space.
    return Column(
      // mainAxisSize: MainAxisSize.min, // Optional, but can be good practice
      children: [
        TRoundedContainer(
          padding: const EdgeInsets.symmetric(
              vertical: TSizes.lg, horizontal: TSizes.md),
          child: Column(
            // This Column defines the overall vertical layout within the TRoundedContainer.
            // It should also ideally take minimum space to avoid conflicts.
            mainAxisSize: MainAxisSize.min, // *** Crucial Fix here ***
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Profile Details',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              Form(
                child: Column(
                  // This Column wraps the actual form fields and their spacing.
                  // It must take minimum size to contain its children correctly.
                  mainAxisSize: MainAxisSize.min, // *** Crucial Fix here ***
                  children: [
                    // First Name and Last Name Row
                    Row(
                      children: [
                        // First Name
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'First Name',
                              label: Text('First Name'),
                              prefixIcon: Icon(Iconsax.user),
                            ),
                            validator: (value) => TValidator.validateEmptyText(
                              'First Name',
                              value,
                            ),
                          ),
                        ),
                        const SizedBox(width: TSizes.spaceBtwInputFields),

                        // Last name
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Last Name',
                              label: Text('Last Name'),
                              prefixIcon: Icon(Iconsax.user),
                            ),
                            validator: (value) => TValidator.validateEmptyText(
                              'Last Name',
                              value,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // *** Corrected placement of SizedBox for vertical spacing ***
                    const SizedBox(height: TSizes.spaceBtwInputFields),

                    // Email and Phone Row
                    Row(
                      children: [
                        // Email
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Email',
                              label: Text('Email'),
                              prefixIcon: Icon(Iconsax.forward),
                              enabled: false, // Assuming email is not editable
                            ),
                            validator: (value) => TValidator.validateEmptyText(
                              'Email',
                              value,
                            ),
                          ),
                        ),
                        const SizedBox(width: TSizes.spaceBtwItems),

                        // Phone
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Phone Number',
                              label: Text('Phone Number'),
                              prefixIcon: Icon(Iconsax.mobile),
                            ),
                            validator: (value) => TValidator.validateEmptyText(
                              'Phone Number',
                              value,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Update Profile Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Implement your update profile logic here
                  },
                  child: const Text('Update Profile'),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
