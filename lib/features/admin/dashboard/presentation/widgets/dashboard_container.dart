import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/core/common/loading/loading_shimmer.dart';
import 'package:shopyo/core/common/widgets/custom_container_linear_admin.dart';
import 'package:shopyo/core/common/widgets/text_app.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/core/style/fonts/font_family_helper.dart';
import 'package:shopyo/core/style/fonts/font_weight_helper.dart';

class DashboardContainer extends StatelessWidget {
  const DashboardContainer({
    super.key,
    required this.title,
    required this.number,
    required this.image,
    required this.isLoading,
  });
  final String title, number, image;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 130.h,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                TextApp(
                  text: title,
                  theme: context.textStyle.copyWith(
                    fontSize: 24.sp,
                    fontWeight: FontWeightHelper.bold,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                  ),
                ),
                Spacer(),
                if (isLoading)
                  LoadingShimmer(width: 100.w, height: 30.h)
                else
                  TextApp(
                    text: number,
                    theme: context.textStyle.copyWith(
                      fontSize: 24.sp,
                      fontWeight: FontWeightHelper.bold,
                      fontFamily: FontFamilyHelper.poppinsEnglish,
                    ),
                  ),
                Spacer(),
              ],
            ),
            SizedBox(height: 90, child: Image.asset(image)),
          ],
        ),
      ),
    );
  }
}
