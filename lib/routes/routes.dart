

import 'package:ali_fouad_app/views/change_pass_view.dart';
import 'package:ali_fouad_app/views/home_view.dart';
import 'package:ali_fouad_app/views/landing_view.dart';
import 'package:ali_fouad_app/views/login_view.dart';
import 'package:ali_fouad_app/views/register_view.dart';
import 'package:ali_fouad_app/views/splash_view.dart';
import 'package:ali_fouad_app/views/update_view.dart';
import 'package:get/get.dart';
import 'pages.dart';

class AppRoutes {

  static appRoutes() => [
    GetPage(
      name: Pages.initial,
      page: () => const SplashView(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: Pages.landing,
      page: () => const LandingView(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: Pages.register,
      page: () => RegisterView(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: Pages.login,
      page: () => LoginView(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: Pages.home,
      page: () => HomeView(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.zoom,
    ),
    GetPage(
      name: Pages.update,
      page: () => UpdateInfoView(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: Pages.changePass,
      page: () => ChangePassView(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.rightToLeftWithFade,
    ),
  ];

}