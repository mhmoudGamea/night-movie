import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:night_movie/features/auth/presentation/views/login_view.dart';
import 'package:night_movie/features/auth/presentation/views/signup_view.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/styles.dart';

class AuthViewBody extends StatefulWidget {
  const AuthViewBody({Key? key}) : super(key: key);

  @override
  State<AuthViewBody> createState() => _AuthViewBodyState();
}

class _AuthViewBodyState extends State<AuthViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: Image.asset(
            'assets/images/remove.png',
            // fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: primarySecondDark,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                TabBar(
                  dragStartBehavior: DragStartBehavior.down,
                  // dividerColor: Colors.red,
                  indicatorColor: primaryColor,
                  indicatorWeight: 2.5,
                  indicatorPadding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  tabs: [
                    Tab(
                      child: Text(
                        'Sign in',
                        style: Styles.font17.copyWith(color: Colors.white),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Sign up',
                        style: Styles.font17.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const Expanded(
                  child: TabBarView(
                    physics: BouncingScrollPhysics(),
                    dragStartBehavior: DragStartBehavior.down,
                    children: [
                      LoginView(),
                      SignupView(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
