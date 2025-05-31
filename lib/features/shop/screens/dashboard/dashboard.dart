import 'package:flutter/material.dart';
import 'package:t_store_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:t_store_admin_panel/features/shop/screens/dashboard/responsive_screen/dashboard_desktop.dart';
import 'package:t_store_admin_panel/features/shop/screens/dashboard/responsive_screen/dashboard_mobile.dart';
import 'package:t_store_admin_panel/features/shop/screens/dashboard/responsive_screen/dashboard_tablet.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(
      desktop: DashboardDesktopScreen(),
      tablet: DashboardTabletScreen(),
      mobile: DashboardMobileScreen(),
    );
  }
}
