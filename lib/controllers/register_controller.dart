
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

class RegisterController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNoController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final bool passVisibility = false;
  final bool confirmPassVisibility = false;
  late String countryCode = '';
  var isLoading = false.obs;

  registerUser() async{
    await isInternet().then((connection) async {
      if (connection) {
        isLoading.value = true;
        final prefs = await SharedPreferences.getInstance();
        if(nameController.text.isNotEmpty && emailController.text.isNotEmpty && phoneNoController.text.isNotEmpty
            && passwordController.text.isNotEmpty && confirmPasswordController.text.isNotEmpty){
          if(passwordController.text == confirmPasswordController.text){
            try{
              var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.registerEndPoint);
              Map body = {
                'name': nameController.text.trim(),
                'email': emailController.text.trim(),
                'country_code': countryCode,
                'phone': phoneNoController.text.trim(),
                'password': passwordController.text.trim(),
                'password_confirm': confirmPasswordController.text.trim()
              };
              http.Response response = await http.post(url, body: body);
              if(response.statusCode == 201 || response.statusCode == 200){
                final Map<String, dynamic> userData = jsonDecode(response.body);
                if(userData['success'] == true){
                  UserModel? user = UserModel.fromJson(userData);
                  await prefs.setString('token', user.data!.token!);
                  await prefs.setString('user', jsonEncode(user.data));
                  nameController.clear();
                  emailController.clear();
                  phoneNoController.clear();
                  passwordController.clear();
                  confirmPasswordController.clear();
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