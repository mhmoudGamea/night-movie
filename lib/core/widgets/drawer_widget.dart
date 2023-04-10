import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:night_movie/features/auth/presentation/views/auth_view.dart';
import 'package:night_movie/features/watch_list/presentation/views/watch_list.dart';

import '../constants.dart';
import 'drawer_option.dart';
import '../../features/search/presentation/views/search_view.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: primarySecondDark,
      width: 260,
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/remove.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              const SizedBox(height: 15),
              DrawerOption(
                optionIcon: Icons.search_rounded,
                optionName: 'Search',
                onPress: () {
                  navigateSearch(context);
                },
              ),
              DrawerOption(
                optionIcon: Icons.bookmark_rounded,
                optionName: 'Watch list',
                onPress: () {
                  navigateWatchList(context);
                },
              ),
              DrawerOption(
                optionIcon: Icons.output_rounded,
                optionName: 'Sign out',
                onPress: () async {
                  GoRouter.of(context).push(AuthView.rn);
                  await signOut();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void navigateSearch(BuildContext context) {
  GoRouter.of(context).push(SearchView.rn);
  Scaffold.of(context).closeDrawer();
}

void navigateWatchList(BuildContext context) {
  GoRouter.of(context).push(WatchList.rn);
  Scaffold.of(context).closeDrawer();
}

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}
