import 'package:get/get.dart';
import 'package:t_store_admin_panel/data/abstract/base_data_table_controller.dart';
import 'package:t_store_admin_panel/features/shop/controller/customer/customer_controller.dart';
import 'package:t_store_admin_panel/features/shop/controller/order/order_controller.dart';
import 'package:t_store_admin_panel/utils/constants/enums.dart';
import 'package:t_store_admin_panel/utils/helpers/helper_functions.dart';

class DashboardController extends TBaseController {
  static DashboardController get instance => Get.find();

  final orderController = Get.put(OrderController());
  final customerController = Get.put(CustomerController());

  /// variables
  final RxList<double> weeklySales = <double>[].obs;
  final RxMap<OrderStatus, int> orderStatusData = <OrderStatus, int>{}.obs;
  final RxMap<OrderStatus, double> totalAmounts = <OrderStatus, double>{}.obs;

  @override
  Future<List> fetchItems() async {
    // Fetch Orders if empty
    if (orderController.allItems.isEmpty) {
      await orderController.fetchItems();
    }

    // Fetch Customers if empty
    if (customerController.allItems.isEmpty) {
      await customerController.fetchItems();
    }

    // calculate weekly sales:
    _calculateWeeklySales();

    // calculate Order Status counts
    _calculateOrderStatusData();

    return orderController.allItems;
  }

  // Calculate weekly sales:
  void _calculateWeeklySales() {
    weeklySales.value = List<double>.filled(7, 0.0);

    for (var order in orderController.allItems) {
      final DateTime orderWeekStart =
          THelperFunctions.getStartOfWeek(order.orderDate);

      // check if the order is within the current week:
      if (orderWeekStart.isBefore(DateTime.now()) &&
          orderWeekStart.add(const Duration(days: 7)).isAfter(DateTime.now())) {
        int index = (order.orderDate.weekday - 1) % 7;

        // Ensure the index is non-negative:
        index = index < 0 ? index + 7 : index;

        weeklySales[index] += order.totalAmount;
      }
    }
  }

  // calculate Order Status Data:
  void _calculateOrderStatusData() {
    // Reset status data:
    orderStatusData.clear();

    // Map to store total amounts for each status:
    totalAmounts.value = {for (var status in OrderStatus.values) status: 0.0};

    for (var order in orderController.allItems) {
      // count orders:
      final status = order.status;
      orderStatusData[status] = (orderStatusData[status] ?? 0) + 1;

      // Calculate total amounts for each status:
      totalAmounts[status] = (totalAmounts[status] ?? 0) + order.totalAmount;
    }
  }

  // Display status name:
  String getDisplayStatusName(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.processing:
        return 'Processing';
      case OrderStatus.shipped:
        return 'Shipped';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.cancelled:
        return 'Cancelled';
      default:
        return 'Unknown';
    }
  }

  @override
  bool containsSearchQuery(dynamic item, String query) => false;

  @override
  Future<void> deleteItem(dynamic item) async {}
}
