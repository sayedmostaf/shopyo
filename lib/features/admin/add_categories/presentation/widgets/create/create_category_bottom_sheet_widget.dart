import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:shopyo/core/common/toast/show_toast.dart';
import 'package:shopyo/core/common/widgets/custom_button.dart';
import 'package:shopyo/core/common/widgets/custom_text_field.dart';
import 'package:shopyo/core/common/widgets/text_app.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/core/language/lang_keys.dart';
import 'package:shopyo/core/style/colors/colors_dark.dart';
import 'package:shopyo/core/style/fonts/font_family_helper.dart';
import 'package:shopyo/core/style/fonts/font_weight_helper.dart';
import 'package:shopyo/features/admin/add_categories/data/models/create_category_request_body.dart';
import 'package:shopyo/features/admin/add_categories/presentation/blocs/create_category/create_category_bloc.dart';
import 'package:shopyo/features/admin/add_categories/presentation/widgets/create/category_upload_image.dart';

class CreateCategoryBottomSheetWidget extends StatefulWidget {
  const CreateCategoryBottomSheetWidget({super.key});

  @override
  State<CreateCategoryBottomSheetWidget> createState() =>
      _CreateCategoryBottomSheetWidgetState();
}

class _CreateCategoryBottomSheetWidgetState
    extends State<CreateCategoryBottomSheetWidget> {
  TextEditingController nameCategoryController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    nameCategoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: TextApp(
                text: 'Create Category',
                theme: context.textStyle.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeightHelper.bold,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextApp(
                  text: 'Add a photo',
                  theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.medium,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                  ),
                ),
                BlocBuilder<UploadImageCubit, UploadImageState>(
                  builder: (context, state) {
                    return CustomButton(
                      lastRadius: 10,
                      threeRadius: 10,
                      onPressed: () {
                        context.read<UploadImageCubit>().removeImage();
                      },
                      text: 'Remove',
                      width: 120.w,
                      height: 35.h,
                      backgroundColor: Colors.red,
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 10.h),
            CategoryUploadImage(),
            SizedBox(height: 20.h),
            TextApp(
              text: 'Enter the Category Name',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
                fontFamily: FontFamilyHelper.poppinsEnglish,
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
            BlocConsumer<CreateCategoryBloc, CreateCategoryState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: () {
                    context.pop();
                    ShowToast.showToastSuccessTop(
                      seconds: 2,
                      message:
                          '${nameCategoryController.text} Created Successfully',
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
                      child: Center(
                        child: CircularProgressIndicator(
                          color: ColorsDark.blueDark,
                        ),
                      ),
                    );
                  },
                  orElse: () {
                    return CustomButton(
                      onPressed: () {
                        _validateCreateCategory(context);
                      },
                      text: 'Create a new Category',
                      width: MediaQuery.of(context).size.width,
                      height: 50.h,
                      textColor: ColorsDark.blueDark,
                      backgroundColor: ColorsDark.white,
                      lastRadius: 20,
                      threeRadius: 20,
                    );
                  },
                );
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  void _validateCreateCategory(BuildContext context) {
    if (formKey.currentState!.validate() ||
        context.read<UploadImageCubit>().getImageUrl.isEmpty) {
      if (context.read<UploadImageCubit>().getImageUrl.isEmpty) {
        ShowToast.showToastErrorTop(
          message: context.translate(LangKeys.validPickImage),
        );
      } else {
        context.read<CreateCategoryBloc>().add(
          CreateCategoryEvent.createCategory(
            body: CreateCategoryRequestBody(
              name: nameCategoryController.text.trim(),
              image: context.read<UploadImageCubit>().getImageUrl,
            ),
          ),
        );
      }
    }
  }
}
