// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i12;
import 'package:stacked/stacked.dart' as _i11;
import 'package:stacked_services/stacked_services.dart' as _i10;

import '../models/product_model.dart' as _i13;
import '../ui/views/add_product/add_product_view.dart' as _i4;
import '../ui/views/dashboard/dashboard_view.dart' as _i7;
import '../ui/views/full_screen_image/full_screen_image_view.dart' as _i8;
import '../ui/views/home/home_view.dart' as _i1;
import '../ui/views/order_product/order_product_view.dart' as _i6;
import '../ui/views/order_success/order_success_view.dart' as _i5;
import '../ui/views/orders/orders_view.dart' as _i9;
import '../ui/views/product/product_view.dart' as _i3;
import '../ui/views/startup/startup_view.dart' as _i2;

final stackedRouter =
    StackedRouterWeb(navigatorKey: _i10.StackedService.navigatorKey);

class StackedRouterWeb extends _i11.RootStackRouter {
  StackedRouterWeb({_i12.GlobalKey<_i12.NavigatorState>? navigatorKey})
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    HomeViewRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomeView(),
      );
    },
    StartupViewRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.StartupView(),
      );
    },
    ProductViewRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.ProductView(),
      );
    },
    AddProductViewRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.AddProductView(),
      );
    },
    OrderSuccessViewRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.OrderSuccessView(),
      );
    },
    OrderProductViewRoute.name: (routeData) {
      final args = routeData.argsAs<OrderProductViewArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.OrderProductView(
          quantity: args.quantity,
          product: args.product,
          colorId: args.colorId,
          key: args.key,
        ),
      );
    },
    DashboardViewRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.DashboardView(),
      );
    },
    FullScreenImageViewRoute.name: (routeData) {
      final args = routeData.argsAs<FullScreenImageViewArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.FullScreenImageView(
          args.image,
          key: args.key,
        ),
      );
    },
    OrdersViewRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.OrdersView(),
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          HomeViewRoute.name,
          path: '/home-view',
        ),
        _i11.RouteConfig(
          StartupViewRoute.name,
          path: '/',
        ),
        _i11.RouteConfig(
          ProductViewRoute.name,
          path: '/product-view',
        ),
        _i11.RouteConfig(
          AddProductViewRoute.name,
          path: '/add-product-view',
        ),
        _i11.RouteConfig(
          OrderSuccessViewRoute.name,
          path: '/order-success-view',
        ),
        _i11.RouteConfig(
          OrderProductViewRoute.name,
          path: '/order-product-view',
        ),
        _i11.RouteConfig(
          DashboardViewRoute.name,
          path: '/dashboard-view',
        ),
        _i11.RouteConfig(
          FullScreenImageViewRoute.name,
          path: '/full-screen-image-view',
        ),
        _i11.RouteConfig(
          OrdersViewRoute.name,
          path: '/orders-view',
        ),
      ];
}

/// generated route for
/// [_i1.HomeView]
class HomeViewRoute extends _i11.PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '/home-view',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i2.StartupView]
class StartupViewRoute extends _i11.PageRouteInfo<void> {
  const StartupViewRoute()
      : super(
          StartupViewRoute.name,
          path: '/',
        );

  static const String name = 'StartupView';
}

/// generated route for
/// [_i3.ProductView]
class ProductViewRoute extends _i11.PageRouteInfo<void> {
  const ProductViewRoute()
      : super(
          ProductViewRoute.name,
          path: '/product-view',
        );

  static const String name = 'ProductView';
}

/// generated route for
/// [_i4.AddProductView]
class AddProductViewRoute extends _i11.PageRouteInfo<void> {
  const AddProductViewRoute()
      : super(
          AddProductViewRoute.name,
          path: '/add-product-view',
        );

  static const String name = 'AddProductView';
}

/// generated route for
/// [_i5.OrderSuccessView]
class OrderSuccessViewRoute extends _i11.PageRouteInfo<void> {
  const OrderSuccessViewRoute()
      : super(
          OrderSuccessViewRoute.name,
          path: '/order-success-view',
        );

  static const String name = 'OrderSuccessView';
}

/// generated route for
/// [_i6.OrderProductView]
class OrderProductViewRoute extends _i11.PageRouteInfo<OrderProductViewArgs> {
  OrderProductViewRoute({
    required int quantity,
    required _i13.ProductModel product,
    required int colorId,
    _i12.Key? key,
  }) : super(
          OrderProductViewRoute.name,
          path: '/order-product-view',
          args: OrderProductViewArgs(
            quantity: quantity,
            product: product,
            colorId: colorId,
            key: key,
          ),
        );

  static const String name = 'OrderProductView';
}

class OrderProductViewArgs {
  const OrderProductViewArgs({
    required this.quantity,
    required this.product,
    required this.colorId,
    this.key,
  });

  final int quantity;

  final _i13.ProductModel product;

  final int colorId;

  final _i12.Key? key;

  @override
  String toString() {
    return 'OrderProductViewArgs{quantity: $quantity, product: $product, colorId: $colorId, key: $key}';
  }
}

/// generated route for
/// [_i7.DashboardView]
class DashboardViewRoute extends _i11.PageRouteInfo<void> {
  const DashboardViewRoute()
      : super(
          DashboardViewRoute.name,
          path: '/dashboard-view',
        );

  static const String name = 'DashboardView';
}

/// generated route for
/// [_i8.FullScreenImageView]
class FullScreenImageViewRoute
    extends _i11.PageRouteInfo<FullScreenImageViewArgs> {
  FullScreenImageViewRoute({
    required String image,
    _i12.Key? key,
  }) : super(
          FullScreenImageViewRoute.name,
          path: '/full-screen-image-view',
          args: FullScreenImageViewArgs(
            image: image,
            key: key,
          ),
        );

  static const String name = 'FullScreenImageView';
}

class FullScreenImageViewArgs {
  const FullScreenImageViewArgs({
    required this.image,
    this.key,
  });

  final String image;

  final _i12.Key? key;

  @override
  String toString() {
    return 'FullScreenImageViewArgs{image: $image, key: $key}';
  }
}

/// generated route for
/// [_i9.OrdersView]
class OrdersViewRoute extends _i11.PageRouteInfo<void> {
  const OrdersViewRoute()
      : super(
          OrdersViewRoute.name,
          path: '/orders-view',
        );

  static const String name = 'OrdersView';
}

extension RouterStateExtension on _i10.RouterService {
  Future<dynamic> navigateToHomeView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToStartupView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToProductView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const ProductViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToAddProductView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const AddProductViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToOrderSuccessView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const OrderSuccessViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToOrderProductView({
    required int quantity,
    required _i13.ProductModel product,
    required int colorId,
    _i12.Key? key,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      OrderProductViewRoute(
        quantity: quantity,
        product: product,
        colorId: colorId,
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToDashboardView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const DashboardViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToFullScreenImageView({
    required String image,
    _i12.Key? key,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      FullScreenImageViewRoute(
        image: image,
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToOrdersView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const OrdersViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHomeView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithStartupView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithProductView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const ProductViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithAddProductView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const AddProductViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithOrderSuccessView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const OrderSuccessViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithOrderProductView({
    required int quantity,
    required _i13.ProductModel product,
    required int colorId,
    _i12.Key? key,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      OrderProductViewRoute(
        quantity: quantity,
        product: product,
        colorId: colorId,
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithDashboardView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const DashboardViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithFullScreenImageView({
    required String image,
    _i12.Key? key,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      FullScreenImageViewRoute(
        image: image,
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithOrdersView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const OrdersViewRoute(),
      onFailure: onFailure,
    );
  }
}
