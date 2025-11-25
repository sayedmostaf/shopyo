import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:shopyo/core/common/toast/show_toast.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/core/language/lang_keys.dart';
import 'package:shopyo/core/utils/app_strings.dart';

class UpdateProductImages extends StatelessWidget {
  const UpdateProductImages({super.key, required this.imageList});
  final List<String> imageList;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return BlocConsumer<UploadImageCubit, UploadImageState>(
          listener: (context, state) {
            state.whenOrNull(
              success: () {
                ShowToast.showToastSuccessTop(
                  message: context.translate(LangKeys.imageUploaded),
                );
              },
              error: (errorMessage) {
                ShowToast.showToastErrorTop(message: errorMessage);
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loadingList: (indexId) {
                if (indexId == index) {
                  return Container(
                    height: 90.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  );
                }
                return UpdateSelectedImageWidget(
                  imageList: imageList,
                  index: index,
                  onTap: () {},
                );
              },
              orElse: () {
                return UpdateSelectedImageWidget(
                  imageList: imageList,
                  index: index,
                  onTap: () {
                    context.read<UploadImageCubit>().uploadUpdateImageList(
                      indexId: index,
                      productImageList: imageList,
                    );
                  },
                );
              },
            );
          },
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 6.h),
      itemCount: imageList.length,
    );
  }
}

class UpdateSelectedImageWidget extends StatelessWidget {
  const UpdateSelectedImageWidget({
    super.key,
    required this.imageList,
    required this.index,
    required this.onTap,
  });
  final List<String> imageList;
  final int index;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: 90.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(imageList[index]),
              ),
            ),
          ),
          Container(
            height: 90.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Icon(
                Icons.add_a_photo_outlined,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
