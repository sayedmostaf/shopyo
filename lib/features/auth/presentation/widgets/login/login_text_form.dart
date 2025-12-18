import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/core/common/animations/animate_do.dart';
import 'package:shopyo/core/common/widgets/custom_text_field.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/core/language/lang_keys.dart';
import 'package:shopyo/core/utils/app_regex.dart';
import 'package:shopyo/features/auth/presentation/bloc/auth_bloc.dart';

class LoginTextForm extends StatefulWidget {
  const LoginTextForm({super.key});

  @override
  State<LoginTextForm> createState() => _LoginTextFormState();
}

class _LoginTextFormState extends State<LoginTextForm> {
  bool isShowPassword = true;
  late AuthBloc _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = context.read<AuthBloc>();
  }

  @override
  void dispose() {
    _bloc.emailController.dispose();
    _bloc.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _bloc.formKey,
      child: Column(
        children: [
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              controller: _bloc.emailController,
              hintText: context.translate(LangKeys.email),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (!AppRegex.isEmailValid(_bloc.emailController.text)) {
                  return context.translate(LangKeys.validEmail);
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 25.h),
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              controller: _bloc.passwordController,
              hintText: context.translate(LangKeys.password),
              keyboardType: TextInputType.visiblePassword,
              obscureText: isShowPassword,
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 6) {
                  return context.translate(LangKeys.validPassword);
                }
                return null;
              },
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isShowPassword = !isShowPassword;
                  });
                },
                icon: Icon(
                  isShowPassword ? Icons.visibility_off : Icons.visibility,
                  color: context.color.textColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
