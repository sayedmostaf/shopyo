import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/core/common/dialogs/custom_dialog.dart';
import 'package:shopyo/core/common/widgets/text_app.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/core/routes/app_routes.dart';
import 'package:shopyo/core/service/shared_pref/pref_keys.dart';
import 'package:shopyo/core/service/shared_pref/shared_pref.dart';
import 'package:shopyo/core/style/fonts/font_family_helper.dart';
import 'package:shopyo/core/style/fonts/font_weight_helper.dart';
import 'package:shopyo/features/admin/add_categories/presentation/screens/add_categories_screen.dart';
import 'package:shopyo/features/admin/add_notifications/presentation/screens/add_notifications_screen.dart';
import 'package:shopyo/features/admin/add_products/presentation/screens/add_products_screen.dart';
import 'package:shopyo/features/admin/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:shopyo/features/admin/users/presentation/screens/users_screen.dart';

List<DrawerItemModel> adminDrawerList(BuildContext context) {
  return [
    DrawerItemModel(
      icon: Icon(Icons.dashboard, color: Colors.white),
      title: TextApp(
        text: 'Dashboard',
        theme: context.textStyle.copyWith(
          fontSize: 17.sp,
          color: Colors.white,
          fontFamily: FontFamilyHelper.poppinsEnglish,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
      page: const DashBoardScreen(),
    ),
    DrawerItemModel(
      icon: Icon(Icons.category_outlined, color: Colors.white),
      title: TextApp(
        text: 'Categories',
        theme: context.textStyle.copyWith(
          fontSize: 17.sp,
          color: Colors.white,
          fontFamily: FontFamilyHelper.poppinsEnglish,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
      page: const AddCategoriesScreen(),
    ),
    DrawerItemModel(
      icon: Icon(Icons.production_quantity_limits, color: Colors.white),
      title: TextApp(
        text: 'Products',
        theme: context.textStyle.copyWith(
          fontSize: 17.sp,
          color: Colors.white,
          fontFamily: FontFamilyHelper.poppinsEnglish,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
      page: const AddProductsScreen(),
    ),
    DrawerItemModel(
      icon: Icon(Icons.people_alt_rounded, color: Colors.white),
      title: TextApp(
        text: 'Users',
        theme: context.textStyle.copyWith(
          fontSize: 17.sp,
          color: Colors.white,
          fontFamily: FontFamilyHelper.poppinsEnglish,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
      page: const UsersScreen(),
    ),
    DrawerItemModel(
      icon: Icon(Icons.notifications_active, color: Colors.white),
      title: TextApp(
        text: 'Notifications',
        theme: context.textStyle.copyWith(
          fontSize: 17.sp,
          color: Colors.white,
          fontFamily: FontFamilyHelper.poppinsEnglish,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
      page: const AddNotificationsScreen(),
    ),
    DrawerItemModel(
      icon: Icon(Icons.exit_to_app, color: Colors.white),
      title: GestureDetector(
        onTap: () {
          CustomDialog.twoButtonDialog(
            context: context,
            textBody: 'Do you want to logout?',
            textButton1: 'Yes',
            textButton2: 'No',
            isLoading: false,
            onPressed: () async {
              final navigator = Navigator.of(context);
              await SharedPref().removePreference(PrefKeys.accessToken);
              await SharedPref().removePreference(PrefKeys.userId);
              await SharedPref().removePreference(PrefKeys.userRole);
              await navigator.pushNamedAndRemoveUntil(
                AppRoutes.login,
                (route) => false,
              );
            },
          );
        },
        child: Text(
          'Logout',
          style: TextStyle(
            color: Colors.white,
            fontFamily: FontFamilyHelper.poppinsEnglish,
            fontWeight: FontWeightHelper.bold,
            fontSize: 17,
          ),
        ),
      ),
      page: const UsersScreen(),
    ),
  ];
}

class DrawerItemModel {
  final Icon icon;
  final Widget title, page;
  DrawerItemModel({
    required this.icon,
    required this.title,
    required this.page,
  });
}
