import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/features/admin/add_categories/presentation/widgets/add_category_item.dart';
import 'package:shopyo/features/admin/add_categories/presentation/widgets/create/create_category.dart';

class AddCategoriesBody extends StatelessWidget {
  const AddCategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      child: Column(
        children: [
          CreateCategory(),
          AddCategoryItem(
            name: 'MacBook',
            image:
                'https://images.unsplash.com/photo-1541807084-5c52b6b3adef?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            categoryId: "1",
          ),
        ],
      ),
    );
  }
}
