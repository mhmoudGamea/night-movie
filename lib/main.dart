import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:night_movie/core/utils/service_locator.dart';

import './core/utils/api_services.dart';
import './core/constants.dart';
import './core/utils/app_routes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ServiceLocator.setUp();
  ApiServices.initializeDio();
  AppRoutes.getAuthState();
  runApp(const NightMovie());
}

class NightMovie extends StatelessWidget {
  const NightMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'night movie',
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      routerConfig: AppRoutes.getRouter,
    );
  }
}
