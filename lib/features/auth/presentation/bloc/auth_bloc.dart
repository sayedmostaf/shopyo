import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopyo/core/service/graphql/api_result.dart';
import 'package:shopyo/core/service/shared_pref/pref_keys.dart';
import 'package:shopyo/core/service/shared_pref/shared_pref.dart';
import 'package:shopyo/features/auth/data/models/login_request_body.dart';
import 'package:shopyo/features/auth/data/repos/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _repo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AuthBloc(this._repo) : super(_Initial()) {
    on<LoginEvent>(_login);
  }
  FutureOr<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final result = await _repo.login(
      LoginRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text,
      ),
    );

    await _handleLoginResult(result, emit);
  }

  Future<void> _handleLoginResult(
    ApiResult result,
    Emitter<AuthState> emit,
  ) async {
    result.when(
      success: (loginData) async {
        final token = loginData.data.login.accessToken ?? "";

        // save token
        await SharedPref().setString(PrefKeys.accessToken, token);

        // get user role
        final user = await _repo.userRole(token);

        // save user id + role
        await SharedPref().setInt(PrefKeys.userId, user.userId ?? 0);
        await SharedPref().setString(PrefKeys.userRole, user.userRole ?? '');

        if (emit.isDone) return;
        emit(AuthState.success(userRole: user.userRole ?? ""));
      },
      failure: (error) {
        if (emit.isDone) return;
        emit(AuthState.error(error: error));
      },
    );
  }
}
