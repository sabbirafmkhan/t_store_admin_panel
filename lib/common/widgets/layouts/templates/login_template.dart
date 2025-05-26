import 'package:flutter/material.dart';
import 'package:t_store_admin_panel/common/styles/spacing_styles.dart';
import 'package:t_store_admin_panel/utils/constants/colors.dart';
import 'package:t_store_admin_panel/utils/constants/sizes.dart';
import 'package:t_store_admin_panel/utils/helpers/helper_functions.dart';

class TLoginTemplate extends StatelessWidget {
  const TLoginTemplate({
    super.key,
    required this.child,
  });

  /// The widgets to be displayed inside the login template:
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 550,
        child: SingleChildScrollView(
          child: Container(
            padding: TSpacingStyle.paddingWithAppBarHeight,
            decoration: BoxDecoration(
              color: THelperFunctions.isDarkMode(context)
                  ? TColors.black
                  : Colors.white,
              borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
