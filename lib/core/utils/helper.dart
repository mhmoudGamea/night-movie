import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:night_movie/core/utils/styles.dart';

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

  static List<String> getMovieGeners(List<dynamic>? geners) {
    List<String> myGeners = [];
    if (geners != null) {
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

  static void showToast(
      {required BuildContext context,
      required Color color,
      required IconData icon,
      required String message}) {
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              message,
              style: Styles.font14.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
    fToast.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 3),
      fadeDuration: const Duration(microseconds: 2000),
      gravity: ToastGravity.BOTTOM,
    );
  }

  static void showCustomToast(
      {required BuildContext context,
      required Color bgColor,
      required IconData icon,
      required String msg,
      required Color iconColor}) {
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: bgColor),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 18,
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                msg,
                style: Styles.font15.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
    fToast.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 2),
      fadeDuration: const Duration(milliseconds: 500),
      gravity: ToastGravity.BOTTOM,
    );
  }

  // just to display error toast
  static void failMessage(BuildContext context, String msg) {
    Helper.showCustomToast(
      context: context,
      bgColor: primaryFirstDark,
      icon: FontAwesomeIcons.triangleExclamation,
      iconColor: Colors.amber,
      msg: msg,
    );
  }

// just to display success toast
  static void successMessage(BuildContext context, String msg) {
    Helper.showCustomToast(
      context: context,
      bgColor: primaryFirstDark,
      icon: FontAwesomeIcons.circleCheck,
      iconColor: Colors.green,
      msg: msg,
    );
  }
}
