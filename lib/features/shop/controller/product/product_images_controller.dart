import 'package:get/get.dart';
import 'package:t_store_admin_panel/features/media/controllers/media_controller.dart';
import 'package:t_store_admin_panel/features/media/models/image_model.dart';
import 'package:t_store_admin_panel/features/shop/models/product_variation_model.dart';

class ProductImagesController extends GetxController {
// Singleton instance
  static ProductImagesController get instance => Get.find();

// Rx Observables
  Rx<String?> selectedThumbnailImageUrl = Rx<String?>(null);

// Lists to store additional product images
  final RxList<String> additionalProductImagesUrls = <String>[].obs;

// Function to remove Product image
  Future<void> removeImage(int index) async {
    additionalProductImagesUrls.removeAt(index);
  }

// Pick Thumbnail Image from Media
  void selectThumbnailImage() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectImagesFromMedia();

    // Handle the selected images
    if (selectedImages != null && selectedImages.isNotEmpty) {
      // Set the selected image to the main image or perform any other action
      ImageModel selectedImage = selectedImages.first;
      // Update the main image using the selected image
      selectedThumbnailImageUrl.value = selectedImage.url;
    }
  }

  // Pick Thumbnail Image from Media
  void selectVariationImage(ProductVariationModel variation) async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectImagesFromMedia();

    // Handle the selected images
    if (selectedImages != null && selectedImages.isNotEmpty) {
      // Set the selected image to the main image or perform any other action
      ImageModel selectedImage = selectedImages.first;
      // Update the main image using the selected image
      variation.image.value = selectedImage.url;
    }
  }

  /// Pick Thumbnail Image from Gallery
  void selectMultipleProductImages() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectImagesFromMedia(
        multipleSelection: true, selectedUrls: additionalProductImagesUrls);

    // Handle the selected images
    if (selectedImages != null && selectedImages.isNotEmpty) {
      additionalProductImagesUrls.assignAll(selectedImages.map((e) => e.url));
    }
  }
}
