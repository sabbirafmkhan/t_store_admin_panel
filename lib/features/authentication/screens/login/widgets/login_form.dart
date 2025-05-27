import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store_admin_panel/features/authentication/controllers/login_controller.dart';
import 'package:t_store_admin_panel/routes/routes.dart';
import 'package:t_store_admin_panel/utils/constants/sizes.dart';
import 'package:t_store_admin_panel/utils/constants/text_strings.dart';
import 'package:t_store_admin_panel/utils/validators/validation.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email:
            TextFormField(
              controller: controller.email,
              validator: TValidator.validateEmail,
              decoration: const InputDecoration(
                labelText: TTexts.email,
                prefixIcon: Icon(Iconsax.direct_right),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            /// Password:
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) =>
                    TValidator.validateEmptyText('Password', value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(
                      controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            /// Remember me & Forget Password:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember me:
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) =>
                            controller.rememberMe.value = value!,
                      ),
                    ),
                    const Text(TTexts.rememberMe)
                  ],
                ),
                // Forget Password:
                TextButton(
                  onPressed: () => Get.toNamed(TRoutes.forgetPassword),
                  child: const Text(TTexts.forgetPassword),
                )
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Sign In Button:
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                // onPressed: () => controller.registerAdmin(),
                child: const Text(TTexts.signIn),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
