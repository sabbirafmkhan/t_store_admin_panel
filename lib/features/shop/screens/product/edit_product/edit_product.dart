import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:t_store_admin_panel/features/shop/screens/product/edit_product/responsive_screens/edit_product_desktop.dart';
import 'package:t_store_admin_panel/features/shop/screens/product/edit_product/responsive_screens/edit_product_mobile.dart';

class EditProductScreen extends StatelessWidget {
  const EditProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Get.arguments;
    return TSiteTemplate(
      desktop: EditProductDesktopScreen(product: product),
      mobile: EditProductMobileScreen(product: product),
    );
  }
}
