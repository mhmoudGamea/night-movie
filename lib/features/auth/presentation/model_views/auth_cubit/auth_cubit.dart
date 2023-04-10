import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';
import 'package:night_movie/core/utils/helper.dart';
import 'package:night_movie/features/auth/data/models/user_model.dart';
import 'package:night_movie/features/auth/data/repos/auth_repo.dart';
import 'package:night_movie/features/auth/presentation/views/auth_view.dart';
import 'package:night_movie/features/movie/presentation/views/tabs_main_view.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;
  AuthCubit(this._authRepo) : super(AuthInitial());

// just to sign in user by FirebaseAuth
  Future<void> login(
      {required BuildContext context,
      required String email,
      required String pass}) async {
    emit(LoginLoading());
    final response = await _authRepo.loginUser(email: email, pass: pass);
    response.fold((failure) {
      Helper.failMessage(context, failure.errorMessage);
      emit(LoginFailure());
    }, (credentials) {
      Helper.successMessage(context, 'Login Success');
      GoRouter.of(context).push(TabsMainView.rn);
      emit(LoginSuccess());
    });
  }

// just to sign up user by FirebaseAuth
  Future<void> signUp({
    required BuildContext context,
    required String name,
    required String email,
    required String pass,
  }) async {
    emit(SignLoading());
    final response =
        await _authRepo.signUser(name: name, email: email, pass: pass);
    response.fold((failure) {
      Helper.failMessage(context, failure.errorMessage);
      emit(SignFailure());
    }, (credentials) {
      Helper.successMessage(context, 'Signup Success');
      GoRouter.of(context).push(AuthView.rn);
      saveCredentials(uid: credentials.user!.uid, name: name, email: email);
      emit(SignSuccess());
    });
  }

// just to add new user in users collection
  Future<void> saveCredentials({
    required String uid,
    required String name,
    required String email,
  }) async {
    UserModel userModel = UserModel(uid: uid, name: name, email: email);
    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).set(
            userModel.toMap(),
          );
    } catch (error) {
      print(error);
    }
  }
}
