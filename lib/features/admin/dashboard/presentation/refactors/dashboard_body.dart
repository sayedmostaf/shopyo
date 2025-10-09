import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/core/style/images/app_images.dart';
import 'package:shopyo/features/admin/dashboard/presentation/widgets/dashboard_container.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
      child: RefreshIndicator(
        child: ListView(
          children: [
            DashboardContainer(
              title: 'Products',
              number: '0',
              image: AppImages.productsDrawer,
              isLoading: false,
            ),
            SizedBox(height: 20.h),
            DashboardContainer(
              title: 'Categories',
              number: '0',
              image: AppImages.categoriesDrawer,
              isLoading: false,
            ),
            SizedBox(height: 20.h),
            DashboardContainer(
              title: 'Users',
              number: '0',
              image: AppImages.usersDrawer,
              isLoading: false,
            ),
          ],
        ),
        onRefresh: () async {},
      ),
    );
  }
}
