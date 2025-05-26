import 'package:flutter/material.dart';
import 'package:t_store_admin_panel/features/screens/login/widgets/login_form.dart';
import 'package:t_store_admin_panel/features/screens/login/widgets/login_header.dart';
import 'package:t_store_admin_panel/utils/constants/sizes.dart';

class LoginScreenMobile extends StatelessWidget {
  const LoginScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Header:
              TLoginHeader(),
              // Form:
              TLoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
