import 'package:get/get.dart';
import 'package:t_store_admin_panel/features/shop/models/order_model.dart';
import 'package:t_store_admin_panel/utils/constants/enums.dart';
import 'package:t_store_admin_panel/utils/helpers/helper_functions.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();

  /// variables
  final RxList<double> weeklySales = <double>[].obs;
  final RxMap<OrderStatus, int> orderStatusData = <OrderStatus, int>{}.obs;
  final RxMap<OrderStatus, double> totalAmounts = <OrderStatus, double>{}.obs;

  /// Order
  static final List<OrderModel> orders = [
    OrderModel(
      id: 'CWT0001',
      status: OrderStatus.processing,
      totalAmount: 256,
      orderDate: DateTime(2025, 5, 20),
      deliveryDate: DateTime(2025, 6, 20),
    ),
    OrderModel(
      id: 'CWT0002',
      status: OrderStatus.shipped,
      totalAmount: 200,
      orderDate: DateTime(2025, 5, 20),
      deliveryDate: DateTime(2025, 6, 20),
    ),
    OrderModel(
      id: 'CWT0003',
      status: OrderStatus.delivered,
      totalAmount: 369,
      orderDate: DateTime(2025, 5, 20),
      deliveryDate: DateTime(2025, 5, 30),
    ),
    OrderModel(
      id: 'CWT0004',
      status: OrderStatus.delivered,
      totalAmount: 240,
      orderDate: DateTime(2025, 5, 20),
      deliveryDate: DateTime(2025, 5, 29),
    ),
    OrderModel(
      id: 'CWT0005',
      status: OrderStatus.delivered,
      totalAmount: 135,
      orderDate: DateTime(2025, 5, 20),
      deliveryDate: DateTime(2025, 5, 31),
    ),
  ];

  @override
  void onInit() {
    _calculateWeeklySales();
    _calculateOrderStatusData();
    super.onInit();
  }

  // Calculate weekly sales:
  void _calculateWeeklySales() {
    weeklySales.value = List<double>.filled(7, 0.0);

    for (var order in orders) {
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

    for (var order in orders) {
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
}
