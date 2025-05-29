import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store_admin_panel/common/widgets/data_table/paginated_data_table.dart';
import 'package:t_store_admin_panel/utils/constants/sizes.dart';

class DashboardDesktopScreen extends StatelessWidget {
  const DashboardDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.put(DashboardController());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: [
              TextFormField(
                controller: controller.searchTextController,
                onChanged: (query) => controller.searchQuery(query),
                decoration: const InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Iconsax.search_normal),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Obx(
                () {
                  // orders and selected rows are hidden => just to update the UI=> obx => [productRows]
                  Visibility(
                    visible: false,
                    child: Text(controller.filteredDataList.length.toString()),
                  );

                  return Expanded(
                    child: TPaginatedDataTable(
                      sortAscending: controller.sortAscending.value,
                      sortColumnIndex: controller.sortColumnIndex.value,
                      columns: [
                        const DataColumn2(label: Text('Column 1')),
                        DataColumn(
                            label: const Text('Column 2'),
                            onSort: (columnIndex, ascending) =>
                                controller.sortById(columnIndex, ascending)),
                        DataColumn(
                            label: const Text('Column 3'),
                            onSort: (columnIndex, ascending) =>
                                controller.sortById(columnIndex, ascending)),
                        const DataColumn(label: Text('Column 4')),
                      ],
                      source: MyData(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyData extends DataTableSource {
  final DashboardController controller = Get.put(DashboardController());

  @override
  DataRow? getRow(int index) {
    final data = controller.filteredDataList[index];
    return DataRow2(
      onTap: () {},
      selected: controller.selectedRows[index],
      onSelectChanged: (value) =>
          controller.selectedRows[index] = value ?? false,
      cells: [
        DataCell(Text(data['Column1'] ?? '')),
        DataCell(Text(data['Column2'] ?? '')),
        DataCell(Text(data['Column3'] ?? '')),
        DataCell(Text(data['Column4'] ?? '')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => controller.filteredDataList.length;

  @override
  int get selectedRowCount => 0;
}

/// -----------DashboardController
class DashboardController extends GetxController {
  var dataList = <Map<String, String>>[].obs;
  var filteredDataList = <Map<String, String>>[].obs;
  RxList<bool> selectedRows = <bool>[].obs;

  RxInt sortColumnIndex = 1.obs;
  RxBool sortAscending = true.obs;
  final searchTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchDummyData();
  }

  void searchQuery(String query) {
    filteredDataList.assignAll(dataList
        .where((item) => item['column1']!.contains(query.toLowerCase())));
  }

  void sortById(int sortColumnIndex, bool ascending) {
    sortAscending.value = ascending;
    filteredDataList.sort((a, b) {
      if (ascending) {
        return filteredDataList[0]['column1']
            .toString()
            .toLowerCase()
            .compareTo(filteredDataList[0]['column1'].toString().toLowerCase());
      } else {
        return filteredDataList[0]['column1']
            .toString()
            .toLowerCase()
            .compareTo(filteredDataList[0]['column1'].toString().toLowerCase());
      }
    });
    this.sortColumnIndex.value = sortColumnIndex;
  }

  void fetchDummyData() {
    selectedRows.assignAll(List.generate(36, (index) => false));
    dataList.addAll(
      List.generate(
        36,
        (index) => {
          'Column1:': 'Data ${index + 1} -1',
          'Column2:': 'Data ${index + 1} -2',
          'Column3:': 'Data ${index + 1} -3',
          'Column4:': 'Data ${index + 1} -4',
        },
      ),
    );

    filteredDataList.addAll(
      List.generate(
        36,
        (index) => {
          'Column1:': 'Data ${index + 1} -1',
          'Column2:': 'Data ${index + 1} -2',
          'Column3:': 'Data ${index + 1} -3',
          'Column4:': 'Data ${index + 1} -4',
        },
      ),
    );
  }
}
