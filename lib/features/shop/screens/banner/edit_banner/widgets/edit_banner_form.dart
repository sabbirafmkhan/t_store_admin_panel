import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:t_store_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:t_store_admin_panel/features/shop/models/banner_model.dart';
import 'package:t_store_admin_panel/utils/constants/colors.dart';
import 'package:t_store_admin_panel/utils/constants/enums.dart';
import 'package:t_store_admin_panel/utils/constants/image_strings.dart';
import 'package:t_store_admin_panel/utils/constants/sizes.dart';

class EditBannerForm extends StatelessWidget {
  const EditBannerForm({
    super.key,
    required this.banner,
  });

  final BannerModel banner;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      width: 500,
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            const SizedBox(height: TSizes.sm),
            Text(
              'Update Banner',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Name Text Field
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Banner Name',
                prefixIcon: Icon(Iconsax.box),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Image Uploader & Featured Checkbox
            Column(
              children: [
                GestureDetector(
                  child: const TRoundedImage(
                    width: 400,
                    height: 200,
                    backgroundColor: TColors.primaryBackground,
                    image: TImages.defaultImage,
                    imageType: ImageType.asset,
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                TextButton(onPressed: () {}, child: const Text('Select Image')),
              ],
            ),

            const SizedBox(height: TSizes.spaceBtwInputFields),

            Text(
              'Make your Banner Active or InActive',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            CheckboxMenuButton(
                value: true,
                onChanged: (value) {},
                child: const Text('Active')),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            // Dropdown Menu Screens
            DropdownButton<String>(
              value: 'search',
              onChanged: (String? newValue) {},
              items: const [
                DropdownMenuItem<String>(value: 'home', child: Text('Home')),
                DropdownMenuItem<String>(
                    value: 'search', child: Text('Search')),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields * 2),
            SizedBox(
              width: double.infinity,
              child:
                  ElevatedButton(onPressed: () {}, child: const Text('Update')),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields * 2),
          ],
        ),
      ),
    );
  }
}
