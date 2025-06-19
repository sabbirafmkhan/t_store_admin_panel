import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:t_store_admin_panel/features/shop/models/order_model.dart';
import 'package:t_store_admin_panel/routes/routes.dart';
import 'package:t_store_admin_panel/utils/constants/colors.dart';
import 'package:t_store_admin_panel/utils/constants/enums.dart';
import 'package:t_store_admin_panel/utils/constants/sizes.dart';
import 'package:t_store_admin_panel/utils/helpers/helper_functions.dart';

class CustomerOrdersRows extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    final order = OrderModel(
        id: 'id',
        status: OrderStatus.shipped,
        totalAmount: 235.5,
        orderDate: DateTime.now());
    const totalAmount = '2563.5';
    return DataRow2(
      selected: false,
      onTap: () => Get.toNamed(TRoutes.orderDetails, arguments: order),
      cells: [
        DataCell(
          Text(
            order.id,
            style: Theme.of(Get.context!)
                .textTheme
                .bodyLarge!
                .apply(color: TColors.primary),
          ),
        ),
        DataCell(Text(order.formattedOrderDate)),
        const DataCell(Text('${5} Items')),
        DataCell(
          TRoundedContainer(
            radius: TSizes.cardRadiusSm,
            padding: const EdgeInsets.symmetric(
                vertical: TSizes.sm, horizontal: TSizes.md),
            backgroundColor: THelperFunctions.getOrderStatusColor(order.status)
                .withOpacity(0.1),
            child: Text(
              order.status.name.capitalize!.toString(),
              style: TextStyle(
                color: THelperFunctions.getOrderStatusColor(order.status),
              ),
            ), // Text
          ),
        ),
        const DataCell(Text('\$$totalAmount')),
      ],
    ); // DataRow2
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 5;

  @override
  int get selectedRowCount => 0;
}
