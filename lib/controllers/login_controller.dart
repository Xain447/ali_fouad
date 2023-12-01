
import 'dart:convert';
import 'package:ali_fouad_app/models/user_model.dart';
import 'package:ali_fouad_app/routes/pages.dart';
import 'package:ali_fouad_app/src/helper/api_endpoints.dart';
import 'package:ali_fouad_app/src/helper/helper.dart';
import 'package:ali_fouad_app/src/utils/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final bool passVisibility = false;
  var isLoading = false.obs;

  loginUser() async{
    await isInternet().then((connection) async {
      if (connection) {
        isLoading.value = true;
        final prefs = await SharedPreferences.getInstance();
        if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
            try{
              var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.loginEndPoint);
              Map body = {
                'email': emailController.text.trim(),
                'password': passwordController.text.trim(),
              };
              http.Response response = await http.post(url, body: body);
              if(response.statusCode == 201 || response.statusCode == 200){
                final Map<String, dynamic> userData = jsonDecode(response.body);
                if(userData['success'] == true){
                  UserModel? user = UserModel.fromJson(userData);
                  await prefs.setString('token', user.data!.token!);
                  await prefs.setString('user', jsonEncode(user.data));
                  emailController.clear();
                  passwordController.clear();
                  isLoading.value = false;
                  Get.offNamed(Pages.home);
                }else{
                  isLoading.value = false;
                  errorDialog(jsonDecode(response.body)["message"] ?? "Unknown Error Occurred");
                }
              }else{
                isLoading.value = false;
                errorDialog(jsonDecode(response.body)["message"] ?? "Unknown Error Occurred");
              }
            }catch(exception){
              isLoading.value = false;
              errorDialog(exception.toString());
            }
        }else{
          isLoading.value = false;
          errorToast(StringManager.warningMsj);
        }
      }else{
        isLoading.value = false;
        errorDialog(StringManager.noInternet);
      }
    });
  }
}