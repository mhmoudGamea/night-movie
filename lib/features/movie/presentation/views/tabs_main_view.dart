import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../core/constants.dart';
import '../../../tv/presentation/views/tv_view.dart';
import '../../../../core/widgets/drawer_widget.dart';
import 'movie_view.dart';

class TabsMainView extends StatefulWidget {
  static const rn = '/tabsMainView';
  const TabsMainView({Key? key}) : super(key: key);

  @override
  State<TabsMainView> createState() => _TabsMainViewState();
}

class _TabsMainViewState extends State<TabsMainView> {
  var _currentIndex = 0;

  final List<Map<String, dynamic>> _screens = [
    {'title': 'Movies', 'screen': const MovieView()},
    {'title': 'Tv Series', 'screen': const TvView()},
  ];

  Map<String, dynamic> getScreen(int value) {
    return _screens.elementAt(value);
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 8,
            ),
            child: Image.asset('assets/images/menu.png', width: 18),
          ),
        ),
        centerTitle: true,
        elevation: 15,
        title: Text(getScreen(_currentIndex)['title']),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 31, 31, 33),
                Color.fromARGB(255, 15, 16, 17),
              ]),
        ),
        child: getScreen(_currentIndex)['screen'],
      ),
      drawer: const DrawerWidget(),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
        child: GNav(
          gap: 10,
          tabBackgroundColor: primaryColor,
          padding: const EdgeInsets.all(10),
          color: Colors.white,
          activeColor: Colors.white,
          iconSize: 18,
          onTabChange: (int index) => setState(() {
            _currentIndex = index;
          }),
          tabs: [
            GButton(
              icon: FontAwesomeIcons.video,
              text: 'Movie',
              borderRadius: BorderRadius.circular(15),
            ),
            GButton(
              icon: FontAwesomeIcons.tv,
              text: 'Tv',
              borderRadius: BorderRadius.circular(15),
            ),
          ],
        ),
      ),
    );
  }
}
