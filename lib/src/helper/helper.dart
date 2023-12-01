

import 'package:ali_fouad_app/src/utils/color_manager.dart';
import 'package:ali_fouad_app/src/utils/value_manager.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loading_animations/loading_animations.dart';

successToast(String title) {
  Fluttertoast.showToast(
      msg: title,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: ColorManager.greenColor,
      textColor: ColorManager.whiteColor,
      fontSize: ValueManager.vm16
  );
}

errorToast(String title) {
  Fluttertoast.showToast(
      msg: title,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: ColorManager.redColor,
      textColor: ColorManager.whiteColor,
      fontSize: ValueManager.vm16
  );
}

loader() {
  return Center(
    child: LoadingBouncingGrid.square(
      size: ValueManager.vm40,
      inverted: true,
      borderSize: ValueManager.vm10,
      borderColor: ColorManager.greyColor,
      backgroundColor: ColorManager.primaryColor,
    ),
  );
}

Future<bool> isInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  } else {
    return false;
  }
}

errorDialog(String text) {
  return showDialog(context: Get.context!, builder: (context) {
    return SimpleDialog(
      title: const Text('Error Occurred!', style: TextStyle(color: ColorManager.primaryColor)),
      contentPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      children: [Text(text)],
    );
  });
}

SizedBox buildSpaceVertical(height) => SizedBox(height: height);

SizedBox buildSpaceHorizontal(width) => SizedBox(width: width);