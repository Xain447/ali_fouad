
import 'package:ali_fouad_app/src/utils/color_manager.dart';
import 'package:ali_fouad_app/src/utils/value_manager.dart';
import 'package:flutter/material.dart';

class BottomText extends StatelessWidget {
  final String firstTxt, secondTxt;
  const BottomText({super.key, required this.firstTxt, required this.secondTxt});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: firstTxt,
                style: const TextStyle(
                  color: ColorManager.primaryColor,
                  fontSize: ValueManager.vm16,
                  fontFamily: 'AlexandriaFLF',
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: secondTxt,
                style: const TextStyle(
                  color: ColorManager.primaryColor,
                  fontSize: ValueManager.vm18,
                  decoration: TextDecoration.underline,
                  fontFamily: 'AlexandriaFLF',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
