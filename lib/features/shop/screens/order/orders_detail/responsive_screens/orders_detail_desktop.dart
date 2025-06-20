import 'package:flutter/material.dart';
import 'package:t_store_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:t_store_admin_panel/features/shop/models/order_model.dart';
import 'package:t_store_admin_panel/features/shop/screens/order/orders_detail/widgets/order_info.dart';
import 'package:t_store_admin_panel/routes/routes.dart';
import 'package:t_store_admin_panel/utils/constants/sizes.dart';

class OrdersDetailDesktopScreen extends StatelessWidget {
  const OrdersDetailDesktopScreen({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Breadcrumbs
              TBreadcrumbWithHeading(
                returnToPreviousScreen: true,
                heading: order.id,
                breadcrumbItems: const [TRoutes.orders, 'Details'],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Body
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Side Order Information
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        // Order Info
                        OrderInfo(order: order),
                        const SizedBox(height: TSizes.spaceBtwSections),

                        // Items

                        const SizedBox(height: TSizes.spaceBtwSections),

                        // Transactions
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Right Side Order Orders
                  Expanded(
                    child: Column(
                      children: [
                        // Customer Info
                        const SizedBox(height: TSizes.spaceBtwSections),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
