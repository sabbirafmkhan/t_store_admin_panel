import 'package:flutter/material.dart';
import 'package:t_store_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:t_store_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:t_store_admin_panel/features/shop/models/order_model.dart';
import 'package:t_store_admin_panel/utils/constants/colors.dart';
import 'package:t_store_admin_panel/utils/constants/enums.dart';
import 'package:t_store_admin_panel/utils/constants/image_strings.dart';
import 'package:t_store_admin_panel/utils/constants/sizes.dart';

class OrderCustomer extends StatelessWidget {
  const OrderCustomer({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Personal Info
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Customer',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Row(
                children: [
                  const TRoundedImage(
                    padding: 0,
                    backgroundColor: TColors.primaryBackground,
                    image: TImages.user,
                    imageType: ImageType.asset,
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Coding with T',
                          style: Theme.of(context).textTheme.titleLarge,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const Text(
                          'support@codingwitht.com',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        // Contact Info
        SizedBox(
          width: double.infinity,
          child: TRoundedContainer(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Contact Person',
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: TSizes.spaceBtwSections),
                Text('Coding with T',
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                Text('support@codingwitht.com',
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                Text('+(44) **** ****',
                    style: Theme.of(context).textTheme.titleSmall),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        // contact info
        SizedBox(
          width: double.infinity,
          child: TRoundedContainer(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Shipping Address',
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: TSizes.spaceBtwSections),
                Text('Taimoor Sikander LTD',
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                Text('61 Bridge Street, Kingston, United Kingdom',
                    style: Theme.of(context).textTheme.titleSmall),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        // contact info : adjust this address as per needs
        SizedBox(
          width: double.infinity,
          child: TRoundedContainer(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Billing Address',
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: TSizes.spaceBtwSections),
                Text('Taimoor Sikander LTD',
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                Text('61 Bridge Street, Kingston, United Kingdom',
                    style: Theme.of(context).textTheme.titleSmall),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }
}
