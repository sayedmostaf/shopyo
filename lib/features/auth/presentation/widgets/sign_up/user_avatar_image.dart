import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:shopyo/core/common/animations/animate_do.dart';
import 'package:shopyo/core/common/toast/show_toast.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/core/language/lang_keys.dart';
import 'package:shopyo/core/style/images/app_images.dart';

class UserAvatarImage extends StatelessWidget {
  const UserAvatarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 500,
      child: BlocConsumer<UploadImageCubit, UploadImageState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              ShowToast.showToastSuccessTop(
                message: context.translate(LangKeys.imageUploaded),
                seconds: 2,
              );
            },
            removeImage: (removeImage) {
              ShowToast.showToastSuccessTop(
                message: context.translate(LangKeys.imageRemoved),
                seconds: 2,
              );
            },
            error: (errorMessage) {
              ShowToast.showToastErrorTop(message: errorMessage);
            },
          );
        },
        builder: (context, state) {
          final isImageUploaded = context
              .read<UploadImageCubit>()
              .getImageUrl
              .isNotEmpty;
          return state.maybeWhen(
            loading: () {
              return CircleAvatar(
                radius: 38,
                backgroundImage: AssetImage(AppImages.userAvatar),
                child: Center(
                  child: CircularProgressIndicator(
                    color: context.color.mainColor,
                  ),
                ),
              );
            },
            orElse: () {
              return CircleAvatar(
                radius: 38,
                backgroundImage: isImageUploaded
                    ? NetworkImage(context.read<UploadImageCubit>().getImageUrl)
                          as ImageProvider
                    : AssetImage(AppImages.userAvatar),
                backgroundColor: Colors.grey.withOpacity(.1),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    if (isImageUploaded)
                      Positioned(
                        child: IconButton(
                          onPressed: () {
                            context.read<UploadImageCubit>().removeImage();
                          },
                          icon: Icon(Icons.delete, color: Colors.red),
                        ),
                      )
                    else
                      SizedBox.shrink(),
                    Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isImageUploaded
                            ? Colors.transparent
                            : Colors.black.withOpacity(0.4),
                      ),
                    ),
                    if (isImageUploaded)
                      SizedBox.shrink()
                    else
                      IconButton(
                        onPressed: () {
                          context.read<UploadImageCubit>().uploadImage();
                        },
                        icon: Icon(Icons.add_a_photo, color: Colors.white),
                      ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}