import 'package:flutter/material.dart';
import 'package:t_store_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:t_store_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:t_store_admin_panel/features/shop/models/order_model.dart';
import 'package:t_store_admin_panel/utils/constants/colors.dart';
import 'package:t_store_admin_panel/utils/constants/enums.dart';
import 'package:t_store_admin_panel/utils/constants/image_strings.dart';
import 'package:t_store_admin_panel/utils/constants/sizes.dart';
import 'package:t_store_admin_panel/utils/device/device_utility.dart';

class OrderItems extends StatelessWidget {
  const OrderItems({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final subTotal = order.items.fold(
      0.0,
      (previousValue, element) =>
          previousValue + (element.price * element.quantity),
    );
    return TRoundedContainer(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Items', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: TSizes.spaceBtwSections),

          // Items
          ListView.separated(
            shrinkWrap: true,
            itemCount: order.items.length,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, __) =>
                const SizedBox(height: TSizes.spaceBtwItems),
            itemBuilder: (_, index) {
              final item = order.items[index];
              return Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        TRoundedImage(
                          backgroundColor: TColors.primaryBackground,
                          imageType: item.image != null
                              ? ImageType.network
                              : ImageType.asset,
                          image: item.image ?? TImages.defaultImage,
                        ),
                        const SizedBox(width: TSizes.spaceBtwItems),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: Theme.of(context).textTheme.titleMedium,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              if (item.selectedVariation != null)
                                Text(item.selectedVariation!.entries
                                    .map((e) => ('${e.key}: ${e.value}'))
                                    .toString())
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  SizedBox(
                    width: TSizes.xl * 2,
                    child: Text('\$${item.price.toStringAsFixed(1)}',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                  SizedBox(
                    width: TDeviceUtils.isMobileScreen(context)
                        ? TSizes.xl * 3.4
                        : TSizes.xl * 2,
                    child: Text(item.quantity.toString(),
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                  SizedBox(
                    width: TDeviceUtils.isMobileScreen(context)
                        ? TSizes.xl * 1.4
                        : TSizes.xl * 2,
                    child: Text('\$${item.price}',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
