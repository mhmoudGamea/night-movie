import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:night_movie/core/constants.dart';
import 'package:night_movie/core/utils/helper.dart';
import 'package:night_movie/features/auth/data/repos/auth_repo.dart';
import 'package:night_movie/features/auth/presentation/views/auth_view.dart';
import 'package:night_movie/features/movie/presentation/views/tabs_main_view.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;
  AuthCubit(this._authRepo) : super(AuthInitial());

  Future<void> login(
      {required BuildContext context,
      required String email,
      required String pass}) async {
    emit(LoginLoading());
    final response = await _authRepo.loginUser(email: email, pass: pass);
    response.fold((failure) {
      Helper.showCustomToast(
        context: context,
        bgColor: primaryFirstDark,
        icon: FontAwesomeIcons.triangleExclamation,
        iconColor: Colors.amber,
        msg: failure.errorMessage,
      );
      emit(LoginFailure());
    }, (r) {
      Helper.showCustomToast(
        context: context,
        bgColor: primaryFirstDark,
        icon: FontAwesomeIcons.circleCheck,
        iconColor: Colors.green,
        msg: 'Login Success',
      );
      GoRouter.of(context).push(TabsMainView.rn);
      emit(LoginSuccess());
    });
  }

  Future<void> signIn(
      {required BuildContext context,
      required String name,
      required String email,
      required String pass}) async {
    emit(SignLoading());
    final response =
        await _authRepo.signUser(name: name, email: email, pass: pass);
    response.fold((failure) {
      Helper.showCustomToast(
        context: context,
        bgColor: primaryFirstDark,
        icon: FontAwesomeIcons.triangleExclamation,
        iconColor: Colors.amber,
        msg: failure.errorMessage,
      );
      emit(SignFailure());
    }, (r) {
      Helper.showCustomToast(
        context: context,
        bgColor: primaryFirstDark,
        icon: FontAwesomeIcons.circleCheck,
        iconColor: Colors.green,
        msg: 'Sign up Success',
      );
      GoRouter.of(context).push(AuthView.rn);
      emit(SignSuccess());
    });
  }
}
