import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store_admin_panel/routes/routes.dart';

class TRouteMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    print(
        '.............................................middleware work.............................................');
    final isAuthenticated = true;
    return isAuthenticated ? null : const RouteSettings(name: TRoutes.login);
  }
}
