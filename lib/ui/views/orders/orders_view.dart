import 'package:flutter/material.dart';
import 'package:kitchy_store/ui/common/app_colors.dart';
import 'package:kitchy_store/ui/common/app_spacing.dart';
import 'package:kitchy_store/ui/common/responsive_sizer.dart';
import 'package:kitchy_store/ui/common/widgets/custom_text.dart';
import 'package:kitchy_store/ui/common/widgets/gap.dart';
import 'package:stacked/stacked.dart';

import 'orders_viewmodel.dart';

class OrdersView extends StackedView<OrdersViewModel> {
  const OrdersView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OrdersViewModel viewModel,
    Widget? child,
  ) {
    ResponsiveSizer.init(context);
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: "طلباتي"),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton(
                  items: const [
                    DropdownMenuItem(
                      value: "pending",
                      child: Text("لم تتصل بها بعد"),
                    ),
                    DropdownMenuItem(
                      value: "called",
                      child: Text("تم تأكيدها"),
                    ),
                    DropdownMenuItem(
                      value: "cancelled",
                      child: Text("ملغاة"),
                    ),
                    DropdownMenuItem(
                      value: "sent",
                      child: Text("تم ارسالها لشركة الشحن"),
                    ),
                    DropdownMenuItem(
                      value: "delivered",
                      child: Text("تم التوصيل"),
                    ),
                    DropdownMenuItem(
                      value: "failed",
                      child: Text("فشل التوصيل"),
                    ),
                  ],
                  onChanged: (v) {
                    viewModel.setFilter(v!);
                  }),
              Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) => VGap(AppSpacing.px12),
                    itemCount: viewModel.orders.length,
                    itemBuilder: (c, i) => ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          tileColor: Colors.white,
                          leading: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: viewModel.orders[i].status == "delivered"
                                    ? AppColors.greenKre.withValues(alpha: .1)
                                    : [
                                        'failed',
                                        'cancelled'
                                      ].contains(viewModel.orders[i].status)
                                        ? Colors.red.withValues(alpha: .1)
                                        : Colors.blueAccent
                                            .withValues(alpha: .1)),
                            child: Text(viewModel.orders[i].status),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(viewModel.orders[i].fullName),
                              Text(viewModel.orders[i].mobileNumber),
                              Text(
                                  "${viewModel.orders[i].items.first.quantity} ${viewModel.orders[i].items.first.colorR!.name}"),
                            ],
                          ),
                          trailing: DropdownButton(
                              onChanged: (value) {},
                              items: [
                                if (viewModel.orders[i].status == "pending")
                                  DropdownMenuItem(
                                    value: 'cancelled',
                                    child: const Text("الغاء"),
                                    onTap: () {
                                      viewModel.updateOrderStatus(
                                          viewModel.orders[i].id, "cancelled");
                                    },
                                  ),
                                if (viewModel.orders[i].status == "pending")
                                  DropdownMenuItem(
                                    value: 'called',
                                    child: const Text("تم الاتصال"),
                                    onTap: () {
                                      viewModel.updateOrderStatus(
                                          viewModel.orders[i].id, "called");
                                    },
                                  ),
                                if (viewModel.orders[i].status == "called")
                                  DropdownMenuItem(
                                    value: 'sent',
                                    child: const Text("تم الارسال"),
                                    onTap: () {
                                      viewModel.updateOrderStatus(
                                          viewModel.orders[i].id, "sent");
                                    },
                                  ),
                                if (viewModel.orders[i].status == "sent")
                                  DropdownMenuItem(
                                    value: 'delivered',
                                    child: const Text("تم التوصيل"),
                                    onTap: () {
                                      viewModel.updateOrderStatus(
                                          viewModel.orders[i].id, "delivered");
                                    },
                                  ),
                                if (viewModel.orders[i].status == "sent")
                                  DropdownMenuItem(
                                    value: 'failed',
                                    child: const Text("تم الارجاع"),
                                    onTap: () {
                                      viewModel.updateOrderStatus(
                                          viewModel.orders[i].id, "failed");
                                    },
                                  )
                              ],
                              icon: const Icon(Icons.menu)),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  OrdersViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OrdersViewModel();

  @override
  void onViewModelReady(OrdersViewModel viewModel) {
    // TODO: implement onViewModelReady
    super.onViewModelReady(viewModel);
    viewModel.getOrders();
  }
}
