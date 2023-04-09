import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:night_movie/core/constants.dart';
import 'package:night_movie/core/utils/styles.dart';
import 'package:night_movie/features/auth/presentation/model_views/auth_cubit/auth_cubit.dart';

import 'c_loading.dart';

class CButton extends StatelessWidget {
  final String text;
  final VoidCallback pressed;
  const CButton({Key? key, required this.text, required this.pressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return NeumorphicButton(
                onPressed: pressed,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                style: const NeumorphicStyle(
                  color: primaryColor,
                  intensity: 0.4,
                  depth: 3,
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Align(
                    alignment: Alignment.center,
                    child: (state is LoginLoading || state is SignLoading)
                        ? const CLoading()
                        : Text(text, style: Styles.font16)),
              );
            },
          ),
        ),
      ],
    );
  }
}
