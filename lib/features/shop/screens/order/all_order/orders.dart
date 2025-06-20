import 'package:flutter/material.dart';
import 'package:t_store_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:t_store_admin_panel/features/shop/screens/order/all_order/responsive_screens/orders_desktop.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(
      desktop: OrdersDesktopScreen(),
    );
  }
}
