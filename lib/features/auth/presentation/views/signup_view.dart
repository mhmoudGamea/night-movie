import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:night_movie/features/auth/presentation/model_views/auth_cubit/auth_cubit.dart';

import 'widgets/c_button.dart';
import 'widgets/c_text_form_field.dart';

class SignupView extends StatefulWidget {
  static const String rn = '/signupView';
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _form = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final signData = BlocProvider.of<AuthCubit>(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: _form,
        child: Column(
          children: [
            const SizedBox(height: 40),
            CTextFormField(
              label: 'name',
              type: TextInputType.name,
              controller: name,
              validate: (value) {
                if (value == null || value.isEmpty) {
                  return 'name is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 30),
            CButton(
              text: 'Sign Up',
              pressed: () {
                if (_form.currentState!.validate()) {
                  signData.signIn(
                    context: context,
                    name: name.text,
                    email: email.text,
                    pass: pass.text,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
