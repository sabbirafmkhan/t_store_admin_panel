import 'package:get/get.dart';
import 'package:t_store_admin_panel/data/repositories/user/user_repository.dart';
import 'package:t_store_admin_panel/features/authentication/model/user/user_model.dart';
import 'package:t_store_admin_panel/utils/popups/loaders.dart';

/// Controller for managing admin-related data and operations
class UserController extends GetxController {
  static UserController get instance => Get.find();

  // Variables:
  RxBool loading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    fetchUserDetails();
    super.onInit();
  }

  /// Fetches user details from the repository
  Future<UserModel> fetchUserDetails() async {
    try {
      loading.value = true;
      final user = await userRepository.fetchAdminDetails();
      this.user.value = user;
      return user;
    } catch (e) {
      loading.value = false;
      TLoaders.errorSnackBar(
          title: 'Something went wrong.', message: e.toString());
      return UserModel.empty();
    }
  }
}
