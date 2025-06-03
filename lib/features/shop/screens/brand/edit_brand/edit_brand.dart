import 'package:flutter/material.dart';
import 'package:t_store_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:t_store_admin_panel/features/shop/models/brand_model.dart';
import 'package:t_store_admin_panel/features/shop/screens/brand/edit_brand/responsive_screens/edit_brand_desktop.dart';
import 'package:t_store_admin_panel/features/shop/screens/brand/edit_brand/responsive_screens/edit_brand_mobile.dart';
import 'package:t_store_admin_panel/features/shop/screens/brand/edit_brand/responsive_screens/edit_brand_tablet.dart';

class EditBrandScreen extends StatelessWidget {
  const EditBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brand = BrandModel(id: '', name: '', image: '');
    return TSiteTemplate(
      desktop: EditBrandDesktopScreen(brand: brand),
      tablet: EditBrandTabletScreen(brand: brand),
      mobile: EditBrandMobileScreen(brand: brand),
    );
  }
}
