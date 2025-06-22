import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store_admin_panel/data/repositories/category/category_repository.dart';
import 'package:t_store_admin_panel/features/shop/models/category_model.dart';
import 'package:t_store_admin_panel/utils/constants/sizes.dart';
import 'package:t_store_admin_panel/utils/popups/full_screen_loader.dart';
import 'package:t_store_admin_panel/utils/popups/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  RxBool isLoading = true.obs;
  RxList<CategoryModel> allItems = <CategoryModel>[].obs;
  RxList<CategoryModel> filteredItems = <CategoryModel>[].obs;
  RxList<bool> selectedRows = <bool>[].obs;

  // Sorting
  RxInt sortColumnIndex = 1.obs;
  RxBool sortAscending = true.obs;

  final searchTextController = TextEditingController();

  final _categoryRepository = Get.put(CategoryRepository());

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    try {
      isLoading.value = true;
      List<CategoryModel> fetchedItems = [];
      if (allItems.isEmpty) {
        fetchedItems = await _categoryRepository.getAllCategories();
      }

      allItems.assignAll(fetchedItems);
      filteredItems.assignAll(allItems);
      selectedRows.assignAll(List.generate(allItems.length, (_) => false));

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  void sortByName(int columnIndex, bool ascending) {
    sortColumnIndex.value = columnIndex;
    sortAscending.value = ascending;

    filteredItems.sort(
      (a, b) {
        if (ascending) {
          return a.name.toLowerCase().compareTo(b.name.toLowerCase());
        } else {
          return b.name.toLowerCase().compareTo(a.name.toLowerCase());
        }
      },
    );
  }

  void sortParentByName(int columnIndex, bool ascending) {
    sortColumnIndex.value = columnIndex;
    sortAscending.value = ascending;

    filteredItems.sort(
      (a, b) {
        if (ascending) {
          return a.name.toLowerCase().compareTo(b.name.toLowerCase());
        } else {
          return b.name.toLowerCase().compareTo(a.name.toLowerCase());
        }
      },
    );
  }

  searchQuery(String query) {
    filteredItems.assignAll(
      allItems.where(
        (item) => item.name.toLowerCase().contains(query.toLowerCase()),
      ),
    );
  }

  confirmAndDeleteItem(CategoryModel category) {
    // Show a Confirmation dialog
    Get.defaultDialog(
      title: 'Delete Item',
      content: const Text('Are you sure you want to delete this item'),
      confirm: SizedBox(
        width: 60,
        child: ElevatedButton(
          onPressed: () async => await deleteOnConfirm(category),
          style: OutlinedButton.styleFrom(
            padding:
                const EdgeInsets.symmetric(vertical: TSizes.buttonHeight / 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(TSizes.buttonRadius * 5),
            ),
          ),
          child: const Text('Ok'),
        ),
      ),
      cancel: SizedBox(
        width: 80,
        child: OutlinedButton(
          onPressed: () => Get.back(),
          style: OutlinedButton.styleFrom(
            padding:
                const EdgeInsets.symmetric(vertical: TSizes.buttonHeight / 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(TSizes.buttonRadius * 5),
            ),
          ),
          child: const Text("Cancel"),
        ),
      ),
    );
  }

  deleteOnConfirm(CategoryModel category) async {
    try {
      // Remove the confirmation Dialog
      TFullScreenLoader.stopLoading();

      // Start the loader
      TFullScreenLoader.popUpCircular();

      // Delete Firestore Data
      await _categoryRepository.deleteCategory(category.id);

      removeItemFromLists(category);

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
        title: 'Item Deleted',
        message: 'Your item has been Deleted',
      );
    } catch (e) {
      isLoading.value = false;
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Method for removing an item from the lists
  void removeItemFromLists(CategoryModel item) {
    allItems.remove(item);
    filteredItems.remove(item);
    selectedRows.assignAll(List.generate(allItems.length, (index) => false));
  }

  void addItemToLists(CategoryModel item) {
    allItems.add(item);
    filteredItems.add(item);
    selectedRows.assignAll(List.generate(allItems.length, (index) => false));

    filteredItems.refresh();
  }

  // Method for updating an item in the lists.
  void updateItemFromLists(CategoryModel item) {
    final itemIndex = allItems.indexWhere((i) => i == item);
    final filteredItemsIndex = filteredItems.indexWhere((i) => i == item);

    if (itemIndex != -1) allItems[itemIndex] = item;
    if (filteredItemsIndex != -1) filteredItems[itemIndex] = item;

    filteredItems.refresh();
  }
}
