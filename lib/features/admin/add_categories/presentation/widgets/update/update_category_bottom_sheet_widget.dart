import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:shopyo/core/common/toast/show_toast.dart';
import 'package:shopyo/core/common/widgets/custom_button.dart';
import 'package:shopyo/core/common/widgets/custom_text_field.dart';
import 'package:shopyo/core/common/widgets/text_app.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/core/style/colors/colors_dark.dart';
import 'package:shopyo/core/style/fonts/font_weight_helper.dart';
import 'package:shopyo/features/admin/add_categories/data/models/update_category_request_body.dart';
import 'package:shopyo/features/admin/add_categories/presentation/blocs/update_category/update_category_bloc.dart';
import 'package:shopyo/features/admin/add_categories/presentation/widgets/update/update_upload_image.dart';

class UpdateCategoryBottomSheetWidget extends StatefulWidget {
  const UpdateCategoryBottomSheetWidget({
    super.key,
    required this.imageUrl,
    required this.categoryName,
    required this.categoryId,
  });
  final String imageUrl, categoryName, categoryId;

  @override
  State<UpdateCategoryBottomSheetWidget> createState() =>
      _UpdateCategoryBottomSheetWidgetState();
}

class _UpdateCategoryBottomSheetWidgetState
    extends State<UpdateCategoryBottomSheetWidget> {
  TextEditingController nameCategoryController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    nameCategoryController.text = widget.categoryName;
  }

  @override
  void dispose() {
    nameCategoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: TextApp(
              text: 'Update Category',
              theme: context.textStyle.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          TextApp(
            text: 'Update a photo',
            theme: context.textStyle.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeightHelper.medium,
            ),
          ),
          SizedBox(height: 10.h),
          UpdateUploadImage(imageUrl: widget.imageUrl),
          SizedBox(height: 20.h),
          TextApp(
            text: 'Update the Category Name',
            theme: context.textStyle.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeightHelper.medium,
            ),
          ),
          SizedBox(height: 10.h),
          CustomTextField(
            controller: nameCategoryController,
            keyboardType: TextInputType.name,
            hintText: 'Category Name',
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 2) {
                return 'Please enter a valid category name';
              }
              return null;
            },
          ),
          SizedBox(height: 20.h),
          BlocConsumer<UpdateCategoryBloc, UpdateCategoryState>(
            listener: (context, state) {
              state.whenOrNull(
                success: () {
                  context.pop();
                  ShowToast.showToastSuccessTop(
                    message: '${nameCategoryController.text} Update Success',
                    seconds: 2,
                  );
                },
                error: (error) {
                  ShowToast.showToastErrorTop(message: error);
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                loading: () {
                  return Container(
                    height: 50.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: ColorsDark.blueDark,
                      ),
                    ),
                  );
                },
                orElse: () {
                  return CustomButton(
                    onPressed: () {
                      _validUpdateCategory(context);
                    },
                    text: "Update a new category",
                    width: MediaQuery.of(context).size.width,
                    height: 50.h,
                    textColor: ColorsDark.blueDark,
                    lastRadius: 20,
                    threeRadius: 20,
                    backgroundColor: ColorsDark.white,
                  );
                },
              );
            },
          ),

          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  void _validUpdateCategory(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<UpdateCategoryBloc>().add(
        UpdateCategoryEvent.updateCategory(
          body: UpdateCategoryRequestBody(
            name: nameCategoryController.text.trim(),
            image: context.read<UploadImageCubit>().getImageUrl.isEmpty
                ? widget.imageUrl
                : context.read<UploadImageCubit>().getImageUrl,
            id: widget.categoryId,
          ),
        ),
      );
    }
  }
}
