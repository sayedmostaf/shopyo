import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:shopyo/core/common/bottom_sheet/custom_bottom_sheet.dart';
import 'package:shopyo/core/common/widgets/custom_container_linear_admin.dart';
import 'package:shopyo/core/common/widgets/text_app.dart';
import 'package:shopyo/core/di/injection_container.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/core/extensions/string_extension.dart';
import 'package:shopyo/core/style/fonts/font_family_helper.dart';
import 'package:shopyo/core/style/fonts/font_weight_helper.dart';
import 'package:shopyo/features/admin/add_products/presentation/blocs/update_product/update_product_bloc.dart';
import 'package:shopyo/features/admin/add_products/presentation/widgets/delete/delete_product_widget.dart';
import 'package:shopyo/features/admin/add_products/presentation/widgets/update/update_product_bottom_sheet.dart';

class ProductAdminItem extends StatelessWidget {
  const ProductAdminItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.categoryName,
    required this.productId,
    required this.price,
    required this.imageList,
  });
  final List<String> imageList;
  final String imageUrl, title, categoryName, price, productId;
  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 250.h,
      width: 165.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DeleteProductWidget(productId: productId),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  CustomBottomSheet.showModalBottomSheetContainer(
                    context: context,
                    widget: MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create: (context) => sl<UpdateProductBloc>(),
                        ),
                        BlocProvider(
                          create: (context) => sl<UploadImageCubit>(),
                        ),
                      ],
                      child: UpdateProductBottomSheet(imageList: imageList),
                    ),
                  );
                },
                icon: Icon(Icons.edit, color: Colors.green),
              ),
            ],
          ),
          Flexible(
            child: Center(
              child: CachedNetworkImage(
                imageUrl: imageUrl.imageProductFormate(),
                height: 200.h,
                width: 120.w,
                errorWidget: (context, url, error) =>
                    Icon(Icons.error, color: Colors.red, size: 70),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: TextApp(
              text: title,
              theme: context.textStyle.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeightHelper.bold,
                fontFamily: FontFamilyHelper.poppinsEnglish,
              ),
              maxLines: 1,
            ),
          ),
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: TextApp(
              text: categoryName,
              theme: context.textStyle.copyWith(
                fontSize: 13.sp,
                fontWeight: FontWeightHelper.medium,
              ),
              maxLines: 1,
            ),
          ),
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: TextApp(
              text: '\$ $price',
              theme: context.textStyle.copyWith(
                fontSize: 13.sp,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
