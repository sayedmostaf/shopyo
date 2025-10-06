import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/core/common/animations/animate_do.dart';
import 'package:shopyo/core/common/toast/show_toast.dart';
import 'package:shopyo/core/common/widgets/custom_linear_button.dart';
import 'package:shopyo/core/common/widgets/text_app.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/core/language/lang_keys.dart';
import 'package:shopyo/core/routes/app_routes.dart';
import 'package:shopyo/core/style/fonts/font_weight_helper.dart';
import 'package:shopyo/features/auth/presentation/bloc/auth_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 600,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (userRole) {
              ShowToast.showToastSuccessTop(
                context: context,
                message: context.translate(LangKeys.loggedSuccessfully),
              );
              if (userRole == 'admin') {
                context.pushNamedAndRemoveUntil(AppRoutes.homeAdmin);
              } else {
                context.pushNamedAndRemoveUntil(AppRoutes.homeCustomer);
              }
            },
            error: (message) {
              ShowToast.showToastErrorTop(
                context: context,
                message: context.translate(message),
              );
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () {
              return CustomLinearButton(
                height: 50.h,
                width: MediaQuery.of(context).size.width,
                onPressed: () {},
                child: CircularProgressIndicator(color: Colors.white),
              );
            },
            orElse: () {
              return CustomLinearButton(
                height: 50.h,
                width: MediaQuery.of(context).size.width,

                onPressed: () {
                  _validateThenDoLogin(context);
                },
                child: TextApp(
                  text: context.translate(LangKeys.login),
                  theme: context.textStyle.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeightHelper.bold,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _validateThenDoLogin(BuildContext context) {
    if (context.read<AuthBloc>().formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(AuthEvent.login());
    }
  }
}
