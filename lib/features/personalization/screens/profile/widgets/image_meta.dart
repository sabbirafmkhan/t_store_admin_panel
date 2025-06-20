import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:t_store_admin_panel/common/widgets/images/image_uploader.dart';
import 'package:t_store_admin_panel/utils/constants/enums.dart';
import 'package:t_store_admin_panel/utils/constants/image_strings.dart';
import 'package:t_store_admin_panel/utils/constants/sizes.dart';

class ImageAndMeta extends StatelessWidget {
  const ImageAndMeta({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      padding: const EdgeInsets.symmetric(
        vertical: TSizes.lg,
        horizontal: TSizes.md,
      ),
      // The TRoundedContainer is a custom widget. Ensure its internal
      // implementation passes finite constraints to its child if necessary,
      // or allows its child to size itself.
      // Assuming TRoundedContainer correctly wraps its child.
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // The key fix is here:
          // Wrap the Column in Flexible or provide it with mainAxisSize.min.
          // Since the children of this Column (TImageUploader, Text) have
          // intrinsic heights, letting the Column take minimum space is ideal.
          Column(
            mainAxisSize:
                MainAxisSize.min, // This is the crucial line for the fix
            children: [
              // User Image - already has explicit width and height, which is good.
              const TImageUploader(
                right: 10,
                bottom: 20,
                left: null,
                width: 200,
                height: 200,
                circular: true,
                icon: Iconsax.camera,
                imageType: ImageType.asset,
                image: TImages.user,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                'Coding with T',
                style: Theme.of(context).textTheme.headlineLarge,
                // Consider adding textAlign for better responsiveness
                textAlign: TextAlign.center,
              ),
              const Text(
                'support@codingwitht.com',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ],
      ),
    );
  }
}
