import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:night_movie/core/models/config_model.dart';

class ServiceLocator {
  static final GetIt _getIt = GetIt.I;

  static GetIt get getIt {
    return _getIt;
  }

  static Future<Map<String, dynamic>> jsonDecode() async {
    final configFile = await rootBundle.loadString('assets/config/secret.json');
    final configData = json.decode(configFile);
    return configData;
  }

  static Future<void> setUp() async {
    final configData = await jsonDecode();
    _getIt.registerSingleton<ConfigModel>(ConfigModel.fromJson(configData));
  }
}
