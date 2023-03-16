import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

class Helper {
  static String getImagePath(String endPoint) {
    return '$imageBaseUrl$endPoint';
  }

  static String getYearOfDate(String date) {
    return DateFormat.y().format(DateTime.parse(date));
  }

  static String getWholeDate(String date) {
    if (date.isEmpty) {
      return '';
    }
    return DateFormat.yMMMd().format(DateTime.parse(date));
  }

  static String changeNumberToFixedString({required num rate}) {
    return (rate * 10).toStringAsFixed(0);
  }

  static AppBar appBarWidget({
    required String name,
    required BuildContext context,
  }) {
    return AppBar(
      centerTitle: true,
      elevation: 15,
      title: Text(name),
      leading: IconButton(
        onPressed: () {
          GoRouter.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back_ios_rounded),
      ),
    );
  }

  static Map<String, Color> percentIndicatorColor(num rate) {
    if (rate <= 5.5) {
      return {
        'progressColor': const Color.fromARGB(255, 255, 0, 0),
        'backgroundColor': const Color.fromARGB(255, 254, 221, 221),
      };
    } else if (rate > 5.5 && rate <= 6.5) {
      return {
        'progressColor': const Color.fromARGB(255, 255, 191, 0),
        'backgroundColor': const Color.fromARGB(255, 252, 239, 198),
      };
    } else if (rate > 6.5 && rate <= 7.5) {
      return {
        'progressColor': const Color(0xff03dbea),
        'backgroundColor': const Color.fromARGB(255, 220, 249, 251),
      };
    }
    return {
      'progressColor': const Color.fromARGB(255, 0, 255, 26),
      'backgroundColor': const Color.fromARGB(255, 209, 251, 209),
    };
  }

  static List<String> getMovieGeners(List<dynamic> geners) {
    List<String> myGeners = [];
    for (var element in geners) {
      switch (element) {
        case 10759:
          myGeners.add("Action & Adventure");
          break;
        case 16:
          myGeners.add("Animation");
          break;
        case 35:
          myGeners.add("Comedy");
          break;
        case 80:
          myGeners.add("Crime");
          break;
        case 99:
          myGeners.add("Documentary");
          break;
        case 18:
          myGeners.add("Drama");
          break;
        case 10751:
          myGeners.add("Family");
          break;
        case 10762:
          myGeners.add("Kids");
          break;
        case 9648:
          myGeners.add("Mystery");
          break;
        case 10763:
          myGeners.add("News");
          break;
        case 10764:
          myGeners.add("Reality");
          break;
        case 10765:
          myGeners.add("Sci-Fi & Fantasy");
          break;
        case 10766:
          myGeners.add("Soap");
          break;
        case 10767:
          myGeners.add("Talk");
          break;
        case 10768:
          myGeners.add("War & Politics");
          break;
        case 37:
          myGeners.add("Western");
          break;
        case 28:
          myGeners.add("Action");
          break;
        case 12:
          myGeners.add("Adventure");
          break;
        case 14:
          myGeners.add("Fantasy");
          break;
        case 36:
          myGeners.add("History");
          break;
        case 27:
          myGeners.add("Horror");
          break;
        case 10402:
          myGeners.add("Music");
          break;
        case 10749:
          myGeners.add("Romance");
          break;
        case 878:
          myGeners.add("Science Fiction");
          break;
        case 10770:
          myGeners.add("TV Movie");
          break;
        case 53:
          myGeners.add("Thriller");
          break;
        case 10752:
          myGeners.add("War");
          break;
        default:
          myGeners.add("Unknown");
          break;
      }
    }
    return myGeners;
  }

  static List<String> getTvGeners(List<Map<String, dynamic>> geners) {
    List<String> myGeners = [];
    for (var element in geners) {
      myGeners.add(element['name']);
    }
    return myGeners;
  }

  static Future<void> toast(
      {required String msg, Color? color, Color? txtColor}) {
    return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: color ?? Colors.red,
      textColor: txtColor ?? Colors.white,
      fontSize: 15,
    );
  }
}
