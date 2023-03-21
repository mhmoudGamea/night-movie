import 'package:flutter/material.dart';

const String baseUrl = 'https://api.themoviedb.org/3';
const String apiKey = 'f4860e7c267158c95182ade46c1411b1';
const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

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
