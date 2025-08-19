import 'package:kitchy_store/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:kitchy_store/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:kitchy_store/ui/views/home/home_view.dart';
import 'package:kitchy_store/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:kitchy_store/ui/views/product/product_view.dart';
import 'package:kitchy_store/ui/views/add_product/add_product_view.dart';
import 'package:kitchy_store/ui/views/order_success/order_success_view.dart';
import 'package:kitchy_store/ui/views/order_product/order_product_view.dart';
import 'package:kitchy_store/services/orders_service.dart';
import 'package:kitchy_store/services/products_service.dart';
import 'package:kitchy_store/ui/views/dashboard/dashboard_view.dart';
import 'package:kitchy_store/ui/views/full_screen_image/full_screen_image_view.dart';
import 'package:kitchy_store/ui/views/orders/orders_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: ProductView),
    MaterialRoute(page: AddProductView),
    MaterialRoute(page: OrderSuccessView),
    MaterialRoute(page: OrderProductView),
    MaterialRoute(page: DashboardView),
    MaterialRoute(page: FullScreenImageView),
    MaterialRoute(page: OrdersView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: RouterService),

    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: OrdersService),
    LazySingleton(classType: ProductsService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
