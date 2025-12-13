import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/core/common/widgets/custom_container_linear_customer.dart';
import 'package:shopyo/core/common/widgets/text_app.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/core/style/fonts/font_weight_helper.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.image, required this.title});
  final String image, title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomContainerLinearCustomer(
          width: 71.w,
          height: 71.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.contain,
              height: 71.h,
              width: 71.w,
              errorWidget: (context, url, error) =>
                  Icon(Icons.error, color: Colors.red, size: 30),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 35.h,
          width: 75.w,
          child: TextApp(
            text: title,
            textAlign: TextAlign.center,
            theme: context.textStyle.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
        ),
      ],
    );
  }
}
