import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_store_admin_panel/common/widgets/layouts/templates/login_template.dart';
import 'package:t_store_admin_panel/features/authentication/screens/reset_password/widgets/reset_password_widget.dart';

class ResetPasswordScreenDesktopTablet extends StatelessWidget {
  const ResetPasswordScreenDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const TLoginTemplate(
      child: ResetPasswordWidget(),
    );
  }
}
