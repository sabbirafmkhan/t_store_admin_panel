import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store_admin_panel/common/widgets/icons/table_action_icon_buttons.dart';
import 'package:t_store_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:t_store_admin_panel/routes/routes.dart';
import 'package:t_store_admin_panel/utils/constants/colors.dart';
import 'package:t_store_admin_panel/utils/constants/enums.dart';
import 'package:t_store_admin_panel/utils/constants/image_strings.dart';
import 'package:t_store_admin_panel/utils/constants/sizes.dart';
import 'package:t_store_admin_panel/utils/device/device_utility.dart';

class BrandRows extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow2(
      cells: [
        DataCell(
          Row(
            children: [
              const TRoundedImage(
                width: 50,
                height: 50,
                padding: TSizes.sm,
                image: TImages.adidasLogo,
                imageType: ImageType.asset,
                borderRadius: TSizes.borderRadiusMd,
                backgroundColor: TColors.primaryBackground,
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Expanded(
                child: Text(
                  'Adidas',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(Get.context!)
                      .textTheme
                      .bodyLarge!
                      .apply(color: TColors.primary),
                ),
              ),
            ],
          ),
        ),
        DataCell(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: TSizes.sm),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Wrap(
                spacing: TSizes.xs,
                direction: TDeviceUtils.isMobileScreen(Get.context!)
                    ? Axis.vertical
                    : Axis.horizontal,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: TDeviceUtils.isMobileScreen(Get.context!)
                          ? 0
                          : TSizes.xs,
                    ),
                    child: const Chip(
                      label: Text('Shoes'),
                      padding: EdgeInsets.all(TSizes.xs),
                    ),
                  ), // Padding
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: TDeviceUtils.isMobileScreen(Get.context!)
                          ? 0
                          : TSizes.xs,
                    ),
                    child: const Chip(
                        label: Text('TrackSuits'),
                        padding: EdgeInsets.all(TSizes.xs)),
                  ), // Padding
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: TDeviceUtils.isMobileScreen(Get.context!)
                            ? 0
                            : TSizes.xs),
                    child: const Chip(
                      label: Text('Joggers'),
                      padding: EdgeInsets.all(TSizes.xs),
                    ),
                  ), // Padding
                ],
              ), // Wrap
            ), // SingleChildScrollView
          ), // Padding
        ),
        const DataCell(Icon(
          Iconsax.heart5,
          color: TColors.primary,
        )),
        DataCell(Text(DateTime.now().toString())),
        DataCell(TTableActionButtons(
          onEditPressed: () => Get.toNamed(TRoutes.editBrand, arguments: ''),
          onDeletePressed: () {},
        )),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 20;

  @override
  int get selectedRowCount => 0;
}
