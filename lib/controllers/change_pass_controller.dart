
import 'dart:convert';
import 'package:ali_fouad_app/routes/pages.dart';
import 'package:ali_fouad_app/src/helper/api_endpoints.dart';
import 'package:ali_fouad_app/src/helper/helper.dart';
import 'package:ali_fouad_app/src/utils/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChangePassController extends GetxController {
  var isLoading = false.obs;
  final passwordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final bool passVisibility = false;
  final bool newPassVisibility = false;
  final bool confirmPassVisibility = false;

  updatePassword() async{
    await isInternet().then((connection) async {
      if (connection) {
        isLoading.value = true;
        final prefs = await SharedPreferences.getInstance();
        if(passwordController.text.isNotEmpty && newPasswordController.text.isNotEmpty && confirmPasswordController.text.isNotEmpty){
          if(newPasswordController.text == confirmPasswordController.text){
            try{
              var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.changePassEndPoint);
              String? token = prefs.getString('token');
              final header = {'Authorization': 'Bearer $token'};
              Map body = {
                'current_password': passwordController.text.trim(),
                'password': newPasswordController.text.trim(),
                'password_confirm': confirmPasswordController.text.trim()
              };
              http.Response response = await http.post(url, body: body, headers: header);
              if(response.statusCode == 201 || response.statusCode == 200){
                final Map<String, dynamic> userData = jsonDecode(response.body);
                if(userData['success'] == true){
                  passwordController.clear();
                  newPasswordController.clear();
                  confirmPasswordController.clear();
                  isLoading.value = false;
                  successToast(StringManager.passwordChange);
                  Get.offAllNamed(Pages.home);
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
            errorToast(StringManager.passMatch);
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