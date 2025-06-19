import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:t_store_admin_panel/features/shop/screens/customer/customer_details/responsive_screens/customer_details_desktop.dart';
import 'package:t_store_admin_panel/features/shop/screens/customer/customer_details/responsive_screens/customer_details_mobile.dart';

class CustomerDetailsScreen extends StatelessWidget {
  const CustomerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final customer = Get.arguments;
    return TSiteTemplate(
      desktop: CustomerDetailsDesktopScreen(customer: customer),
      mobile: CustomerDetailsMobileScreen(customer: customer),
    );
  }
}
