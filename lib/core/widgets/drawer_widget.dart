import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';
import 'package:night_movie/features/auth/presentation/views/auth_view.dart';
import 'package:night_movie/features/watch_list/presentation/views/watch_list_view.dart';

import '../../features/search/presentation/views/search_view.dart';
import '../constants.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: primarySecondDark.withOpacity(0.6),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 40,
                ),
                child: Text(
                  'Night Movie',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NeumorphicButton(
                      onPressed: () {
                        navigateSearch(context);
                      },
                      style: const NeumorphicStyle(
                        color: Colors.transparent,
                        shadowLightColor: Colors.transparent,
                        shadowDarkColor: Colors.transparent,
                      ),
                      child: const Text(
                        'Search',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    NeumorphicButton(
                      onPressed: () {
                        navigateWatchList(context);
                      },
                      style: const NeumorphicStyle(
                        color: Colors.transparent,
                        shadowLightColor: Colors.transparent,
                        shadowDarkColor: Colors.transparent,
                      ),
                      child: const Text(
                        'Watch list',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    NeumorphicButton(
                      onPressed: () async {
                        GoRouter.of(context).push(AuthView.rn);
                        await signOut();
                      },
                      style: const NeumorphicStyle(
                        color: Colors.transparent,
                        shadowLightColor: Colors.transparent,
                        shadowDarkColor: Colors.transparent,
                      ),
                      child: const Text(
                        'Sign out',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
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
  GoRouter.of(context).push(WatchListView.rn);
  Scaffold.of(context).closeDrawer();
}

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}
