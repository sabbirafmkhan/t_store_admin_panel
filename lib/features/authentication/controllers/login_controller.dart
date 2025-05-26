import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store_admin_panel/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store_admin_panel/data/repositories/user/user_repository.dart';
import 'package:t_store_admin_panel/features/authentication/controllers/user_controller.dart';
import 'package:t_store_admin_panel/features/authentication/model/user/user_model.dart';
import 'package:t_store_admin_panel/utils/constants/enums.dart';
import 'package:t_store_admin_panel/utils/constants/image_strings.dart';
import 'package:t_store_admin_panel/utils/constants/text_strings.dart';
import 'package:t_store_admin_panel/utils/helpers/network_manager.dart';
import 'package:t_store_admin_panel/utils/popups/full_screen_loader.dart';
import 'package:t_store_admin_panel/utils/popups/loaders.dart';

/// Controller for handling login functionally:
class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// variables:
  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final localStorage = GetStorage();

  final email = TextEditingController();
  final password = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read("REMEMBER_ME_EMAIL") ?? "";
    password.text = localStorage.read("REMEMBER_ME_PASSWORD") ?? "";
    super.onInit();
  }

  /// Handles email and password sing-in process:
  Future<void> emailAndPasswordSignIn() async {
    try {
      // - start Loading:
      TFullScreenLoader.openLoadingDialog(
          'Logging you in...', TImages.docerAnimation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader:
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!loginFormKey.currentState!.validate()) {
        // Remove Loader:
        TFullScreenLoader.stopLoading();
        return;
      }

      // save data if remember me is selected:
      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      // Login user using Email and Password Authentication:
      await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Fetch user details and assign to UserController
      final user = await UserController.instance.fetchUserDetails();

// Remove Loader
      TFullScreenLoader.stopLoading();

// If user is not admin, logout and return
      if (user.role != AppRole.admin) {
        await AuthenticationRepository.instance.logout();
        TLoaders.errorSnackBar(
            title: 'Not Authorized',
            message: 'You are not authorized or do have access. Contact Admin');
      } else {
        // Redirect
        AuthenticationRepository.instance.screenRedirect();
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// Handles registration of admin user:
  Future<void> registerAdmin() async {
    try {
      // Start Loading:
      TFullScreenLoader.openLoadingDialog(
          'Registration Admin Account', TImages.docerAnimation);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader:
        TFullScreenLoader.stopLoading();
        return;
      }

      // Register user using Email and Password Authentication
      await AuthenticationRepository.instance.registerWithEmailAndPassword(
          TTexts.adminEmail, TTexts.adminPassword);

      // Crate admin record in the firestore
      final userRepository = Get.put(UserRepository());
      await userRepository.createUser(
        UserModel(
          id: AuthenticationRepository.instance.authUser!.uid,
          firstName: 'CWT',
          lastName: 'Admin',
          email: TTexts.adminEmail,
          role: AppRole.admin,
          createdAt: DateTime.now(),
        ),
      );

      // Remove Loader:
      TFullScreenLoader.stopLoading();

      // Redirect :
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap1', message: e.toString());
    }
  }
}
