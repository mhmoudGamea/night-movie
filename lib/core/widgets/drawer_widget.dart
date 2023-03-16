import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants.dart';
import 'drawer_option.dart';
import '../../features/search/presentation/views/search_view.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: primaryFirstDark,
      width: 260,
      elevation: 10,
      shadowColor: primarySecondDark,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 31, 31, 33),
                Color.fromARGB(255, 15, 16, 17),
              ],
            ),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerOption(
                optionImage: 'assets/images/search.png',
                optionName: 'Search',
                onPress: () {
                  navigateSearch(context);
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
