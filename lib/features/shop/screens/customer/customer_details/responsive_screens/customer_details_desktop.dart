import 'package:flutter/material.dart';
import 'package:t_store_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:t_store_admin_panel/features/authentication/model/user/user_model.dart';
import 'package:t_store_admin_panel/features/shop/screens/customer/customer_details/widgets/customer_info.dart';
import 'package:t_store_admin_panel/features/shop/screens/customer/customer_details/widgets/customer_orders.dart';
import 'package:t_store_admin_panel/features/shop/screens/customer/customer_details/widgets/shipping_address.dart';
import 'package:t_store_admin_panel/routes/routes.dart';
import 'package:t_store_admin_panel/utils/constants/sizes.dart';

class CustomerDetailsDesktopScreen extends StatelessWidget {
  const CustomerDetailsDesktopScreen({super.key, required this.customer});

  final UserModel customer;

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
              const TBreadcrumbWithHeading(
                returnToPreviousScreen: true,
                heading: 'Taimoor Sikander',
                breadcrumbItems: [TRoutes.customers, 'Details'],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Body
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left side customer information
                  Expanded(
                    child: Column(
                      children: [
                        // Customer Info
                        CustomerInfo(customer: customer),
                        const SizedBox(height: TSizes.spaceBtwSections),

                        // Shipping Address
                        const ShippingAddress(),
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Right side Customer Orders
                  const Expanded(
                    flex: 2,
                    child: CustomerOrders(),
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
