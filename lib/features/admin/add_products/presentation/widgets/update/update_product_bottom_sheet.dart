import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/core/common/widgets/custom_button.dart';
import 'package:shopyo/core/common/widgets/custom_drop_down.dart';
import 'package:shopyo/core/common/widgets/custom_text_field.dart';
import 'package:shopyo/core/common/widgets/text_app.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/core/style/colors/colors_dark.dart';
import 'package:shopyo/core/style/fonts/font_family_helper.dart';
import 'package:shopyo/core/style/fonts/font_weight_helper.dart';
import 'package:shopyo/features/admin/add_products/presentation/widgets/update/update_product_images.dart';

class UpdateProductBottomSheet extends StatefulWidget {
  const UpdateProductBottomSheet({super.key});

  @override
  State<UpdateProductBottomSheet> createState() =>
      _UpdateProductBottomSheetState();
}

class _UpdateProductBottomSheetState extends State<UpdateProductBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final fromKey = GlobalKey<FormState>();

  String? categoryName;
  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
      child: Form(
        key: fromKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: TextApp(
                  text: 'Update Product',
                  theme: context.textStyle.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeightHelper.bold,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              TextApp(
                text: 'Update a photos',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.medium,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                ),
              ),
              SizedBox(height: 15.h),
              const UpdateProductImages(),
              SizedBox(height: 15.h),
              TextApp(
                text: 'Title',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.medium,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                ),
              ),
              SizedBox(height: 15.h),
              CustomTextField(
                controller: _titleController,
                keyboardType: TextInputType.emailAddress,
                hintText: 'Title',
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 2) {
                    return 'Enter a valid title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.h),
              TextApp(
                text: 'Price',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.medium,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                ),
              ),
              SizedBox(height: 15.h),
              // Price
              CustomTextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                hintText: 'Price',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter a valid price';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.h),
              TextApp(
                text: 'Description',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.medium,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                ),
              ),
              SizedBox(height: 15.h),
              //Description
              CustomTextField(
                controller: _descriptionController,
                maxLines: 4,
                keyboardType: TextInputType.multiline,
                hintText: 'Description',
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 2) {
                    return 'Enter a valid description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.h),
              TextApp(
                text: 'Category',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.medium,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                ),
              ),
              SizedBox(height: 15.h),
              CustomCreateDropDown(
                hintText: 'mackbook',
                items: [],
                onChanged: (value) {
                  setState(() {
                    categoryName = value;
                  });
                },
                value: categoryName,
              ),
              SizedBox(height: 15.h),
              CustomButton(
                onPressed: () {},
                backgroundColor: ColorsDark.white,
                lastRadius: 20,
                threeRadius: 20,
                textColor: ColorsDark.blueDark,
                text: 'Update Product',
                width: MediaQuery.of(context).size.width,
                height: 50.h,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
