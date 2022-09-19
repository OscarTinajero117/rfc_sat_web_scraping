import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'app/core/utils/dependency_injection.dart';
import 'app/modules/home/home_bindings.dart';
import 'app/modules/home/home_page.dart';
import 'app/routers/app_pages.dart';

void main() {
  //<--- Evitar la rotación de la aplicación
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  //--->
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    // overlays: [SystemUiOverlay.bottom],//solo deja la parte de abajo
    // overlays: [SystemUiOverlay.top],//solo deja la parte de arriba
    overlays: [], //quita ambas partes
  );
  DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      title: 'Consulta de RFC por QR',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        // Locale('en', ''), // English, no country code
        Locale('es', 'MX'), // Spanish, México country code
      ],
      home: const HomePage(),
      initialBinding: HomeBinding(),
      getPages: AppPages.pages,
    );
  }
}
