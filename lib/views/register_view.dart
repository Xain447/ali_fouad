
import 'package:ali_fouad_app/controllers/register_controller.dart';
import 'package:ali_fouad_app/routes/pages.dart';
import 'package:ali_fouad_app/src/helper/helper.dart';
import 'package:ali_fouad_app/src/helper/text_helper.dart';
import 'package:ali_fouad_app/src/utils/asset_manager.dart';
import 'package:ali_fouad_app/src/utils/color_manager.dart';
import 'package:ali_fouad_app/src/utils/string_manager.dart';
import 'package:ali_fouad_app/src/utils/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/bottom_text.dart';
import 'widgets/button_widget.dart';
import 'widgets/text_field.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final RegisterController controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Padding(
            padding: EdgeInsets.all(width * 0.03),
            child: Column(
              children: [
                buildSpaceVertical(height * 0.07),
                Center(child: Image.asset(AssetManager.logo, scale: 3.2)),
                buildSpaceVertical(height * 0.03),
                Center(child: boldTextStyle(text: StringManager.register,
                    fontSize: ValueManager.vm30, color: ColorManager.primaryColor),
                ),
                buildSpaceVertical(height * 0.06),
                SizedBox(
                  width: width * 0.8,
                  child: CustomTextField(
                    controller: controller.nameController,
                    hintName: StringManager.name,
                    inputType: TextInputType.text,
                    labelTxt: StringManager.name,
                    fontSize: ValueManager.vm14,
                    color: ColorManager.whiteColor,
                  ),
                ),
                buildSpaceVertical(height * 0.01),
                SizedBox(
                  width: width * 0.8,
                  child: CustomTextField(
                    controller: controller.phoneNoController,
                    hintName: StringManager.phoneNo,
                    inputType: TextInputType.text,
                    labelTxt: StringManager.phoneNo,
                    fontSize: ValueManager.vm14,
                    color: ColorManager.whiteColor,
                    prefixShow: true,
                    onChangedCode: (countryCode){ controller.countryCode = countryCode.dialCode!; },
                  ),
                ),
                buildSpaceVertical(height * 0.01),
                SizedBox(
                  width: width * 0.8,
                  child: CustomTextField(
                    controller: controller.emailController,
                    hintName: StringManager.email,
                    inputType: TextInputType.emailAddress,
                    labelTxt: StringManager.email,
                    fontSize: ValueManager.vm14,
                    color: ColorManager.whiteColor,
                  ),
                ),
                buildSpaceVertical(height * 0.01),
                SizedBox(
                  width: width * 0.8,
                  child: CustomTextField(
                    controller: controller.passwordController,
                    hintName: StringManager.pass,
                    labelTxt: StringManager.pass,
                    fontSize: ValueManager.vm14,
                    color: ColorManager.whiteColor,
                    isPass: true,
                    passwordVisibility: controller.passVisibility,
                  ),
                ),
                buildSpaceVertical(height * 0.01),
                SizedBox(
                  width: width * 0.8,
                  child: CustomTextField(
                    controller: controller.confirmPasswordController,
                    hintName: StringManager.confirmPass,
                    labelTxt: StringManager.confirmPass,
                    fontSize: ValueManager.vm14,
                    color: ColorManager.whiteColor,
                    isPass: true,
                    passwordVisibility: controller.confirmPassVisibility,
                  ),
                ),
                buildSpaceVertical(height * 0.03),
                Obx((){
                  return controller.isLoading.isTrue ? loader() :
                  Center(
                    child: ButtonWidget(
                      height: height * 0.074,
                      width: width * 0.8,
                      radius: ValueManager.vm10,
                      color: ColorManager.primaryColor,
                      textColor: ColorManager.whiteColor,
                      elevation: ValueManager.vm1,
                      isCard: false,
                      title: StringManager.register,
                      onTap: (){ controller.registerUser(); },
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: MediaQuery.of(context).viewInsets.bottom == 0.0 ?
      Padding(
        padding: EdgeInsets.only(bottom: width * 0.03),
        child: InkWell(
            onTap: (){ Get.toNamed(Pages.login); },
            child: const BottomText(firstTxt: StringManager.haveAccount, secondTxt: StringManager.login))
      ) : null,
    );
  }
}
