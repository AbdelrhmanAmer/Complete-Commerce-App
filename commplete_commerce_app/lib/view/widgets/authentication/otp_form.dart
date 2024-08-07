import 'package:commplete_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OTPForm extends StatelessWidget {
  const OTPForm({
    super.key,
    required this.controller,
    this.cellWidth = 50,
  });
  final dynamic controller;
  final double cellWidth;

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        gapPadding: 0,
        borderSide: BorderSide(
            color: Get.isDarkMode ? AppColor.lightWhite : AppColor.lightBlack));
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...List.generate(5, (index) {
            return SizedBox(
              width: cellWidth,
              child: TextFormField(
                autofocus: index == 0,
                focusNode: index == 0 ? null : controller.focusNodes[index - 1],
                keyboardType: TextInputType.number,
                style: Get.textTheme.labelLarge,
                decoration: InputDecoration(
                  border: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  focusedBorder: outlineInputBorder,
                  disabledBorder: outlineInputBorder,
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                ),
                textAlign: TextAlign.center,
                onChanged: (value) {
                  if (index < 4) {
                    controller.nextField(value, controller.focusNodes[index]);
                  } else {
                    controller.focusNodes[index - 1].unfocus();
                  }
                  controller.otpCode[index] = value;
                },
                inputFormatters: [LengthLimitingTextInputFormatter(1)],
              ),
            );
          }),
        ],
      ),
    );
  }
}
