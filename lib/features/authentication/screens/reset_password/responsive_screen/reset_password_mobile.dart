import 'package:flutter/material.dart';
import 'package:t_store_admin_panel/features/authentication/screens/reset_password/widgets/reset_password_widget.dart';
import 'package:t_store_admin_panel/utils/constants/sizes.dart';

class ResetPasswordScreenMobile extends StatelessWidget {
  const ResetPasswordScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: ResetPasswordWidget(),
        ),
      ),
    );
  }
}
