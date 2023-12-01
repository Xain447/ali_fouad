
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

class UpdateUserController extends GetxController {
  var user = Rxn<User>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  late String countryCode = '';
  var isLoading = false.obs;

  @override
  onInit(){
    super.onInit();
    getUserData();
  }

  getUserData() async{
    final prefs = await SharedPreferences.getInstance();
    var data = jsonDecode(prefs.getString('user')!);
    user.value = User.fromJson(data);
    if(user.value != null){
      nameController.text = user.value!.name!;
      emailController.text = user.value!.email!;
      phoneController.text = user.value!.phone!;
      countryCode = user.value!.countryCode!;
    }
  }

  updateUser() async{
    await isInternet().then((connection) async {
      if (connection) {
        isLoading.value = true;
        final prefs = await SharedPreferences.getInstance();
        if(nameController.text.isNotEmpty && emailController.text.isNotEmpty && phoneController.text.isNotEmpty){
          try{
            var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.updateUserEndPoint);
            String? token = prefs.getString('token');
            final header = {'Authorization': 'Bearer $token'};
            Map body = {
              'name': nameController.text.trim(),
              'email': emailController.text.trim(),
              'phone': phoneController.text.trim(),
              'country_code': countryCode
            };
            http.Response response = await http.post(url, body: body, headers: header);
            if(response.statusCode == 201 || response.statusCode == 200){
              final Map<String, dynamic> userData = jsonDecode(response.body);
              if(userData['success'] == true){
                Map<String, dynamic> data = jsonDecode(prefs.getString('user')!);
                UserModel? user = UserModel(success: userData['success'], message: userData['message'],
                  data: User(
                    id: userData['data']['id'],
                    name: userData['data']['name'],
                    countryCode: userData['data']['country_code'],
                    phone: userData['data']['phone'],
                    email: userData['data']['email'],
                    token: token,
                    tokenExpiry: data['tokenExpiry'],
                  )
                );
                await prefs.remove('user');
                await prefs.setString('user', jsonEncode(user.data));
                emailController.clear();
                nameController.clear();
                phoneController.clear();
                isLoading.value = false;
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