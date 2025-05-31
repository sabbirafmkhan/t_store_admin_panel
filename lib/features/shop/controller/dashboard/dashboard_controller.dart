import 'package:get/get.dart';
import 'package:t_store_admin_panel/features/shop/models/order_model.dart';
import 'package:t_store_admin_panel/utils/constants/enums.dart';
import 'package:t_store_admin_panel/utils/helpers/helper_functions.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();

  /// variables
  final RxList<double> weeklySales = <double>[].obs;

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
      totalAmount: 256,
      orderDate: DateTime(2025, 5, 20),
      deliveryDate: DateTime(2025, 6, 20),
    ),
    OrderModel(
      id: 'CWT0003',
      status: OrderStatus.delivered,
      totalAmount: 256,
      orderDate: DateTime(2025, 5, 20),
      deliveryDate: DateTime(2025, 5, 30),
    ),
    OrderModel(
      id: 'CWT0004',
      status: OrderStatus.delivered,
      totalAmount: 256,
      orderDate: DateTime(2025, 5, 20),
      deliveryDate: DateTime(2025, 5, 29),
    ),
    OrderModel(
      id: 'CWT0005',
      status: OrderStatus.delivered,
      totalAmount: 256,
      orderDate: DateTime(2025, 5, 20),
      deliveryDate: DateTime(2025, 5, 31),
    ),
  ];

  @override
  void onInit() {
    _calculateWeeklySales();
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
}
