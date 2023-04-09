import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:night_movie/core/constants.dart';
import 'package:night_movie/features/auth/data/repos/auth_repo_impl.dart';
import 'package:night_movie/features/auth/presentation/model_views/auth_cubit/auth_cubit.dart';

import 'widgets/auth_view_body.dart';

class AuthView extends StatelessWidget {
  static const String rn = '/';
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepoImpl()),
      child: const DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: primaryFirstDark,
          body: SafeArea(
            child: AuthViewBody(),
          ),
        ),
      ),
    );
  }
}
