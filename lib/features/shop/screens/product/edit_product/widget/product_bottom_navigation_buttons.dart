import 'package:flutter/material.dart';
import 'package:t_store_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:t_store_admin_panel/features/shop/controller/product/edit_product_controller.dart';
import 'package:t_store_admin_panel/features/shop/models/product_model.dart';
import 'package:t_store_admin_panel/utils/constants/sizes.dart';

class EditProductBottomNavigationButtons extends StatelessWidget {
  const EditProductBottomNavigationButtons({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Discard button
          OutlinedButton(
            onPressed: () {
              // Add functionality to discard changes if needed
            },
            child: const Text('Discard'),
          ),
          const SizedBox(width: TSizes.spaceBtwItems / 2),

          // Save Changes button
          SizedBox(
            width: 160,
            child: ElevatedButton(
              onPressed: () =>
                  EditProductController.instance.editProduct(product),
              child: const Text('Save Changes'),
            ),
          ),
        ],
      ),
    );
  }
}
