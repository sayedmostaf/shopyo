import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:shopyo/core/common/bottom_sheet/custom_bottom_sheet.dart';
import 'package:shopyo/core/common/widgets/custom_button.dart';
import 'package:shopyo/core/common/widgets/text_app.dart';
import 'package:shopyo/core/di/injection_container.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/core/style/colors/colors_dark.dart';
import 'package:shopyo/core/style/fonts/font_family_helper.dart';
import 'package:shopyo/core/style/fonts/font_weight_helper.dart';
import 'package:shopyo/features/admin/add_categories/presentation/blocs/create_category/create_category_bloc.dart';
import 'package:shopyo/features/admin/add_categories/presentation/blocs/get_all_admin_categories/get_all_admin_categories_bloc.dart';
import 'package:shopyo/features/admin/add_categories/presentation/widgets/create/create_category_bottom_sheet_widget.dart';

class CreateCategory extends StatelessWidget {
  const CreateCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(
          text: 'Get All Categories',
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeightHelper.medium,
            fontFamily: FontFamilyHelper.poppinsEnglish,
          ),
        ),
        CustomButton(
          onPressed: () {
            CustomBottomSheet.showModalBottomSheetContainer(
              context: context,
              widget: MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => sl<CreateCategoryBloc>()),
                  BlocProvider(create: (context) => sl<UploadImageCubit>()),
                ],
                child: CreateCategoryBottomSheetWidget(),
              ),
              whenComplete: () {
                context.read<GetAllAdminCategoriesBloc>().add(
                  GetAllAdminCategoriesEvent.fetchAdminCategories(
                    isNotLoading: false,
                  ),
                );
              },
            );
          },
          backgroundColor: ColorsDark.blueDark,
          text: 'Add',
          width: 90.w,
          height: 35.h,
          lastRadius: 10,
          threeRadius: 10,
        ),
      ],
    );
  }
}
