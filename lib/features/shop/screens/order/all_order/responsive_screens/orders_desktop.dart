import 'package:flutter/material.dart';
import 'package:t_store_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:t_store_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:t_store_admin_panel/common/widgets/data_table/table_header.dart';
import 'package:t_store_admin_panel/features/shop/screens/order/all_order/table/data_table.dart';
import 'package:t_store_admin_panel/utils/constants/sizes.dart';

class OrdersDesktopScreen extends StatelessWidget {
  const OrdersDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Breadcrumbs
              TBreadcrumbWithHeading(
                heading: 'Orders',
                breadcrumbItems: ['Orders'],
              ),
              SizedBox(height: TSizes.spaceBtwSections),

              // Table Body
              TRoundedContainer(
                child: Column(
                  children: [
                    // table header
                    TTableHeader(showLeftWidget: false),
                    SizedBox(height: TSizes.spaceBtwItems),

                    // table
                    OrderTable(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
