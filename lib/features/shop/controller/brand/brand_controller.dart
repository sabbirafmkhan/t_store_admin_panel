import 'package:get/get.dart';
import 'package:t_store_admin_panel/data/abstract/base_data_table_controller.dart';
import 'package:t_store_admin_panel/data/repositories/brands/brand_repository.dart';
import 'package:t_store_admin_panel/features/shop/controller/category/category_controller.dart';
import 'package:t_store_admin_panel/features/shop/models/brand_model.dart';

class BrandController extends TBaseController<BrandModel> {
  static BrandController get instance => Get.find();

  final _brandRepository = Get.put(BrandRepository());
  final categoryController = Get.put(CategoryController());

  @override
  Future<List<BrandModel>> fetchItems() async {
    // Fetch brands
    final fetchedBrands = await _brandRepository.getAllBrands();

    // Fetch Brand Categories Relational Data
    final fetchedBrandCategories =
        await _brandRepository.getAllBrandCategories();

    // Fetch All Categories is data does not already exist
    if (categoryController.allItems.isNotEmpty) {
      await categoryController.fetchItems();
    }

    // Loop all brands and fetch categories of each
    for (var brand in fetchedBrands) {
      // Extract categoryIds from the documents
      List<String> categoryIds = fetchedBrandCategories
          .where((brandCategory) => brandCategory.brandId == brand.id)
          .map((brandCategory) => brandCategory.categoryId)
          .toList();

      brand.brandCategories = categoryController.allItems
          .where((category) => categoryIds.contains(category.id))
          .toList();
    }
    return fetchedBrands;
  }

  @override
  bool containsSearchQuery(BrandModel item, String query) {
    return item.name.toLowerCase().contains(query.toLowerCase());
  }

  @override
  Future<void> deleteItem(BrandModel item) async {
    await _brandRepository.deleteBrand(item);
  }

  void sortByName(int sortColumnIndex, bool ascending) {
    sortByProperty(
      sortColumnIndex,
      ascending,
      (BrandModel b) => b.name.toLowerCase(),
    );
  }
}
