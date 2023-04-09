import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:night_movie/core/utils/styles.dart';
import 'package:night_movie/features/auth/presentation/model_views/auth_cubit/auth_cubit.dart';
import 'package:night_movie/features/auth/presentation/views/widgets/c_button.dart';
import 'package:night_movie/features/auth/presentation/views/widgets/c_text_form_field.dart';
import 'package:night_movie/features/auth/presentation/views/widgets/keep_sigin.dart';

class LoginView extends StatefulWidget {
  static const String rn = '/loginView';
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _form = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final loginData = BlocProvider.of<AuthCubit>(context);
    return SingleChildScrollView(
      child: Form(
        key: _form,
        child: Column(
          children: [
            const SizedBox(height: 40),
            CTextFormField(
              label: 'email',
              type: TextInputType.emailAddress,
              controller: email,
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return 'email is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            CTextFormField(
              label: 'password',
              type: TextInputType.visiblePassword,
              visible: true,
              controller: pass,
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return 'password is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            const KeepSigin(),
            const SizedBox(height: 30),
            CButton(
              text: 'Log In',
              pressed: () {
                if (_form.currentState!.validate()) {
                  loginData.login(
                      context: context, email: email.text, pass: pass.text);
                }
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Forget Password?',
              style: Styles.font14,
            ),
          ],
        ),
      ),
    );
  }
}
