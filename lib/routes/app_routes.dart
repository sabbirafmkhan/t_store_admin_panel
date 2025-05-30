import 'package:get/get.dart';
import 'package:t_store_admin_panel/features/authentication/screens/forget_password/forget_password.dart';
import 'package:t_store_admin_panel/features/authentication/screens/login/login.dart';
import 'package:t_store_admin_panel/features/authentication/screens/reset_password/reset_password.dart';
import 'package:t_store_admin_panel/features/shop/screens/dashboard/dashboard.dart';
import 'package:t_store_admin_panel/routes/routes.dart';
import 'package:t_store_admin_panel/routes/routes_middleware.dart';

class TAppRoutes {
  static final List<GetPage> pages = [
    // Dashboard
    GetPage(name: TRoutes.login, page: () => const LoginScreen()),
    GetPage(
        name: TRoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(
        name: TRoutes.resetPassword, page: () => const ResetPasswordScreen()),
    GetPage(
        name: TRoutes.dashboard,
        page: () => const DashboardScreen(),
        middlewares: [TRouteMiddleware()]),
    // GetPage(
    //     name: TRoutes.media,
    //     page: () => const MediaScreen(),
    //     middlewares: [TRouteMiddleware()]),
    //
    // // Banners:
    // GetPage(
    //     name: TRoutes.banners,
    //     page: () => const BannersScreen(),
    //     middlewares: [TRouteMiddleware()]),
    // GetPage(
    //     name: TRoutes.createBanner,
    //     page: () => const CreateBannerScreen(),
    //     middlewares: [TRouteMiddleware()]),
    // GetPage(
    //     name: TRoutes.editBanner,
    //     page: () => const EditBannerScreen(),
    //     middlewares: [TRouteMiddleware()]),
    //
    // // Products
    // GetPage(
    //     name: TRoutes.products,
    //     page: () => const ProductsScreen(),
    //     middlewares: [TRouteMiddleware()]),
    // GetPage(
    //     name: TRoutes.createProduct,
    //     page: () => const CreateProductScreen(),
    //     middlewares: [TRouteMiddleware()]),
    // GetPage(
    //     name: TRoutes.editProduct,
    //     page: () => const EditProductScreen(),
    //     middlewares: [TRouteMiddleware()]),
    //
    // // Categories
    // GetPage(
    //     name: TRoutes.categories,
    //     page: () => const CategoriesScreen(),
    //     middlewares: [TRouteMiddleware()]),
    // GetPage(
    //     name: TRoutes.createCategory,
    //     page: () => const CreateCategoryScreen(),
    //     middlewares: [TRouteMiddleware()]),
    // GetPage(
    //     name: TRoutes.editCategory,
    //     page: () => const EditCategoryScreen(),
    //     middlewares: [TRouteMiddleware()]),
    //
    // // Brand
    // GetPage(
    //     name: TRoutes.brands,
    //     page: () => const BrandsScreen(),
    //     middlewares: [TRouteMiddleware()]),
    // GetPage(
    //     name: TRoutes.createBrand,
    //     page: () => const CreateBrandScreen(),
    //     middlewares: [TRouteMiddleware()]),
    // GetPage(
    //     name: TRoutes.editBrand,
    //     page: () => const EditBrandScreen(),
    //     middlewares: [TRouteMiddleware()]),
    //
    // // Customers
    // GetPage(
    //     name: TRoutes.customers,
    //     page: () => const CustomersScreen(),
    //     middlewares: [TRouteMiddleware()]),
    // GetPage(
    //     name: TRoutes.createCustomer,
    //     page: () => const CreateCustomerScreen(),
    //     middlewares: [TRouteMiddleware()]),
    // GetPage(
    //     name: TRoutes.customerDetails,
    //     page: () => const CustomerDetailsScreen(),
    //     middlewares: [TRouteMiddleware()]),
    //
    // // Orders
    // GetPage(
    //     name: TRoutes.orders,
    //     page: () => const OrdersScreen(),
    //     middlewares: [TRouteMiddleware()]),
    // GetPage(
    //     name: TRoutes.createOrder,
    //     page: () => const CreateOrderScreen(),
    //     middlewares: [TRouteMiddleware()]),
    // GetPage(
    //     name: TRoutes.customerOrder,
    //     page: () => const CustomerOrderScreen(),
    //     middlewares: [TRouteMiddleware()]),
  ];
}
