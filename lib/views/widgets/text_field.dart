
// ignore_for_file: must_be_immutable

import 'package:ali_fouad_app/src/utils/color_manager.dart';
import 'package:ali_fouad_app/src/utils/value_manager.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintName;
  final String labelTxt;
  final TextInputType inputType;
  final bool isEnable;
  final bool isRead;
  final int inputLines;
  final int? length;
  final Color color;
  final bool isPass;
  final double? height;
  final double? fontSize;
  late bool passwordVisibility;
  late bool? focus;
  final bool prefixShow;
  final Function(String)? onChanged;
  final Function(CountryCode)? onChangedCode;
  final Function(String)? onSubmit;
  final String? Function(String?)? validatorFun;
  final Function()? onTapped;
  final List<TextInputFormatter>? inputFormatters;

  CustomTextField({
    Key? key, this.controller, this.hintName, required this.labelTxt, this.isPass = false,
    this.passwordVisibility = false, this.inputType = TextInputType.text, this.isEnable = true,
    this.isRead = false, this.inputLines = 1, this.length, this.color = ColorManager.whiteColor, this.onChanged,
    this.onSubmit, this.onTapped, this.height, this.fontSize, this.validatorFun,
    this.focus, this.inputFormatters, this.prefixShow = false, this.onChangedCode}) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPass ? !widget.passwordVisibility : false,
      enabled: widget.isEnable,
      readOnly: widget.isRead,
      autofocus: widget.focus ?? false,
      maxLength: widget.length,
      keyboardType: widget.inputType,
      maxLines: widget.inputLines,
      validator: widget.validatorFun ?? (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter ${widget.hintName}';
        }
        return null;
      },
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmit,
      onTap: widget.onTapped,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(ValueManager.vm10)),
          borderSide: BorderSide(color: ColorManager.primaryColor),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(ValueManager.vm10)),
          borderSide: BorderSide(color: ColorManager.primaryColor),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(ValueManager.vm10)),
          borderSide: BorderSide(color: ColorManager.redColor),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(ValueManager.vm10)),
          borderSide: BorderSide(color: ColorManager.redColor),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(ValueManager.vm10)),
          borderSide: BorderSide(color: ColorManager.greyColor),
        ),
        constraints: widget.height == null ? null : BoxConstraints( maxHeight: widget.height! ),
        suffixIcon: widget.isPass ? IconButton(
          icon: Icon(
            widget.passwordVisibility ? Icons.visibility : Icons.visibility_off,
            color: ColorManager.primaryColor,
          ),
          onPressed: () {
            setState(() {
              widget.passwordVisibility = !widget.passwordVisibility;
            });
          },
        ) : const SizedBox.shrink(),
        prefixIcon: widget.prefixShow == true ?
        SizedBox(
          height: 50, width: 80,
          child: CountryCodePicker(
            onChanged: widget.onChangedCode,
            initialSelection: 'PK',
            favorite: ['+92'],
            showCountryOnly: true,
            showOnlyCountryWhenClosed: true,
            alignLeft: true,
            padding: EdgeInsets.zero,
          ),
        ): null,
        hintText: widget.hintName!,
        hintStyle: TextStyle(fontSize: widget.fontSize, color: ColorManager.blackColor),
        labelText: widget.labelTxt,
        fillColor: widget.color,
        filled: true,
        counter: const SizedBox(),
      ),
      inputFormatters: widget.inputFormatters,
    );
  }
}
