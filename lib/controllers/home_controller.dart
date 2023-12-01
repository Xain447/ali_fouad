
import 'dart:convert';

import 'package:ali_fouad_app/models/user_model.dart';
import 'package:ali_fouad_app/routes/pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  var user = Rxn<User>();

  @override
  onInit(){
    super.onInit();
    getUserData();
  }

  getUserData() async{
    final prefs = await SharedPreferences.getInstance();
    var data = jsonDecode(prefs.getString('user')!);
    user.value = User.fromJson(data);
  }

  logoutUser() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    prefs.remove('token');
    prefs.remove('user');
    Get.offAllNamed(Pages.landing);
  }
}