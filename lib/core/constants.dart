import 'package:flutter/material.dart';

const String logo = 'assets/images/movieDB.svg';

const Color primaryColor = Color(0xff03dbea);
const Color primaryFirstDark = Color.fromARGB(255, 31, 31, 33);
const Color primarySecondDark = Color.fromARGB(255, 15, 16, 17);

ThemeData darkTheme = ThemeData(
  fontFamily: 'Nunito',
  scaffoldBackgroundColor: primarySecondDark,
  appBarTheme: const AppBarTheme(backgroundColor: primarySecondDark),
);

// firebase collection constants
const usersWatchListsCollection = 'usersWatchLists';
