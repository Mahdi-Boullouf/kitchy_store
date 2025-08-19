import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitchy_store/app/app.locator.dart';
import 'package:kitchy_store/app/app.router.dart';
import 'package:kitchy_store/ui/common/app_colors.dart';
import 'package:kitchy_store/ui/common/app_spacing.dart';
import 'package:kitchy_store/ui/common/responsive_sizer.dart';
import 'package:kitchy_store/ui/common/widgets/gap.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'dashboard_viewmodel.dart';
import 'package:kitchy_store/ui/common/widgets/custom_text.dart';

class DashboardView extends StackedView<DashboardViewModel> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DashboardViewModel viewModel,
    Widget? child,
  ) {
    ResponsiveSizer.init(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          locator<RouterService>().navigateToAddProductView();
        },
        backgroundColor: AppColors.primary,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          "Kitchy Dashboard",
          style: GoogleFonts.deliusSwashCaps()
              .copyWith(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText.title('نظرة عامة'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCard('المنتجات', "45"),
                _buildCard('الطلبات', "12"),
              ],
            ),
            // SizedBox(height:AppSpacing.px8),
            Row(
              children: [
                _buildCard('الأرباح', "78"),
                _buildCard('الروتور', "78"),
              ],
            ),
            const SizedBox(height: 24),
            const CustomText.title('منتجاتي'),

            GridView.builder(
              shrinkWrap: true,
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                return _buildProductCard();
              },
            )

            // You can later add more widgets like charts or tables
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              "https://picsum.photos/200/300",
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.labelMedium("منتج عشوائي"),
                SizedBox(height: 4),
                CustomText.labelRegular("2000 DZD"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String value) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            CustomText.smallParagraphMedium(title),
            const SizedBox(height: 8),
            CustomText.largeTitle(value),
          ],
        ),
      ),
    );
  }

  @override
  DashboardViewModel viewModelBuilder(BuildContext context) =>
      DashboardViewModel();
}
