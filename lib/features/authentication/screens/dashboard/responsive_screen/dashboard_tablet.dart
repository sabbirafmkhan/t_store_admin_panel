import 'package:flutter/material.dart';
import 'package:t_store_admin_panel/features/authentication/screens/dashboard/widgets/dashboard_card.dart';
import 'package:t_store_admin_panel/utils/constants/sizes.dart';

class DashboardTabletScreen extends StatelessWidget {
  const DashboardTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading:
              Text(
                'Dashboard',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Cards:
              const Row(
                children: [
                  Expanded(
                    child: TDashboardCard(
                      title: 'Sales total',
                      subTitle: '\$365.6',
                      stats: 25,
                    ),
                  ),
                  SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(
                    child: TDashboardCard(
                      title: 'Average Order Value',
                      subTitle: '\$25',
                      stats: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Row(
                children: [
                  Expanded(
                    child: TDashboardCard(
                      title: 'Total Order',
                      subTitle: '36',
                      stats: 44,
                    ),
                  ),
                  SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(
                    child: TDashboardCard(
                      title: 'Visitors',
                      subTitle: '25035',
                      stats: 2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
