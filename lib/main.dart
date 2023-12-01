
import 'package:ali_fouad_app/routes/pages.dart';
import 'package:ali_fouad_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([ DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ali-Fouad',
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.appRoutes(),
      initialRoute: Pages.initial,
    );
  }
}