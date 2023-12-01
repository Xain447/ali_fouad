
import 'dart:convert';
import 'package:ali_fouad_app/routes/pages.dart';
import 'package:ali_fouad_app/src/helper/api_endpoints.dart';
import 'package:ali_fouad_app/src/helper/helper.dart';
import 'package:ali_fouad_app/src/utils/string_manager.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DeleteUserController extends GetxController {

  var isLoading = false.obs;

  deleteUser() async{
    await isInternet().then((connection) async {
      if (connection) {
        isLoading.value = true;
        final prefs = await SharedPreferences.getInstance();
          try{
            var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.deleteUserEndPoint);
            String? token = prefs.getString('token');
            final header = {'Authorization': 'Bearer $token'};
            http.Response response = await http.delete(url, headers: header);
            if(response.statusCode == 201 || response.statusCode == 200){
              final Map<String, dynamic> userData = jsonDecode(response.body);
              if(userData['success'] == true){
                await prefs.remove('user');
                await prefs.remove('token');
                await prefs.clear();
                isLoading.value = false;
                successToast(StringManager.userDelete);
                Get.offAllNamed(Pages.landing);
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
        errorDialog(StringManager.noInternet);
      }
    });
  }
}