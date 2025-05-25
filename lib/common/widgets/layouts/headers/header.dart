import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:t_store_admin_panel/utils/constants/colors.dart';
import 'package:t_store_admin_panel/utils/constants/enums.dart';
import 'package:t_store_admin_panel/utils/constants/image_strings.dart';
import 'package:t_store_admin_panel/utils/constants/sizes.dart';
import 'package:t_store_admin_panel/utils/device/device_utility.dart';

/// Header widget for the application:
class THeader extends StatelessWidget implements PreferredSizeWidget {
  const THeader({
    super.key,
    this.scaffoldKey,
  });

  /// GlobalKey to access the scaffold state:
  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: TColors.white,
        border: Border(
          bottom: BorderSide(
            color: TColors.grey,
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.md, vertical: TSizes.sm),
      child: AppBar(
        /// Mobile Menu:
        leading: !TDeviceUtils.isDesktopScreen(context)
            ? IconButton(
                onPressed: () => scaffoldKey?.currentState?.openDrawer(),
                icon: const Icon(Iconsax.menu))
            : null,

        /// Search Field:
        title: TDeviceUtils.isDesktopScreen(context)
            ? SizedBox(
                width: 400,
                child: TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.search_normal),
                      hintText: 'Search anything...'),
                ),
              )
            : null,

        /// Actions:
        actions: [
          // Search icon on mobile:
          if (!TDeviceUtils.isDesktopScreen(context))
            IconButton(
              icon: const Icon(Iconsax.search_normal),
              onPressed: () {},
            ),

          // Notification Icon
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.notification),
          ),
          const SizedBox(width: TSizes.spaceBtwItems / 2),

          // User Data
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image:
              const TRoundedImage(
                width: 40,
                height: 40,
                padding: 2,
                imageType: ImageType.asset,
                image: TImages.user,
              ),
              const SizedBox(width: TSizes.sm),

              // Name and Email:
              if (!TDeviceUtils.isMobileScreen(context))
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'A F M Sabbir Khan',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'Suport@CodingWithafmsk.com',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      Size.fromHeight(TDeviceUtils.getAppBarHeight() + 15);
}
