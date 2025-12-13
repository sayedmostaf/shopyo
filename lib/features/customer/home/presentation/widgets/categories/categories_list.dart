import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/features/admin/add_categories/data/models/get_all_categories_response.dart';
import 'package:shopyo/features/customer/home/presentation/widgets/categories/category_item.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key, required this.categoriesList});
  final List<GetAllCategoriesModel> categoriesList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h),
      child: SizedBox(
        height: 125.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoryItem(
              image: categoriesList[index].image ?? '',
              title: categoriesList[index].name ?? '',
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: 15.w),
          itemCount: categoriesList.length,
        ),
      ),
    );
  }
}
