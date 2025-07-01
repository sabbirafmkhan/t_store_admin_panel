import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store_admin_panel/data/repositories/banners/banner_repository.dart';
import 'package:t_store_admin_panel/features/media/controllers/media_controller.dart';
import 'package:t_store_admin_panel/features/media/models/image_model.dart';
import 'package:t_store_admin_panel/features/shop/controller/banner/banner_controller.dart';
import 'package:t_store_admin_panel/features/shop/models/banner_model.dart';
import 'package:t_store_admin_panel/routes/app_screens.dart';
import 'package:t_store_admin_panel/utils/helpers/network_manager.dart';
import 'package:t_store_admin_panel/utils/popups/full_screen_loader.dart';
import 'package:t_store_admin_panel/utils/popups/loaders.dart';

class CreateBannerController extends GetxController {
  static CreateBannerController get instance => Get.find();

  final imageUrl = ''.obs;
  final loading = false.obs;
  final isActive = false.obs;
  final RxString targetScreen = AppScreens.allAppScreenItems[0].obs;
  final formKey = GlobalKey<FormState>();

  /// Pick Thumbnail Image from Media
  void pickImage() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectImagesFromMedia();

    // Handle the selected images
    if (selectedImages != null && selectedImages.isNotEmpty) {
      // Set the selected image to the main image or perform any other action
      ImageModel selectedImage = selectedImages.first;
      // Update the main image using the selectedImage
      imageUrl.value = selectedImage.url;
    }
  }

  // Register new banner
  Future<void> createBanner() async {
    try {
      // Start Loading
      TFullScreenLoader.popUpCircular();

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!formKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Map Data
      final newRecord = BannerModel(
        id: '',
        active: isActive.value,
        imageUrl: imageUrl.value,
        targetScreen: targetScreen.value,
      );

      // Call Repository to Create New Banner and update Id
      newRecord.id = await BannerRepository.instance.createBanner(newRecord);

      // Update All Data list
      BannerController.instance.addIemToLists(newRecord);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Success Message & Redirect
      TLoaders.successSnackBar(title: 'Congratulations', message: 'New Record has been added.');
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
    }
  }

